import 'package:flutter/widgets.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> userNavigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static pushNamed(String routeName, [Object? arguments]) {
    if (arguments != null) {
      rootNavigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
    } else {
      rootNavigatorKey.currentState?.pushNamed(routeName);
    }
  }

  static reset(String routeName) {
    rootNavigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (_) => false);
  }

  static back([dynamic result]) => rootNavigatorKey.currentState?.pop(result);
}
