import 'package:frontend_grounda/services/intialNavigation.dart';
import 'package:frontend_grounda/views/dashboard/dashboard_view.dart';
import 'package:frontend_grounda/views/login/login_view.dart';
import 'package:get/route_manager.dart';

appRoutes() => [
      GetPage(name: '/', page: () => InitialNavigation()),
      GetPage(name: '/dashboard', page: () => const DashboardView()),
      GetPage(name: '/login', page: () => LoginView()),
    ];
