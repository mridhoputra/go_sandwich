import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_sandwich/data/model/product.dart';
import 'package:go_sandwich/pages/cart/cart_page.dart';
import 'package:go_sandwich/pages/detail_product/detail_product_page.dart';
import 'package:go_sandwich/pages/home/home_page.dart';
import 'package:go_sandwich/pages/login/login_page.dart';
import 'package:go_sandwich/pages/register/register_page.dart';
import 'package:go_sandwich/pages/search/search_page.dart';
import 'package:go_sandwich/utils/navigation.dart';
import 'package:go_sandwich/widgets/bottom_nav.dart';

final router = GoRouter(
  initialLocation: LoginPage.routeName,
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: LoginPage.routeName,
      path: LoginPage.routeName,
      pageBuilder: (context, state) {
        return buildCustomTransitionPage(
          state: state,
          context: context,
          child: const LoginPage(),
        );
      },
    ),
    GoRoute(
      name: RegisterPage.routeName,
      path: RegisterPage.routeName,
      pageBuilder: (context, state) {
        return buildCustomTransitionPage(
          state: state,
          context: context,
          child: const RegisterPage(),
        );
      },
    ),
    ShellRoute(
        navigatorKey: userNavigatorKey,
        builder: (context, state, child) {
          return BottomNav(child: child);
        },
        routes: [
          GoRoute(
            name: HomePage.routeName,
            path: HomePage.routeName,
            pageBuilder: (context, state) {
              return buildCustomTransitionPage(
                state: state,
                context: context,
                child: const HomePage(),
              );
            },
          ),
          GoRoute(
            name: SearchPage.routeName,
            path: SearchPage.routeName,
            pageBuilder: (context, state) {
              return buildCustomTransitionPage(
                state: state,
                context: context,
                child: const SearchPage(),
              );
            },
          ),
          GoRoute(
            name: CartPage.routeName,
            path: CartPage.routeName,
            pageBuilder: (context, state) {
              return buildCustomTransitionPage(
                state: state,
                context: context,
                child: const CartPage(),
              );
            },
          ),
          GoRoute(
            name: DetailProduct.routeName,
            path: DetailProduct.routeName,
            pageBuilder: (context, state) {
              return buildCustomTransitionPage(
                state: state,
                context: context,
                child: DetailProduct(product: state.extra as Product),
              );
            },
          ),
        ])
  ],
);

CustomTransitionPage buildCustomTransitionPage({context, state, child}) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
