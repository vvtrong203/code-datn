package fpoly.duantotnghiep.shoppingweb.restcontroller.user;

import fpoly.duantotnghiep.shoppingweb.dto.reponse.KhachHangDtoResponse;
import fpoly.duantotnghiep.shoppingweb.dto.request.KhachHangDTORequest;
import fpoly.duantotnghiep.shoppingweb.dto.request.NhanVienDtoRequest;
import fpoly.duantotnghiep.shoppingweb.dto.security.ResetPasswordDto;
import fpoly.duantotnghiep.shoppingweb.model.VoucherModel;
import fpoly.duantotnghiep.shoppingweb.repository.IKhachHangRepository;
import fpoly.duantotnghiep.shoppingweb.repository.VoucherRepository;
import fpoly.duantotnghiep.shoppingweb.service.IKhachHangService;
import fpoly.duantotnghiep.shoppingweb.service.VoucherService;
import fpoly.duantotnghiep.shoppingweb.util.ValidateUtil;
import jakarta.mail.MessagingException;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import java.io.IOException;
import java.util.Date;

@RestController
@RequestMapping("/khach-hang")
public class khachHangRestController {

    @Autowired
    private IKhachHangService khachHangService;
    @Autowired

    private VoucherService vc;


    @PostMapping("")
    public ResponseEntity<?> add(@Valid @RequestBody KhachHangDTORequest khachHang,
                                 BindingResult result) throws MessagingException {
        if (khachHang.getUsername() != null && !khachHang.getUsername().isBlank()) {
            if (khachHangService.exsistsByUsername(khachHang.getUsername())) {
                result.addError(new FieldError("username", "username", "Username đã tồn tại"));
                if (!result.hasErrors())
                    return ValidateUtil.getErrors(result);
            }
        }

        if (result.hasErrors())
            return ValidateUtil.getErrors(result);
        return ResponseEntity.ok(khachHangService.add(khachHang));
    }

    @GetMapping("getUser")
    public ResponseEntity<?> getUserKhachHang(Authentication authentication) {
        String username = authentication.getName();
        return ResponseEntity.ok(khachHangService.findById(username));
    }
  
    @GetMapping("bd")
    public ResponseEntity<?> getUserKhachHang11(){
        return ResponseEntity.ok(vc.findById("EYOQIG6S"));
    }

    @PutMapping("update")
    public ResponseEntity<?> updateKhachHang(@Valid @RequestBody KhachHangDTORequest khachHang,
                                             BindingResult result) {
        if (khachHang.getUsername() != null && !khachHang.getUsername().isBlank()) {
            if (!khachHangService.exsistsByUsername(khachHang.getUsername())) {
                result.addError(new FieldError("username", "username", "Username Không tồn tại"));
                if (!result.hasErrors()) return ValidateUtil.getErrors(result);
            }
        }
        if (result.hasErrors()) return ValidateUtil.getErrors(result);
        return ResponseEntity.ok(khachHangService.update(khachHang));
    }

    @PutMapping(value = "")
    public ResponseEntity<?> updateKhachHang(@Valid @RequestPart("ThongTinKhachHang") KhachHangDTORequest
                                                     khachHang,
                                             BindingResult result,
                                             @RequestPart(value = "img", required = false) MultipartFile img) throws IOException {
        if (khachHang.getUsername() != null && !khachHang.getUsername().isBlank()) {
            if (!khachHangService.exsistsByUsername(khachHang.getUsername())) {
                result.addError(new FieldError("username", "username", "Username Không tồn tại"));
                if (!result.hasErrors()) return ValidateUtil.getErrors(result);
            }
        }

        if (result.hasErrors()) return ValidateUtil.getErrors(result);

        return ResponseEntity.ok(khachHangService.update(khachHang, img));
    }


}
