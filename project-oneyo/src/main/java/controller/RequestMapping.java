package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.order.*;
import controller.customer.*;
import controller.mealkit.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    // �� ��û uri�� ���� controller ��ü�� ������ HashMap ����
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// �� uri�� �����Ǵ� controller ��ü�� ���� �� ����
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/home", new ForwardController("/home/main.jsp"));
        mappings.put("/customer/login/form", new ForwardController("/customer/loginForm.jsp"));
        mappings.put("/customer/login", new LoginController());
        mappings.put("/customer/logout", new LogoutController());
        mappings.put("/customer/mypage", new ViewCustomerController());
        

        mappings.put("/user/register", new RegisterCustomerController());
        mappings.put("/customer/update", new UpdateCustomerController());
        mappings.put("/customer/delete", new DeleteCustomerController());
        
        //�ֹ� ���� URI
        mappings.put("/order/list", new OrderListController());
        mappings.put("/order/add", new AddOrderController());
        mappings.put("/order/delete", new DeleteOrderController());

        // ��ٱ��� ���� URI
        mappings.put("/cart/list", null);
        
        // mealkit ���� URI
        mappings.put("/mealkit/list", new MealkitListController());
        mappings.put("/mealkit/detail", new ViewMealkitController());
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// �־��� uri�� �����Ǵ� controller ��ü�� ã�� ��ȯ
        return mappings.get(uri);
    }
}