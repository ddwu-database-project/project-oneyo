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
        mappings.put("/customer/login/form", new ForwardController("/customer/loginForm.jsp"));
        mappings.put("/customer/login", new LoginController());
        mappings.put("/customer/logout", new LogoutController());
//        mappings.put("/user/list", new ListUserController());
//        mappings.put("/user/view", new ViewUserController());
        
        // 회원 가입 폼 요청과 가입 요청 처리 병합 (폼에 커뮤니티 선택 메뉴 추가를 위함)
        mappings.put("/customer/register/form", new ForwardController("/customer/registerForm.jsp"));
        mappings.put("/customer/register", new RegisterCustomerController());
//        mappings.put("/user/register", new RegisterUserController());

        // 사용자 정보 수정 폼 요청과 수정 요청 처리 병합
//      mappings.put("/user/update/form", new UpdateUserFormController());
//      mappings.put("/user/update", new UpdateUserController());        
        mappings.put("/customer/update", new UpdateCustomerController());
        
        mappings.put("/customer/delete", new DeleteCustomerController());
        
        // 고객 관련 request URI
        mappings.put("/customer/mypage", new ViewCustomerController());
        
        //주문 관련 request URI
        mappings.put("/order/list", new OrderListController());
        mappings.put("/order/add", new AddOrderController());
        mappings.put("/order/delete", new DeleteOrderController());

        // 장바구니 관련 request URI 추가
        mappings.put("/cart/list", null);
        
        // mealkit관련 request URI 추가
        mappings.put("/mealkit/list", new MealkitListController());
        mappings.put("/mealkit/detail", new ViewMealkitController());
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}