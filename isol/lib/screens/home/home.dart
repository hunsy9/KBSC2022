import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x99f7fbfc),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/xhdpi/ISOL.png',
              height: 20.h,
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.2,
      ),
      body: Container(
          margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
          child: Column(
            children: [
              SizedBox(height: 200.h,),
              SizedBox(
                width: 300.w,
                height: 300.h,
                child: LiquidCircularProgressIndicator(
                value: 0.6, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors.blue), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.transparent,
                borderWidth: 5.0,
                direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                center: Text(
                    "모금중...",
                    style: const TextStyle(
                        color:  const Color(0xff313131),
                        fontWeight: FontWeight.w600,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 15.0
                    ),
                    textAlign: TextAlign.left
                ),
              ),)

            ],
          )),
    );
  }
}


