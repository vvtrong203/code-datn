package fpoly.duantotnghiep.shoppingweb.dto.filter;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
@Data
@Getter
@Setter
public class VoucherDTOFiler {
    private String ma;
    private BigDecimal mucGiam;
    private BigDecimal mucGiamMax;
    private BigDecimal giaTriDonHang;

//    private Timestamp ngayKetThuc;
    private Integer hinhThucThanhToan;
    private Integer loaiMucGiam;
    private Integer trangThai;
    private Integer doiTuongSuDung;
    private Integer sort;
}
