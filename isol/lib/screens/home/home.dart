import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';
import 'package:flutter_shapes/flutter_shapes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  final Path path = Path();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x99f2feff),
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
          margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
          child: Column(
            children: [
              // Stack(
              //   children: [
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(110, 10, 50, 0),
                  //   child: Image.asset(
                  //     'assets/xhdpi/charity.png',
                  //     height: 90.h,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/xhdpi/text_home.png',
                      height: 100.h,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Center(
                      child: SizedBox(
                          width: 200.w,
                          height: 200.h,
                          child: LiquidCustomProgressIndicator(
                            center: const Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text("1,600,000 원", style: TextStyle(fontSize: 20, color: Color(
                                  0xffffffff)),),
                            ),
                            value: 0.54321, // Defaults to 0.5.
                            valueColor: const AlwaysStoppedAnimation(Color(
                                0xffff5e5e)), // Defaults to the current Theme's accentColor.
                            backgroundColor: const Color(0xffffdbdb), // Defaults to the current Theme's backgroundColor.
                            shapePath: ClipPathClass().Heart(Size(200.w, 200.h)), direction: Axis.vertical, // A Path object used to draw the shape of the progress indicator. The size of the progress indicator is created from the bounds of this path.
                          )
                      ),
                    ),
                  ),
                // ]
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(0),
              //   child: Center(
              //     child: SizedBox(
              //       width: 200.w,
              //       height: 200.h,
              //       child: LiquidCustomProgressIndicator(
              //         center: const Padding(
              //           padding: EdgeInsets.only(top: 60),
              //           child: Text("1,600,000 원", style: TextStyle(fontSize: 20, color: Color(
              //               0xffffffff)),),
              //         ),
              //         value: 0.54321, // Defaults to 0.5.
              //         valueColor: const AlwaysStoppedAnimation(Color(
              //             0xffff5e5e)), // Defaults to the current Theme's accentColor.
              //         backgroundColor: const Color(0xffffdbdb), // Defaults to the current Theme's backgroundColor.
              //         shapePath: ClipPathClass().Heart(Size(200.w, 200.h)), direction: Axis.vertical, // A Path object used to draw the shape of the progress indicator. The size of the progress indicator is created from the bounds of this path.
              //       )
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Image.asset(
                  'assets/xhdpi/totalammount.png',
                  height: 20.h,
                ),
              ),
            ],
          )),
    );
  }
}

class ClipPathClass {
  Path Heart(Size size) {
    double width = size.width;
    double height = size.height;
    var path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);
    return path;
  }
}
