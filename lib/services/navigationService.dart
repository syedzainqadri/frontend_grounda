import 'package:frontend_grounda/services/intialNavigation.dart';
import 'package:frontend_grounda/views/pages/login/login_view.dart';
import 'package:frontend_grounda/views/root_view.dart';
import 'package:get/route_manager.dart';

appRoutes() => [
      GetPage(name: '/', page: () => InitialNavigation()),
      GetPage(name: '/dashboard', page: () => RootView()),
      GetPage(name: '/login', page: () => LoginView()),
    ];
