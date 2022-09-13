import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';
import 'SelectCategory.dart';

class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
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
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                      child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffe2eef0),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ],
                              color: Color(0xffffffff)),
                          child: Row(
                            children: <Widget>[
                              const Flexible(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 16, bottom: 11, top: 11),
                                      hintText: '찾으시는 기부처가 있으신가요?'),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  width: 67.w,
                                  height: 50.h,
                                  child: const Center(
                                    child: Text("검색",
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansKR",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.left),
                                  ),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xffe2eef0),
                                            offset: Offset(0, 3),
                                            blurRadius: 6,
                                            spreadRadius: 0)
                                      ],
                                      color: Color(0xff000275)
                                  ),
                                ),
                                onTap: () {
                                  print("검색");
                                },
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 10.h,),
                    SizedBox(
                      height: 50.h,
                      child: Container(),
                    )
                  ],
                ))),
      ),
    );
  }
}


