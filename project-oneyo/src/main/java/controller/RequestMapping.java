package controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.admin.*;
import controller.cart.*;
import controller.customer.*;
import controller.ingredient.*;
import controller.mealkit.*;
import controller.order.*;
import controller.review.*;
import controller.share.*;
import controller.home.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);

    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {

        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/home", new HomeController());
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
      
        mappings.put("/review/review", new ReviewController());
        mappings.put("/review/list", new ReviewListController());
        mappings.put("/review/add", new AddReviewController());
        mappings.put("/review/delete", new DeleteReviewController());

        mappings.put("/cart/list", new CartListController());
        mappings.put("/cart/add", new AddCartController());
        mappings.put("/cart/update", new UpdateCartController());
        mappings.put("/cart/delete", new DeleteCartController());

        mappings.put("/mealkit/list", new MealkitListController());
        mappings.put("/mealkit/detail", new ViewMealkitController());
        mappings.put("/mealkit/custom", new CustomMealkitIngController());
       
        mappings.put("/share/list", new ShareListController());
        mappings.put("/share/add", new AddShareController());
        mappings.put("/share/delete", new DeleteShareController());
        mappings.put("/share/cart/add", new AddShareCartController());
        
        mappings.put("/admin/mealkit/list", new AdminMkListController());
        mappings.put("/admin/mealkit/add", new AdminAddMealkitController());
        mappings.put("/admin/mealkit/remove", new AdminRemoveMkController());
        mappings.put("/admin/ing/new", new AdminAddIngController());
        mappings.put("/admin/ing/add", new AdminSetIngController());
        mappings.put("/admin/ing/list", new AdminIngListController());
        mappings.put("/admin/ing/remove", new AdminRemoveIngController());
        mappings.put("/admin/mealkit/modify", new AdminModMkController());
        mappings.put("/admin/ing/modify", new AdminModIngController());
        mappings.put("/admin/ing/create", new AdminQtyIngController());

        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
        return mappings.get(uri);
    }
}