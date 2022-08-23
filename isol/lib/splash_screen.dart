import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _fetchPosts() async {
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(context, '/loginPage', (Route<dynamic> route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: statusBarColor(SystemUiOverlayStyle.light),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient (
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff8ae5ab), Color(0xff16a8a3)]
                  )
              ),
              child: Center(
                child: Image.asset('assets/xhdpi/splash.png',
                    width: 275.w)
              )
            ),
          )
        ],
      ),
    );
  }
}
