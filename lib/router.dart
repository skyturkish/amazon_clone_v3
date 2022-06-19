import 'package:amazon_clone_v3/constants/navigation/navigation_constants.dart';
import 'package:amazon_clone_v3/features/home/screens/home_view.dart';
import 'package:amazon_clone_v3/common/global/not_found_view.dart';
import 'package:amazon_clone_v3/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_v3/features/auth/screens/auth_view.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case NavigationConstants.AUTH_VIEW:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthView(),
      );
    case NavigationConstants.HOME_VIEW:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeView(),
      );
    case NavigationConstants.ACTUAL_HOME:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotFoundView(),
      );
  }
}
