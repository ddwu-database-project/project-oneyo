package controller.customer;

import javax.servlet.http.HttpSession;

public class CustomerSessionUtils {
    public static final String CUSTOMER_SESSION_KEY = "email";

    /* ���� �α����� ������� email(ID)�� ���� */
    public static String getLoginCustomerId(HttpSession session) {
        String email = (String)session.getAttribute(CUSTOMER_SESSION_KEY);
        return email;
    }

    /* �α����� ���������� �˻� */
    public static boolean hasLogined(HttpSession session) {
        if (getLoginCustomerId(session) != null) {
            return true;
        }
        return false;
    }

    /* ���� �α����� ������� ID�� email���� �˻� */
    public static boolean isLoginCustomer(String email, HttpSession session) {
        String loginCustomer = getLoginCustomerId(session);
        if (loginCustomer == null) {
            return false;
        }
        return loginCustomer.equals(email);
    }
}
