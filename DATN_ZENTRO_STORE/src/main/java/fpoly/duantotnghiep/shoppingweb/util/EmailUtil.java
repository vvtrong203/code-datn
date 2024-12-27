package fpoly.duantotnghiep.shoppingweb.util;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Service
public class EmailUtil {
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private TemplateEngine templateEngine;
    private static JavaMailSender javaMailSenderStatic;
    private static TemplateEngine templateEngineStatic;


    public static void sendEmail(String email, String subject, String content) throws MessagingException {
        MimeMessage mimeMessage = javaMailSenderStatic.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"utf-8");
        helper.setTo(email);
        helper.setSubject(subject);
        helper.setText(content);

        javaMailSenderStatic.send(mimeMessage);
    }

    public static void sendEmailWithHtml(String email, String subject, String tempalteHtml, Context context) throws MessagingException {
        MimeMessage mimeMessage = javaMailSenderStatic.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"utf-8");
        helper.setTo(email);
        helper.setSubject(subject);
        String htmlContent = templateEngineStatic.process(tempalteHtml,context);
        helper.setText(htmlContent,true);
        javaMailSenderStatic.send(mimeMessage);
    }

    @Autowired
    public void setJavaMailSenderStatic(JavaMailSender javaMailSenderStatic) {
        EmailUtil.javaMailSenderStatic = javaMailSenderStatic;
    }
    @Autowired
    public void setTemplateEngineStatic(TemplateEngine templateEngine) {
        EmailUtil.templateEngineStatic = templateEngine;
    }
}
