import 'package:amazon_clone_v3/core/constants/navigation/navigation_constants.dart';
import 'package:amazon_clone_v3/product/global/not_found_view/not_found_view.dart';
import 'package:amazon_clone_v3/view/authenticate/view/auth_view.dart';
import 'package:amazon_clone_v3/view/home/view/home_view.dart';
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
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotFoundView(),
      );
  }
}
