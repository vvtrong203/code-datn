package fpoly.duantotnghiep.shoppingweb.dto.request;

import fpoly.duantotnghiep.shoppingweb.model.NhanVienModel;
import fpoly.duantotnghiep.shoppingweb.model.VaiTroModel;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NhanVienDtoRequest {
    @NotBlank(message = "Không để trống username")
    @Pattern(regexp = "[a-zA-Z0-9]{1,20}",message = "username chỉ chứa chữ và số, và giới hạn 20 ký tự")
    private String username;

    @NotBlank(message = "Vui lòng chọn vai trò")
    private String vaiTro;
    private String password;

    @NotBlank(message = "Không để trống họ và tên")
    @Size(max = 100,message = "Họ và tên tối đa 100 ký tự")
    private String hoVaTen;

    //    @NotNull(message = "Giới tính không được để trống")
    private Boolean gioiTinh;

    @NotNull(message = "Ngày sinh không được để trống")
    @Past(message = "Ngày sinh phải là một ngày trong quá khứ")
    private LocalDate ngaySinh;

    @NotBlank(message = "Không để trống số điện thoại")
    @Pattern(regexp = "0\\d{9}",message = "Số điện thoại không đúng định dạng")
    private String soDienThoai;

    @NotBlank(message = "Không để trống email")
    @Email(message = "Email không đúng định dạng")
    @Pattern(regexp = "^[\\w-\\.]+@(gmail\\.com|fpt\\.edu\\.vn)$", message = "Email phải có đuôi @gmail.com hoặc @fpt.edu.vn")
    private String email;

    private String anhDaiDien;

    public NhanVienModel mapToModel(){
        NhanVienModel nhanVienModel = new NhanVienModel();
        nhanVienModel.setUsername(username);

        VaiTroModel vaiTroModel = new VaiTroModel();
        vaiTroModel.setMa(vaiTro);
        nhanVienModel.setVaiTro(vaiTroModel);

        nhanVienModel.setPassword(password);
        nhanVienModel.setHoVaTen(hoVaTen);
        nhanVienModel.setGioiTinh(gioiTinh);
        nhanVienModel.setNgaySinh(ngaySinh);
        nhanVienModel.setSoDienThoai(soDienThoai);
        nhanVienModel.setEmail(email);
        nhanVienModel.setAnhDaiDien(anhDaiDien);

        return nhanVienModel;
    }


}
