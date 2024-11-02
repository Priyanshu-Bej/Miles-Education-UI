import 'package:miles/core/exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]).then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TalkToUsProvider(),
        ),
      ],
      child: Sizer(
        builder: (contex, orientation, deviceType) {
          return MaterialApp(
            title: "Miles",
            navigatorKey: NavigatorService.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            initialRoute: AppRoutes.initialRoute,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
