package fpoly.duantotnghiep.shoppingweb.entitymanager;

import fpoly.duantotnghiep.shoppingweb.dto.filter.VoucherDTOFiler;
import fpoly.duantotnghiep.shoppingweb.dto.reponse.VoucherReponse;
import fpoly.duantotnghiep.shoppingweb.model.VoucherModel;
import fpoly.duantotnghiep.shoppingweb.repository.VoucherRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class VoucherEntityManager {
    @Autowired
    private EntityManager entityManager;
    @Autowired
    private VoucherRepository voucherRepository;

    public Page<VoucherReponse> filterVoucherEntity(VoucherDTOFiler voucherDTOFiler, Integer pageNumber, Integer limit) {
        StringBuilder jpql = new StringBuilder("select v FROM VoucherModel v WHERE v.trangThaiXoa = 0");

        if (voucherDTOFiler.getMa() != null && !voucherDTOFiler.getMa().isEmpty()) {
            jpql.append(" AND (v.ma LIKE :ma)");
        }
        if (voucherDTOFiler.getTrangThai() != null) {
            jpql.append(" AND v.trangThai = :trangThai");
        }
        if (voucherDTOFiler.getLoaiMucGiam() != null) {
            if (voucherDTOFiler.getLoaiMucGiam() == 0)
                jpql.append(" AND v.loaiMucGiam = 'PHAN TRAM'");
            if (voucherDTOFiler.getLoaiMucGiam() == 1)
                jpql.append(" AND v.loaiMucGiam = 'TIEN'");
        }
        if (voucherDTOFiler.getGiaTriDonHang() != null) {
            jpql.append(" AND v.giaTriDonHang >= :giaTriDonHang");
        }
        if (voucherDTOFiler.getMucGiam() != null) {
            jpql.append(" AND v.mucGiam >= :mucGiam");
        }
        if (voucherDTOFiler.getMucGiamMax() != null) {
            jpql.append(" AND v.mucGiam <= :mucGiamMax");
        }
        if (voucherDTOFiler.getDoiTuongSuDung() != null) {
            jpql.append(" AND v.doiTuongSuDung = :doiTuongSuDung");
        }
        if (voucherDTOFiler.getHinhThucThanhToan() != null) {
            jpql.append(" AND v.hinhThucThanhToan = :hinhThucThanhToan");
        }

        if (voucherDTOFiler.getSort() != null) {
            switch (voucherDTOFiler.getSort()) {
                case 3:
                    jpql.append(" ORDER BY v.mucGiam ASC");
                    break;
                case 4:
                    jpql.append(" ORDER BY v.mucGiam DESC");
                    break;
                case 0:
                    jpql.append(" ORDER BY v.ngayBatDau DESC");
                    break;
                case 2:
                    jpql.append(" ORDER BY v.ngayKetThuc ASC");
                    break;
            }
        }

        Query query = entityManager.createQuery(jpql.toString());

        // Setting parameters
        if (voucherDTOFiler.getMa() != null && !voucherDTOFiler.getMa().isEmpty()) {
            query.setParameter("ma", "%" + voucherDTOFiler.getMa() + "%");
        }
        if (voucherDTOFiler.getTrangThai() != null) {
            query.setParameter("trangThai", voucherDTOFiler.getTrangThai());
        }
        if (voucherDTOFiler.getGiaTriDonHang() != null) {
            query.setParameter("giaTriDonHang", voucherDTOFiler.getGiaTriDonHang());
        }
        if (voucherDTOFiler.getMucGiam() != null) {
            query.setParameter("mucGiam", voucherDTOFiler.getMucGiam());
        }
        if (voucherDTOFiler.getMucGiamMax() != null) {
            query.setParameter("mucGiamMax", voucherDTOFiler.getMucGiamMax());
        }
        if (voucherDTOFiler.getDoiTuongSuDung() != null) {
            query.setParameter("doiTuongSuDung", voucherDTOFiler.getDoiTuongSuDung());
        }
        if (voucherDTOFiler.getHinhThucThanhToan() != null) {
            query.setParameter("hinhThucThanhToan", voucherDTOFiler.getHinhThucThanhToan());
        }

        List<VoucherModel> listContent = query.getResultList();
        Pageable pageable = PageRequest.of(pageNumber, limit);
        Page<VoucherModel> pageVoucher = voucherRepository.findAllVoucher(pageable);

        return new PageImpl<>(
                listContent.stream().skip(pageable.getOffset()).limit(limit).map(VoucherReponse::new).collect(Collectors.toList()),
                pageable,
                pageVoucher.getTotalElements()
        );
    }
}
