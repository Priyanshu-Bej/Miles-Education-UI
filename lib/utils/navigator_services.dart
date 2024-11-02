import 'package:miles/core/exports.dart';

class NavigatorService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic>? pushNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    navigatorKey.currentState?.pop();
  }

  static Future<dynamic>? pushNamedAndRemoveUntil(
      String routeName, RoutePredicate predicate,
      {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  static Future<dynamic>? popAndPushNamed(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }
}
