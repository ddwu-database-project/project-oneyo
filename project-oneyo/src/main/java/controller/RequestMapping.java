package controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.cart.AddCartController;
import controller.cart.CartListController;
import controller.cart.DeleteCartController;
import controller.cart.UpdateCartController;
import controller.customer.DeleteCustomerController;
import controller.customer.LoginController;
import controller.customer.LogoutController;
import controller.customer.RegisterCustomerController;
import controller.customer.UpdateCustomerController;
import controller.customer.ViewCustomerController;
import controller.ingredient.SearchIngController;
import controller.mealkit.CustomMealkitIngController;
import controller.mealkit.MealkitListController;
import controller.mealkit.ViewMealkitController;
import controller.order.AddOrderController;
import controller.order.CartOrderController;
import controller.order.DeleteOrderController;
import controller.order.FormOrderController;
import controller.order.OrderListController;
import controller.share.AddShareController;
import controller.share.DeleteShareController;
import controller.share.ShareListController;
import controller.share.ShareMyListController;

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

        mappings.put("/share/list/my", new ShareMyListController());
        mappings.put("/share/list/all", new ShareListController());
        mappings.put("/share/add", new AddShareController());
        mappings.put("/share/delete", new DeleteShareController());
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
        return mappings.get(uri);
    }
}