package fpoly.duantotnghiep.shoppingweb.config.security;

import fpoly.duantotnghiep.shoppingweb.enumtype.Roles;
import fpoly.duantotnghiep.shoppingweb.service.seucrity.CustomerService;
import fpoly.duantotnghiep.shoppingweb.service.seucrity.UserAdminService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@Order(1)
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityAdminConfig {
    private final UserAdminService userAdminService;

    public SecurityAdminConfig(UserAdminService userAdminService) {
        this.userAdminService = userAdminService;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        String[] adminPermitAll = {"/admin/AngularJs/**", "/admin/assets/**", "/admin/css/**", "/admin/images/**", "/admin/js/**",
                "/admin/quen-mat-khau", "/image/**", "/admin/dat-lai-mat-khau/**","/admin/quen-mat-khau/xac-nhan",
                "/admin/AngularJS/CheckOut.js","/admin/AngularJS/DonHang.js","/admin/AngularJS/DanhSachYeuThichJS.js",
                "/admin/mau-sac/find-all","/admin/chat-lieu/find-all","/admin/thuong-hieu/find-all","/admin/xuat-xu/find-all","/admin/kieu-dang/find-all"};
        String[] adminUrl = {"/admin/san-pham/add","/admin/san-pham/update/**","/admin/san-pham/delete/**"
                            ,"/admin/san-pham/update-TrangThai-HienThi/**","/admin/nhan-vien/**","/admin/kieu-dang/**",
                            "/admin/mau-sac/**","/admin/dong-san-pham/**","/admin/thuong-hieu/**","/admin/thong-ke/**","/admin/nhan-xet/phe-duyet/**",
                            "/admin/chat-lieu/**"};
        http    .securityMatcher("/admin/**")
                .cors(c -> c.disable())
                .csrf(c -> c.disable())
                .authorizeHttpRequests(requests -> requests
                                .requestMatchers(adminPermitAll).permitAll()
                                .requestMatchers("/admin/nhan-vien/thong-tin-ca-nhan","/admin/nhan-vien/getUser","/admin/nhan-vien/is-admin")
                                .hasAnyAuthority(Roles.ADMIN.name(),Roles.STAFF.name())

                                .requestMatchers(adminUrl).hasAuthority(Roles.ADMIN.name())
                                .requestMatchers("/admin/**","/admin/nhan-vien/thong-tin-ca-nhan","/admin/nhan-xet/**").hasAnyAuthority(Roles.ADMIN.name(),Roles.STAFF.name())
                                .anyRequest().permitAll()
                )
                .userDetailsService(userAdminService)
                .formLogin(login -> login.loginPage("/admin/login")
                        .loginProcessingUrl("/admin/login")
                        .defaultSuccessUrl("/admin/trang-chu", false)
                        .failureUrl("/admin/login/error")
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .permitAll()
                )
                .exceptionHandling(han -> han.accessDeniedPage("/security/unauthoried"))
                .logout(l -> l
                        .logoutUrl("/admin/logout")
                                .logoutSuccessUrl("/admin/login")
                                .invalidateHttpSession(true)
                                .deleteCookies("JSESSIONID")
                                .clearAuthentication(true)
                );

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }
}
