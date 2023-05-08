// ignore_for_file: prefer_const_constructors, no_duplicate_case_values

import 'package:flutter/material.dart';
import 'package:project_s4/common/screens/congrats.dart';
import 'package:project_s4/common/screens/privacy_policy.dart';
import 'package:project_s4/common/widgets/bottom_bar.dart';
import 'package:project_s4/features/account/screens/otp_password.dart';
import 'package:project_s4/features/account/screens/reset_password.dart';
import 'package:project_s4/features/admin/screens/add_products_screen.dart';
import 'package:project_s4/features/admin/screens/orders-details.dart';
import 'package:project_s4/features/auth/screens/otp_auth.dart';
import 'package:project_s4/features/cart/screen/carts_screen.dart';
import 'package:project_s4/features/feedback/screens/feedback_screen.dart';
import 'package:project_s4/features/home/screens/category_screen.dart';
import 'package:project_s4/features/home/screens/notifications.dart';
import 'package:project_s4/features/home/screens/view_all_screen.dart';
import 'package:project_s4/features/home/widgets/app_drawer.dart';
import 'package:project_s4/features/orders/screens/orders_history_screen.dart';
import 'package:project_s4/features/payment/screens/payment_screen.dart';

import 'package:project_s4/features/search/screens/search_screen.dart';
import 'package:project_s4/features/user_profile/screens/edit_profile_screen.dart';
import 'package:project_s4/features/user_profile/screens/user_profile_screen.dart';
import 'package:project_s4/maps/googleMap.dart';
import 'package:project_s4/screens/fill_bio.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/signup_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'models/orders.dart';

Route<dynamic>? generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SignUpScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AppDrawer(BottomBar()),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AppDrawer(BottomBar()),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddProductScreen(),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    case CategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryScreen(
          category: category,
        ),
      );

    case VerificationCodePage.routeName:
      var phone = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => VerificationCodePage(
          phoneN: phone,
        ),
      );

    case FillBio.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FillBio(),
      );

    case CongratsPage.routeName:
      var text = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CongratsPage(
          text: text,
        ),
      );

    case FeedBackScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FeedBackScreen(),
      );

    case OrdersHistoryScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrdersHistoryScreen(),
      );

    case CartsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CartsScreen(),
      );

    case UserProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UserProfileScreen(),
      );

    case EditProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EditProfileScreen(),
      );

    case NotificationPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => NotificationPage(),
      );

    case ViewAllScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ViewAllScreen(),
      );

    case PrivacyPolicyScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PrivacyPolicyScreen(),
      );

    case ViewAllScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ViewAllScreen(),
      );

    case ResetPasswordScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ResetPasswordScreen(),
      );

    case OrdersDScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrdersDScreen(
          order: order,
        ),
      );

    case PaymentScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PaymentScreen(
          totalAmount: totalAmount,
        ),
      );

    case PasswordOtpPage.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PasswordOtpPage(
          phoneN: totalAmount,
        ),
      );

    case GoogleMaps.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => GoogleMaps(
          totalSum: totalAmount,
        ),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
