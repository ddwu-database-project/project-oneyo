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

 // 媛� ��泥� uri�� ���� controller 媛�泥대�� ���ν�� HashMap ����
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 揶�占� uri占쎈� 占쏙옙占쎌�놂옙由븝옙�� controller 揶��밴���占� 占쎄문占쎄쉐 獄�占� 占쏙옙占쎌��
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/home", new ForwardController("/home/main.jsp"));
        mappings.put("/customer/login/form", new ForwardController("/customer/loginForm.jsp"));
        mappings.put("/customer/login", new LoginController());
        mappings.put("/customer/logout", new LogoutController());
//        mappings.put("/user/list", new ListUserController());
//        mappings.put("/user/view", new ViewUserController());
        
        // 占쎌�띰옙�� 揶�占쏙옙�� 占쎈� 占쎌��筌ｏ옙�⑨옙 揶�占쏙옙�� 占쎌��筌ｏ옙 筌ｌ���� 癰�臾�鍮� (占쎈�占쎈� ���삼옙�삳�뀐옙�� 占쎄�占쎄문 筌�遺얜�� �곕떽占썹��占� 占쎌��占쎈맙)
        mappings.put("/customer/register/form", new ForwardController("/customer/registerForm.jsp"));
        mappings.put("/customer/register", new RegisterCustomerController());
//        mappings.put("/user/register", new RegisterUserController());

        // 占쎄�占쎌��占쎌�� 占쎌��癰�占� 占쎈��占쎌�� 占쎈� 占쎌��筌ｏ옙�⑨옙 占쎈��占쎌�� 占쎌��筌ｏ옙 筌ｌ���� 癰�臾�鍮�
//      mappings.put("/user/update/form", new UpdateUserFormController());
//      mappings.put("/user/update", new UpdateUserController());        
        mappings.put("/customer/mypage", new ViewCustomerController());
        mappings.put("/uustomer/register", new RegisterCustomerController());
        mappings.put("/customer/update", new UpdateCustomerController());
        mappings.put("/customer/delete", new DeleteCustomerController());
        
        // �⑥�而� �울옙占쎌�� request URI
        mappings.put("/customer/mypage", new ViewCustomerController());
        
        //雅��겆� �울옙占쎌�� request URI
        //二쇰Ц 愿��� URI
        mappings.put("/order/list", new OrderListController());
        mappings.put("/order/add", new AddOrderController());
        mappings.put("/order/delete", new DeleteOrderController());


        // 占쎌�ｈ�遺쎈��占쎈�� �울옙占쎌�� request URI �곕떽占�
        mappings.put("/cart/list", new CartListController());
        
        // mealkit�울옙占쎌�� request URI �곕떽占�
        // �λ�援щ�� 愿��� URI
        mappings.put("/cart/list", null);
        
        // mealkit 愿��� URI
        mappings.put("/mealkit/list", new MealkitListController());
        mappings.put("/mealkit/detail", new ViewMealkitController());
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 雅��깅선筌�占� uri占쎈� 占쏙옙占쎌�놂옙由븝옙�� controller 揶��밴���占� 筌≪��釉� 獄�����
        return mappings.get(uri);
    }
}