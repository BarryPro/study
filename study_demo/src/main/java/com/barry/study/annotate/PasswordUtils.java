package com.barry.study.annotate;

/**
 * 使用注解：
 *
 * @author yuchenglong03
 * @since 2019-06-12 17:49
 */
public class PasswordUtils {
    @UseCases(id="47",description="Passwords must contain at least one numeric")
    public boolean validatePassword(String password) {
        return (password.matches("\\w*\\d\\w*"));
    }

    @UseCases(id ="48")
    public String encryptPassword(String password) {
        return new StringBuilder(password).reverse().toString();
    }
}
