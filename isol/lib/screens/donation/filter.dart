import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/style.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Map<int, bool> selectedFilter = {
    0:false, //교육
    1:false, //의료
    2:false, //문화예술
    3:false, //장학
    4:false, //생계
    5:false, //인식
    6:false, //글로벌
    7:false, //주거
    8:false, //보호
  };

  List<bool> selected = [false,false,false,false,false,false,false,false,false];
  var filter = [0,1,2,3,6,4,7,5,8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          '필터',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'NotoSansKR',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.2,
        actions: [
          TextButton(
              style: TextButton.styleFrom(primary: const Color(0xffaeefdd)),
              onPressed: () {
                setState(() {
                  selected.fillRange(0,selected.length,false);
                });
              },
              child: Text('초기화',
                style: TextStyle(
                    color: const Color(0xffaaaaaa),
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp
                ),
              )
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left : 15.w, right: 15.w, bottom: 40.h),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  for (int i = 0; i < selected.length ; i++) {
                    selectedFilter[filter[i]] = selected[i];
                  }
                  Navigator.pop(context, selectedFilter);
                },
                child: const Text('필터 적용하기',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                style: supprotusButtonStyleR10(const Color(0xff54c9a8)),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 24.h, 15.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '테마선택',
                    style: TextStyle(
                        color:  const Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.sp
                    )
                ),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style: TextStyle(
                                  color:  const Color(0xff54c9a8),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp
                              ),
                              text: "${selected.where((element) => element == true).length }개"),
                          TextSpan(
                              style: TextStyle(
                                  color:  const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp
                              ),
                              text: " 선택")
                        ]
                    )
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[0] ? 'assets/xhdpi/home/education_black.png' : 'assets/xhdpi/home/education.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[0] = !selected[0];
                        });
                      },
                    ),
                    Text(
                        "교육",
                        style: TextStyle(
                            color:  selected[0] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 11.sp
                        ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[1] ? 'assets/xhdpi/home/medical_black.png' : 'assets/xhdpi/home/medical.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[1] = !selected[1];
                        });
                      },
                    ),
                    Text(
                      "의료",
                      style: TextStyle(
                          color:  selected[1] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.sp
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[2] ? 'assets/xhdpi/home/culture_black.png' : 'assets/xhdpi/home/culture.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[2] = !selected[2];
                        });
                      },
                    ),
                    Text(
                      "문화예술",
                      style: TextStyle(
                          color:  selected[2] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.sp
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[3] ? 'assets/xhdpi/home/scholarship_black.png' : 'assets/xhdpi/home/scholarship.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[3] = !selected[3];
                        });
                      },
                    ),
                    Text(
                      "장학",
                      style: TextStyle(
                          color:  selected[3] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.sp
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[4] ? 'assets/xhdpi/home/global_black.png' : 'assets/xhdpi/home/global.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[4] = !selected[4];
                        });
                      },
                    ),
                    Text(
                      "글로벌",
                      style: TextStyle(
                          color:  selected[4] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.sp
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[5] ? 'assets/xhdpi/home/life_black.png' : 'assets/xhdpi/home/life.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[5] = !selected[5];
                        });
                      },
                    ),
                    Text(
                      "생계 및 \n기초생활",
                      style: TextStyle(
                        color:  selected[5] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.sp,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[6] ? 'assets/xhdpi/home/dwelling_black.png' : 'assets/xhdpi/home/dwelling.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[6] = !selected[6];
                        });
                      },
                    ),
                    Text(
                      "주거",
                      style: TextStyle(
                          color:  selected[6] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.sp
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[7] ? 'assets/xhdpi/home/recognization_black.png' : 'assets/xhdpi/home/recognization.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[7] = !selected[7];
                        });
                      },
                    ),
                    Text(
                      "인식",
                      style: TextStyle(
                          color:  selected[7] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.sp
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                          selected[8] ? 'assets/xhdpi/home/protection_black.png' : 'assets/xhdpi/home/protection.png'
                      ),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          selected[8] = !selected[8];
                        });
                      },
                    ),
                    Text(
                      "보호",
                      style: TextStyle(
                          color:  selected[8] ? const Color(0xff1b3547) : const Color(0xffc6ced3),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.sp
                      ),
                    )
                  ],
                ),
                Opacity(
                  opacity: 0.0,
                  child: Column(
                    children: [
                      IconButton(
                        splashColor : Colors.transparent,
                        highlightColor : Colors.transparent,
                        icon: Image.asset('assets/xhdpi/home/culture.png'),
                        iconSize: 50, onPressed: () {  },
                      ),
                      Text(
                        "문화예술",
                        style: TextStyle(
                            color:  const Color(0xffc6ced3),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 11.sp
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}