import 'package:frontend_grounda/services/intialNavigation.dart';
import 'package:frontend_grounda/views/pages/agency/agency_page.dart';
import 'package:frontend_grounda/views/pages/category/category_page.dart';
import 'package:frontend_grounda/views/pages/customer/customer_page.dart';
import 'package:frontend_grounda/views/pages/developer/developer_page.dart';
import 'package:frontend_grounda/views/pages/forum/forum_page.dart';
import 'package:frontend_grounda/views/pages/login/login_view.dart';
import 'package:frontend_grounda/views/pages/post/post_page.dart';
import 'package:frontend_grounda/views/dashboard_view.dart';
import 'package:frontend_grounda/views/pages/product/product_page.dart';
import 'package:frontend_grounda/views/pages/project/project_page.dart';
import 'package:frontend_grounda/views/pages/support/support_page.dart';
import 'package:get/route_manager.dart';

appRoutes() => [
      GetPage(name: '/', page: () => InitialNavigation()),
      GetPage(name: '/dashboard', page: () => const DashboardView()),
      GetPage(name: '/category', page: () => CategoryPage()),
      GetPage(name: '/post', page: () => PostPage()),
      GetPage(name: '/project', page: () => ProjectPage()),
      GetPage(name: '/developer', page: () => DeveloperPage()),
      GetPage(name: '/product', page: () => ProductPage()),
      GetPage(name: '/agency', page: () => AgencyPage()),
      GetPage(name: '/customer', page: () => CustomerPage()),
      GetPage(name: '/forum', page: () => const ForumPage()),
      GetPage(name: '/support', page: () => const SupportPage()),
      GetPage(name: '/login', page: () => LoginView()),
    ];
