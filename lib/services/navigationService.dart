import 'package:frontend_grounda/services/intialNavigation.dart';
import 'package:frontend_grounda/views/pages/customer/dashboard_page.dart';
import 'package:frontend_grounda/views/pages/login/login_view.dart';
import 'package:get/route_manager.dart';

appRoutes() => [
      GetPage(name: '/', page: () => InitialNavigation()),
      GetPage(name: '/dashboard', page: () => const DashboardPage()),
      GetPage(name: '/login', page: () => LoginView()),
    ];
