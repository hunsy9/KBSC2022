import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'SelectCategory.dart';

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
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 258.h),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/xhdpi/support_logo.png',
                      width: 282.w,
                    ),
                    SizedBox(height: 21.h),
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
                                      color: Color(0xff54c9a8)
                                  ),
                                ),
                                onTap: () {
                                  print("검색");
                                },
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    SizedBox(
                      height: 100.h,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 25.w, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const SelectCategory()));
                                    },
                                    elevation: 2.0,
                                    fillColor: Colors.white,
                                    child: Image.asset(
                                      'assets/xhdpi/home/children.png',
                                      height: 40.h, //44.4
                                    ),
                                    padding: const EdgeInsets.all(15.0),
                                    shape: const CircleBorder()),
                                SizedBox(height: 7.h),
                                const Text("아동,청소년",
                                    style: TextStyle(
                                        color: Color(0xff313131),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansKR",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SelectCategory()));
                                  },
                                  elevation: 2.0,
                                  fillColor: Colors.white,
                                  child: Image.asset(
                                    'assets/xhdpi/home/old.png',
                                    height: 40.h, //44.4
                                  ),
                                  padding: const EdgeInsets.all(15.0),
                                  shape: const CircleBorder(),
                                ),
                                SizedBox(height: 7.h),
                                const Text("어르신",
                                    style: TextStyle(
                                        color: Color(0xff313131),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansKR",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SelectCategory()));
                                  },
                                  elevation: 2.0,
                                  fillColor: Colors.white,
                                  child: Image.asset(
                                    'assets/xhdpi/home/female.png',
                                    height: 40.h, //44.4
                                  ),
                                  padding: const EdgeInsets.all(15.0),
                                  shape: const CircleBorder(),
                                ),
                                SizedBox(height: 7.h),
                                const Text("여성",
                                    style: TextStyle(
                                        color: Color(0xff313131),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansKR",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.0),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 100.h,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 25.w, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SelectCategory()));
                                  },
                                  elevation: 2.0,
                                  fillColor: Colors.white,
                                  child: Image.asset(
                                    'assets/xhdpi/home/oursociety.png',
                                    height: 40.h, //44.4
                                  ),
                                  padding: const EdgeInsets.all(15.0),
                                  shape: const CircleBorder(),
                                ),
                                SizedBox(height: 7.h),
                                const Text("우리사회",
                                    style: TextStyle(
                                        color: Color(0xff313131),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansKR",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SelectCategory()));
                                  },
                                  elevation: 2.0,
                                  fillColor: Colors.white,
                                  child: Image.asset(
                                    'assets/xhdpi/home/environment.png',
                                    height: 40.h, //44.4
                                  ),
                                  padding: const EdgeInsets.all(15.0),
                                  shape: const CircleBorder(),
                                ),
                                SizedBox(height: 7.h),
                                const Text("환경",
                                    style: TextStyle(
                                        color: Color(0xff313131),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansKR",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SelectCategory()));
                                  },
                                  elevation: 2.0,
                                  fillColor: Colors.white,
                                  child: Image.asset(
                                    'assets/xhdpi/home/animal.png',
                                    height: 40.h, //44.4
                                  ),
                                  padding: const EdgeInsets.all(15.0),
                                  shape: const CircleBorder(),
                                ),
                                SizedBox(height: 7.h),
                                const Text("동물",
                                    style: TextStyle(
                                        color: Color(0xff313131),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansKR",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11.0),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
