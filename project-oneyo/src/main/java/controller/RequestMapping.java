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

 // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/home", new ForwardController("/home/main.jsp"));
        mappings.put("/customer/login/form", new ForwardController("/customer/loginForm.jsp"));
        mappings.put("/customer/login", new LoginController());
        mappings.put("/customer/logout", new LogoutController());
        mappings.put("/customer/mypage", new ViewCustomerController());

        mappings.put("/user/register", new RegisterCustomerController());
        mappings.put("/customer/update", new UpdateCustomerController());
        mappings.put("/customer/delete", new DeleteCustomerController());
        
        //주문 관련 URI
        mappings.put("/order/list", new OrderListController());
        mappings.put("/order/add", new AddOrderController());
        mappings.put("/order/delete", new DeleteOrderController());

        // 장바구니 관련 URI
        mappings.put("/cart/list", null);
        
        // mealkit 관련 URI
        mappings.put("/mealkit/list", new MealkitListController());
        mappings.put("/mealkit/detail", new ViewMealkitController());
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}