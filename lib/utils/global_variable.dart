import 'package:get/get.dart';

RxBool show = false.obs;
//api endpoints
RxString pid = ''.obs;
//String baseUrl = 'https://starfish-app-mfjab.ondigitalocean.app';
String baseUrl = 'http://127.0.0.1:8080';
String createUser = '/auth/register';
String userLogin = '/auth/login';
String allUsers = '/users/';
String createProfile = '/profile/createProfile';
String updateProfile = '/profile/updateProfile';
String profileById = '/profile/';
String deleteProfile = '/profile/deleteProfile/';
String allCategory = '/category/';
String createCategory = '/category/createCategory';
String deleteCategory = '/category/deleteCategory/';
String updateCategory = '/category/updateCategory';
String getAllPost = '/post';
String createPost = '/createPost';
String getAmenities = '/amenity/';
String createAmenities = '/amenity/createAmenity';
String updateAmenites = '/amenity/updateAmenity';
String deleteAmenities = '/amenity/deleteAmenity';
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
String deleteDeveloper = '/developer/deleteDeveloper';
String allFaq = '/faq/';
String createFaq = '/faq/createFaqQuestionAnswer';
String updateFaqUrl = '/faq/updateFaqQuestionAnswer';
String deleteFaq = '/faq/deleteFaqQuestionAnswer';
// RxBool themeMode = ThemeChangeController().isDarkMode;
