package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.order.*;
import controller.customer.*;
import controller.mealkit.*;
import controller.cart.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 媛� �슂泥� uri�뿉 ���븳 controller 媛앹껜瑜� ���옣�븷 HashMap �깮�꽦
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 媛� uri�뿉 ���쓳�릺�뒗 controller 媛앹껜瑜� �깮�꽦 諛� ���옣
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/customer/login/form", new ForwardController("/customer/loginForm.jsp"));
        mappings.put("/customer/login", new LoginController());
        mappings.put("/customer/logout", new LogoutController());
//        mappings.put("/user/list", new ListUserController());
//        mappings.put("/user/view", new ViewUserController());
        
        // �쉶�썝 媛��엯 �뤌 �슂泥�怨� 媛��엯 �슂泥� 泥섎━ 蹂묓빀 (�뤌�뿉 而ㅻ�ㅻ땲�떚 �꽑�깮 硫붾돱 異붽�瑜� �쐞�븿)
        mappings.put("/customer/register/form", new ForwardController("/customer/registerForm.jsp"));
        mappings.put("/customer/register", new RegisterCustomerController());
//        mappings.put("/user/register", new RegisterUserController());

        // �궗�슜�옄 �젙蹂� �닔�젙 �뤌 �슂泥�怨� �닔�젙 �슂泥� 泥섎━ 蹂묓빀
//      mappings.put("/user/update/form", new UpdateUserFormController());
//      mappings.put("/user/update", new UpdateUserController());        
        mappings.put("/customer/update", new UpdateCustomerController());
        
        mappings.put("/customer/delete", new DeleteCustomerController());
        
        // 怨좉컼 愿��젴 request URI
        mappings.put("/customer/mypage", new ViewCustomerController());
        
        //二쇰Ц 愿��젴 request URI
        mappings.put("/order/list", new OrderListController());
        mappings.put("/order/add", new AddOrderController());
        mappings.put("/order/delete", new DeleteOrderController());

        // �옣諛붽뎄�땲 愿��젴 request URI 異붽�
        mappings.put("/cart/list", new CartListController());
        mappings.put("/cart/update", new UpdateCartController());
        
        // mealkit愿��젴 request URI 異붽�
        mappings.put("/mealkit/list", new MealkitListController());
        mappings.put("/mealkit/detail", new ViewMealkitController());
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 二쇱뼱吏� uri�뿉 ���쓳�릺�뒗 controller 媛앹껜瑜� 李얠븘 諛섑솚
        return mappings.get(uri);
    }
}