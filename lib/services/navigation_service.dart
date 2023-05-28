import 'package:frontend_grounda/services/intial_navigation.dart';
import 'package:frontend_grounda/views/pages/agency/agency_view.dart';
import 'package:frontend_grounda/views/pages/agency/sub_pages/create_agency_view.dart';
import 'package:frontend_grounda/views/pages/category/category_view.dart';
import 'package:frontend_grounda/views/pages/customer/sub_pages/customer_create_view.dart';
import 'package:frontend_grounda/views/pages/developer/developer_view.dart';
import 'package:frontend_grounda/views/pages/forum/forum_view.dart';
import 'package:frontend_grounda/views/pages/login/login_view.dart';
import 'package:frontend_grounda/views/dashboard_view.dart';
import 'package:frontend_grounda/views/pages/order/order_view.dart';
import 'package:frontend_grounda/views/pages/post/post_view.dart';
import 'package:frontend_grounda/views/pages/post/sub_pages/post_create_view.dart';
import 'package:frontend_grounda/views/pages/product/product_view.dart';
import 'package:frontend_grounda/views/pages/project/project_view.dart';
import 'package:frontend_grounda/views/pages/settings/subpages/amenities/amenities_view.dart';
import 'package:frontend_grounda/views/pages/settings/subpages/payment_methods/payment_method_view.dart';
import 'package:frontend_grounda/views/pages/settings/subpages/profile/profile_view.dart';
import 'package:get/route_manager.dart';

import '../views/pages/blog/blog_view.dart';
import '../views/pages/customer/customer_view.dart';
import '../views/pages/help/help_view.dart';
import '../views/pages/settings/setting_view.dart';

appRoutes() => [
      GetPage(name: '/', page: () => InitialNavigation()),
      GetPage(
        name: '/dashboard',
        page: () => const DashboardView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/category',
        page: () => const CategoryView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/post',
        page: () => const PostView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/post/create',
        page: () => const PostCreateView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/project',
        page: () => const ProjectView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/developer',
        page: () => const DeveloperView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/product',
        page: () => const ProductView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/agency',
        page: () => const AgencyView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/agency/create',
        page: () => const CreateAgencyView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/customer',
        page: () => const CustomerView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/customer/create',
        page: () => const CustomerCreateView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/forum',
        page: () => const ForumView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/order',
        page: () => const OrderView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/settings',
        page: () => const SettingsView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/settings/payment-methods',
        page: () => const PaymentMethodView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/settings/amenities',
        page: () => const AmenitiesView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/help',
        page: () => const HelpView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/blog',
        page: () => const BlogView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/login',
        page: () => LoginView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/profile',
        page: () => const ProfileEditingView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    ];
