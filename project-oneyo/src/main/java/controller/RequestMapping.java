package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.order.*;
import controller.customer.*;
import controller.mealkit.*;
import controller.cart.*;
import controller.ingredient.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);

    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {

        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/home", new ForwardController("/home/main.jsp"));
        mappings.put("/customer/login/form", new ForwardController("/customer/loginForm.jsp"));
        mappings.put("/customer/login", new LoginController());
        mappings.put("/customer/logout", new LogoutController());
        mappings.put("/customer/mypage", new ViewCustomerController());

        mappings.put("/customer/register", new RegisterCustomerController());
        mappings.put("/customer/update", new UpdateCustomerController());
        mappings.put("/customer/delete", new DeleteCustomerController());
        
        mappings.put("/ingredient/search", new SearchIngController());

        mappings.put("/order/list", new OrderListController());
        mappings.put("/order/add", new AddOrderController());
        mappings.put("/order/delete", new DeleteOrderController());
        mappings.put("/order/cart", new CartOrderController());
        mappings.put("/order/form", new FormOrderController());

        mappings.put("/cart/list", new CartListController());
        mappings.put("/cart/add", new AddCartController());
        mappings.put("/cart/update", new UpdateCartController());
        mappings.put("/cart/delete", new DeleteCartController());

        mappings.put("/mealkit/list", new MealkitListController());
        mappings.put("/mealkit/detail", new ViewMealkitController());
        mappings.put("/mealkit/custom", new CustomMealkitIngController());

        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
        return mappings.get(uri);
    }
}