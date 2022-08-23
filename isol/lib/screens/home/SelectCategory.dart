import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';

import '../../style/style.dart';


class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  late ScrollController _scrollController;
  List<bool> selected = [false,false,false,false,false,false,false,false,false];
  var filter = ['0','1','2','3','4','5','6','7','8'];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void prints(){
    for(var i=0; i<9; i++)
    {
      if(selected[i]==true){
        print(filter[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = baseAppBar('기부처 찾기');

    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15.w),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    prints();
                  },
                  child: const Text('선택한 기부처 보기',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  style: supprotusButtonStyleR10(const Color(0xff000275)),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 100.h, left: 15.w, right: 15.w), //top으로 부터 136 떨어져있어야 하지만 일단 100으로
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "찾고싶은 기부처 카테고리를 선택해주세요. \n"
                      "중복선택 가능",
                  style:  TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w,right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[0] = !selected[0];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[0] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                    selected[0] ? 'assets/xhdpi/home/education_white.png' : 'assets/xhdpi/home/education.png',
                                    width: 61.w,
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [ BoxShadow(
                                  color:  Color(0xffe2eef0),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[0] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("교육",
                              style: TextStyle(
                                  color: selected[0] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[0] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[1] = !selected[1];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[1] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                      selected[1] ? 'assets/xhdpi/home/medical_white.png' : 'assets/xhdpi/home/medical.png',
                                      width: 61.w
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [ BoxShadow(
                                  color:  Color(0xffe2eef0),
                                  offset:  Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[1] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("의료",
                              style: TextStyle(
                                  color: selected[1] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[1] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[2] = !selected[2];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[2] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                      selected[2] ? 'assets/xhdpi/home/culture_white.png' :'assets/xhdpi/home/culture.png',
                                      width: 61.w
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [ BoxShadow(
                                  color: Color(0xffe2eef0),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[2] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("문화예술",
                              style: TextStyle(
                                  color: selected[2] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[2] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[3] = !selected[3];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[3] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                      selected[3] ? 'assets/xhdpi/home/scholarship_white.png' :'assets/xhdpi/home/scholarship.png',
                                      width: 61.w
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [ BoxShadow(
                                  color: Color(0xffe2eef0),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[3] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("장학",
                              style: TextStyle(
                                  color: selected[3] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[3] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w,right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[4] = !selected[4];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[4] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                      selected[4] ? 'assets/xhdpi/home/life_white.png' :'assets/xhdpi/home/life.png',
                                    width: 61.w
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [ BoxShadow(
                                  color: Color(0xffe2eef0),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[4] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("생계",
                              style: TextStyle(
                                  color: selected[4] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[4] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[5] = !selected[5];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[5] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                      selected[5] ? 'assets/xhdpi/home/recognization_white.png' :'assets/xhdpi/home/recognization.png',
                                      width: 61.w
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [ BoxShadow(
                                  color: Color(0xffe2eef0),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[5] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("인식",
                              style: TextStyle(
                                  color: selected[5] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[5] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[6] = !selected[6];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[6] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                      selected[6] ? 'assets/xhdpi/home/global_white.png' :'assets/xhdpi/home/global.png',
                                      width: 61.w
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const[ BoxShadow(
                                  color: Color(0xffe2eef0),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[6] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("글로벌",
                              style: TextStyle(
                                  color: selected[6] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[6] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[7] = !selected[7];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[7] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                      selected[7] ? 'assets/xhdpi/home/dwelling_white.png' :'assets/xhdpi/home/dwelling.png',
                                      width: 61.w
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [ BoxShadow(
                                  color: Color(0xffe2eef0),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[7] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("주거",
                              style: TextStyle(
                                  color: selected[7] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[7] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w,right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 61.w,
                          height: 61.h,
                          child: Center(
                            child: SizedBox(
                              child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selected[8] = !selected[8];
                                    });
                                  },
                                  elevation: 0.0,
                                  fillColor: selected[8] ? const Color(0xff1b3547) : const Color(0xffffffff),
                                  child: Image.asset(
                                      selected[8] ? 'assets/xhdpi/home/protection_white.png' :'assets/xhdpi/home/protection.png',
                                      width: 61.w
                                  ),
                                  padding: const EdgeInsets.all(13.0),
                                  shape: const CircleBorder()),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [ BoxShadow(
                                  color: Color(0xffe2eef0),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              )] ,
                              color: selected[0] ? const Color(0xff1b3547) : const Color(0xffffffff)
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Opacity(
                          opacity: 0.48447299003601074,
                          child: Text("보호",
                              style: TextStyle(
                                  color: selected[8] ? const Color(0xff000000) : const Color(0xff313131),
                                  fontWeight: selected[8] ? FontWeight.bold : FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 11.0),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48.h,)
            ],
          ),
        )
    );
  }
}
