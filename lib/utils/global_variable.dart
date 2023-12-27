import 'package:get/get.dart';

RxBool show = false.obs;
RxString pid = ''.obs;
RxString iconFontFamily = "MaterialIcons".obs;

// Live api endpoints
String baseUrl = 'https://server-pwo2qiqgmq-uc.a.run.app';

// local api endpoint
// String baseUrl = 'http://127.0.0.1:8080';


var height = Get.height.obs;
var width = Get.width.obs;

String createUser = '/auth/register';
String userLogin = '/auth/login';
String allUsers = '/users/';
String createProfile = '/profile/createProfile';
String updateProfile = '/profile/updateProfile';
String profileById = '/profile/';
String deleteProfile = '/profile/deleteProfile/';
String allCategory = '/category/';
String subCategoryUrl = 'subCategories/';
String createCategory = '/category/createCategory';
String deleteCategory = '/category/deleteCategory/';
String updateCategory = '/category/updateCategory';
String getAllPost = '/post';
String createPost = '/post/createPost';
String updatePostUrl = '/post/updatePost';
String deletePost = '/post/deletePost/';
String getAmenities = '/amenity/';
String createAmenities = '/amenity/createAmenity';
String updateAmenites = '/amenity/updateAmenity';
String deleteAmenities = '/amenity/deleteAmenity/';
String createProject = '/project/createProject';
String updateProjectUrl = '/project/updateProject';
String allProject = '/project/';
String deleteProject = '/project/deleteProject';
String createProjectNearByPlaces =
    '/projectNearByPlaces/createProjectNearByPlace';
String updateProjectNearByPlacesUrl =
    '/projectNearByPlaces/updateProjectNearByPlace';
String getProjectNearByPlaces = '/projectNearByPlaces/';
String deleteProjectNearByPlaces =
    '/projectNearByPlaces/deleteProjectNearByPlace';
String getAgency = '/agency';
String createAgency = '/agency/createAgency';
String updateAgencyUrl = '/agency/updateAgency';
String deleteAgency = '/agency/deleteAgency';
String allBlogs = '/blog/';
String createBlog = '/blog/createBlog';
String updateBlogUrl = '/blog/updateBlog';
String deleteBlog = '/blog/deleteBlog';
String allBlogCategory = '/blogCategory';
String createBlogCategory = '/blogCategory/createBlogCategory';
String updateBlogCategory = '/blogCategory/updateBlogCategory';
String deleteBlogCategory = '/blogCategory/deleteBlogCategory';
String createDeveloper = '/developer/createDeveloper';
String allDevelopers = '/developer/';
String updateDeveloperUrl = '/developer/updateDeveloper';
String deleteDeveloper = '/developer/deleteDeveloper/';
String allFaq = '/faq/';
String createFaq = '/faq/createFaqQuestionAnswer';
String updateFaqUrl = '/faq/updateFaqQuestionAnswer';
String deleteFaq = '/faq/deleteFaqQuestionAnswer';
String allFaqGroup = '/faqGroup/';
String createFaqGroup = '/faqGroup/createFaqGroup';
String updateFaqGroupUrl = '/faqGroup/updateFaqGroup';
String deleteFaqGroup = '/faqGroup/deleteFaqGroup';
String allFloorPlan = '/floorPlan/';
String createFloorPlan = '/floorPlan/createFloorPlan';
String updateFloorPlanUrl = '/floorPlan/updateFloorPlan';
String deleteFloorPlan = '/floorPlan/deleteFloorPlan';
String allForumPost = '/forumPost/';
String createForumPost = '/forumPost/createForumPost';
String updateForumPostUrl = '/forumPost/updateForumPost';
String deleteForumPost = '/forumPost/deleteForumPost';
String allForumPostComment = '/forumPostComment/';
String createForumPostComment = '/forumPostComment/createForumPostComment';
String updateForumPostCommentUrl = '/forumPostComment/updateForumPostComment';
String deleteForumPostComment = '/forumPostComment/deleteForumPostComment';
String allOrders = '/order/';
String createOrder = '/order/createOrder';
String updateOrderUrl = '/order/updateOrder';
String deleteOrder = '/order/deleteOrder';
String allPostCommentByUserID = '/postComment/user/';
String allPostCommentByPostID = '/postComment/post/';
String createPostComment = '/postComment/createPostComment';
String updatePostComment = '/postComment/updatePostComment';
String deletePostComment = '/postComment/deletePostComment/';
String allPages = '/page/';
String createPage = '/page/createPage';
String updatePageUrl = '/page/updatePage';
String deletePage = '/page/deletePage';
String allPaymentMethod = '/paymentMethod/';
String createPaymentMethod = '/paymentMethod/createPaymentMethod';
String updatePaymentMethodUrl = '/paymentMethod/updatePaymentMethod';
String deletePaymentMethod = '/paymentMethod/deletePaymentMethod';
String allProduct = '/product/';
String createProduct = '/product/createProduct';
String updateProductUrl = '/product/updateProduct';
String deleteProduct = '/product/deleteProduct';
String wishListByUserId = '/wishlist/user/';
String addToWishListUrl = '/wishlist/addToWishlist';
String removeFromWishListUrl = '/wishlist/deleteFromWishlit';
//---
String allReview = '/review';
String createReview = '/createReview';
String reviewByPostId = '/post/';
String updateReviewUrl = '/updateReview';
String deleteReview = '/deleteReview/';
// RxBool themeMode = ThemeChangeController().isDarkMode;
String getContactDetailsUrl = '/postContact/';
