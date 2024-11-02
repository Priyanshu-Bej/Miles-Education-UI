import 'package:miles/core/exports.dart';

class AppRoutes {
  static const initialRoute = RouteNames.home;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case RouteNames.home:
        page = const HomeScreen();
        break;
      case RouteNames.youtubeVideoPage:
        final args = settings.arguments as Map<String, dynamic>?;
        page = YoutubeVideoPage(videoLink: args?['videoLink'] ?? '');
        break;
      default:
        page = const Scaffold(
          body: Center(child: Text('No route defined for this path')),
        );
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide in from the right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
