package fpoly.duantotnghiep.shoppingweb.repository;

import fpoly.duantotnghiep.shoppingweb.model.ChiTietSanPhamModel;
import fpoly.duantotnghiep.shoppingweb.model.KieuDangModel;
import fpoly.duantotnghiep.shoppingweb.model.NhanVienModel;
import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
public interface IKieuDangRepository extends JpaRepository<KieuDangModel, String> {


    @Transactional
    @Modifying
    @Query("""
UPDATE KieuDangModel s SET s.ten = ?1 WHERE s.id = ?2
""")
    int update(String ten, String id);

    @Query("""
SELECT n FROM KieuDangModel n WHERE n.id LIKE %?1% OR n.ten LIKE %?1% 
""")
    Page<KieuDangModel> search(String keyWord, Pageable pageable);
}


