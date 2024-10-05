import 'package:shoe_app/view/AdminView/AdminCategories.dart';
import 'package:shoe_app/view/AdminView/AdminUsers.dart';
import 'package:shoe_app/view/UserView/CartPage.dart';
import 'package:shoe_app/view/UserView/WishPage.dart';
import '../export/AllExport.dart';

class AppPages{
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.SignUp, page: () => SignUp()),
    GetPage(name: AppRoutes.Login, page: () => Login()),
    GetPage(name: AppRoutes.Home, page: () => HomePage()),
    GetPage(name: AppRoutes.AdminHome, page: () => AdminHome()),
    GetPage(name: AppRoutes.AdminUser, page: () => AdminUsers()),
    GetPage(name: AppRoutes.AdminCategoriess, page: () => AdminCategories()),
    GetPage(name: AppRoutes.CartPage, page: () => CartPage()),
    GetPage(name: AppRoutes.WishPage, page: () => WishPage()),

  ];
}