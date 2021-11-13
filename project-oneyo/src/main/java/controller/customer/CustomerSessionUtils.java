package controller.customer;

import javax.servlet.http.HttpSession;

public class CustomerSessionUtils {
    public static final String CUSTOMER_SESSION_KEY = "email";

    /* 현재 로그인한 사용자의 email(ID)를 구함 */
    public static String getLoginCustomerId(HttpSession session) {
        String email = (String)session.getAttribute(CUSTOMER_SESSION_KEY);
        return email;
    }

    /* 로그인한 상태인지를 검사 */
    public static boolean hasLogined(HttpSession session) {
        if (getLoginCustomerId(session) != null) {
            return true;
        }
        return false;
    }

    /* 현재 로그인한 사용자의 ID가 email인지 검사 */
    public static boolean isLoginCustomer(String email, HttpSession session) {
        String loginCustomer = getLoginCustomerId(session);
        if (loginCustomer == null) {
            return false;
        }
        return loginCustomer.equals(email);
    }
}
