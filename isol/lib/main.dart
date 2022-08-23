import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:supportus_flutter_app/screens/login/login_page.dart';
import 'package:supportus_flutter_app/screens/login/search_id.dart';
import 'package:supportus_flutter_app/screens/login/search_password.dart';
import 'package:supportus_flutter_app/screens/login/signup_page.dart';
import 'package:supportus_flutter_app/screens/navigation.dart';
import 'package:supportus_flutter_app/splash_screen.dart';
import 'package:supportus_flutter_app/utils/page_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider<TabSelect>(create: (_) => TabSelect()),
      ],
          child: const MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (ctx, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            onGenerateRoute: (settings) {
              var routes = <String, WidgetBuilder>{
                //로그인 route
                '/loginPage': (context) => LoginPage(),
                '/searchId': (context) => SearchId(),
                '/searchPassword': (context) => SearchPassword(),
                '/signUpPage': (context) => SignUpPage(),
                //네비게이션
                '/navigation': (context) => Navigation(),
              };
              WidgetBuilder builder = routes[settings.name]!;
              return MaterialPageRoute(
                settings: settings,
                builder: (ctx) => builder(ctx),
              );
            },
          );
        });
  }
}