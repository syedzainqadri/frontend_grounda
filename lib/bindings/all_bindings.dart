import 'package:frontend_grounda/controllers/agencyController/agency_controller.dart';
import 'package:frontend_grounda/controllers/amenitiesController/amenities_controller.dart';
import 'package:frontend_grounda/controllers/blogsController/blogs_controller.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/customerController/customer_controller.dart';
import 'package:frontend_grounda/controllers/dashboardController/dashboard_controller.dart';
import 'package:frontend_grounda/controllers/developerController/developer_controller.dart';
import 'package:frontend_grounda/controllers/faqController/faq_controller.dart';
import 'package:frontend_grounda/controllers/faqController/faq_group_controller.dart';
import 'package:frontend_grounda/controllers/floorPlanController/floor_plan_controller.dart';
import 'package:frontend_grounda/controllers/forumPost/forum_post_comment_controller.dart';
import 'package:frontend_grounda/controllers/forumPost/forum_post_controller.dart';
import 'package:frontend_grounda/controllers/menuController/sidebar_controller.dart';
import 'package:frontend_grounda/controllers/orderController/order_controller.dart';
import 'package:frontend_grounda/controllers/pageController.dart/page_controller.dart';
import 'package:frontend_grounda/controllers/paymentMethodController/payment_method_controller.dart';
import 'package:frontend_grounda/controllers/postController/post_comment_controller.dart';
import 'package:frontend_grounda/controllers/postController/post_controller.dart';
import 'package:frontend_grounda/controllers/productsController/products_controller.dart';
import 'package:frontend_grounda/controllers/profileController/profile_controller.dart';
import 'package:frontend_grounda/controllers/projectController/projectNearByPlaces_controller.dart';
import 'package:frontend_grounda/controllers/projectController/project_controller.dart';
import 'package:frontend_grounda/controllers/reviewController/review_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_controller.dart';
import 'package:frontend_grounda/controllers/whishListController/wishList_controller.dart';
import 'package:get/instance_manager.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeChangeController());
    Get.lazyPut(() => ThemeController());
    Get.lazyPut<SideBarController>(() => SideBarController());
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);
    Get.lazyPut<PostController>(() => PostController(), fenix: true);
    Get.lazyPut<AgencyController>(() => AgencyController(), fenix: true);
    Get.lazyPut<AmenitiesController>(() => AmenitiesController(), fenix: true);
    Get.lazyPut<BlogController>(() => BlogController(), fenix: true);
    Get.lazyPut<DeveloperController>(() => DeveloperController(), fenix: true);
    Get.lazyPut<FaqController>(() => FaqController(), fenix: true);
    Get.lazyPut<FaqGroupController>(() => FaqGroupController(), fenix: true);
    Get.lazyPut<FloorPlanController>(() => FloorPlanController(), fenix: true);
    Get.lazyPut<ForumPostController>(() => ForumPostController(), fenix: true);
    Get.lazyPut<ForumPostCommentController>(() => ForumPostCommentController(),
        fenix: true);
    Get.lazyPut<OrderController>(() => OrderController(), fenix: true);
    Get.lazyPut<PageController>(() => PageController(), fenix: true);
    Get.lazyPut<ProductsController>(() => ProductsController(), fenix: true);
    Get.lazyPut<PostCommentController>(() => PostCommentController(),
        fenix: true);
    Get.lazyPut<ReviewsController>(() => ReviewsController(), fenix: true);
    Get.lazyPut<ProjectController>(() => ProjectController(), fenix: true);
    Get.lazyPut<WishListController>(() => WishListController(), fenix: true);
    Get.lazyPut<CustomerController>(() => CustomerController(), fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.lazyPut<PaymentMethodController>(() => PaymentMethodController(),
        fenix: true);
    Get.lazyPut<ProjectNearByPlacesController>(
        () => ProjectNearByPlacesController(),
        fenix: true);
    // Get.lazyPut<LocationService>(() => LocationService(), fenix: true);
  }
}
