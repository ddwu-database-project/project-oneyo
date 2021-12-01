package controller.customer;

import javax.servlet.http.HttpSession;

public class CustomerSessionUtils {
    public static final String CUSTOMER_SESSION_KEY = "email";
    public static final String CUSTOMER_SESSION_ADMIN = "admin";

    public static String getLoginCustomerId(HttpSession session) {
        String email = (String)session.getAttribute(CUSTOMER_SESSION_KEY);
        return email;
    }

    public static boolean hasLogined(HttpSession session) {
        if (getLoginCustomerId(session) != null) {
            return true;
        }
        return false;
    }

    public static boolean isLoginCustomer(String email, HttpSession session) {
        String loginCustomer = getLoginCustomerId(session);
        if (loginCustomer == null) {
            return false;
        }
        return loginCustomer.equals(email);
    }
    
    public static boolean isAdminUser(HttpSession session) {
    	if (getLoginCustomerId(session) != null 
    			&& (int)session.getAttribute(CUSTOMER_SESSION_ADMIN) == 1) {
    		return true;
    	}
    	return false;
    }
}
