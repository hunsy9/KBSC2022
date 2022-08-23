import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/style.dart';
import '../../../../widget/app_bar.dart';
import '../../../../widget/custom_check_box.dart';
import '../../../../widget/custom_radio_buttons.dart';
import '../../../../widget/dialog.dart';

class CancelDonation extends StatefulWidget {
  const CancelDonation({Key? key}) : super(key: key);

  @override
  _CancelDonationState createState() => _CancelDonationState();
}

class _CancelDonationState extends State<CancelDonation> {
  List<RadioModel> sampleData = [];
  late ScrollController _scrollController;
  bool rememberLoginCheck = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    sampleData.add(RadioModel(false, false, '후원방식이 마음에 안들어요.'));
    sampleData.add(RadioModel(false, false, '기부금액을 변경하고싶어요.'));
    sampleData.add(RadioModel(false, false, '다른 기부처에 후원하고 싶어요.'));
    sampleData.add(RadioModel(false, true, '직접입력'));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = baseAppBar('기부금 취소');

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = appBar.preferredSize.height;
    final Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height - statusBarHeight - appBarHeight - 60.h;

    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: appBar,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          child: Container(
            padding: EdgeInsets.only(left: 15.w, top: 18.h, right: 15.w),
            height: _height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "취소하실 기부처/기부금",
                    style: TextStyle(
                        color:  Color(0xff313131),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 16.0
                    ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Column(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 9,
                            child: Row(
                              children: [
                                Image(image: const AssetImage('assets/xhdpi/icon_sample.png'),width: 64.h,),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        "부산대학교 산학협력단",
                                        style: TextStyle(
                                            color:  Color(0xff313131),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansKR",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.0
                                        ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    const Text(
                                        "창업지원 | 창업지원 | 창업지원 | 창업지원",
                                        style: TextStyle(
                                            color:  Color(0xff797979),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NotoSansKR",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 13.0
                                        ),
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            height: 1,
                            decoration: const BoxDecoration(
                                color: Color(0xffebebeb)
                            )
                        ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                    "대학생 봉사 활동비 ㅣ 1회 후원",
                                    style: TextStyle(
                                        color:  Color(0xff222222),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansKR",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 13.0
                                    ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                const Text(
                                    "취소금액 10,000원",
                                    style: TextStyle(
                                        color:  Color(0xfff3755e),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NotoSansKR",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 13.0
                                    ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                    height: 158.h,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        ),
                        boxShadow: [BoxShadow(
                            color: Color(0xffe2eef0),
                            offset: Offset(0,3),
                            blurRadius: 6,
                            spreadRadius: 0
                        )] ,
                        color: Color(0xffffffff)
                    )
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                    "기부를 취소하시는 사유를 선택해주세요.",
                    style: TextStyle(
                        color:  Color(0xff313131),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 16.0
                    ),
                ),
                SizedBox(height: 9.h,),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sampleData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var element in sampleData) {
                              element.isSelected = false;
                              element.myFocusNode.unfocus();
                            }
                            sampleData[index].isSelected = true;
                            sampleData[index].myFocusNode.requestFocus();
                          });

                          if(sampleData[index].text == "직접입력"){
                            _scrollController.animateTo(120.h,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.ease);
                          }

                          print(sampleData[index].text);
                          print(sampleData[index].enteredText);
                        },
                        child: RadioItem(sampleData[index]),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCheckBox(
                      checkBoxSize: 15,
                      borderRadius: 10,
                      shouldShowBorder: true,
                      borderWidth: 1,
                      borderColor: const Color(0xff54c9a8),
                      checkedFillColor: const Color(0xff54c9a8),
                      value: rememberLoginCheck,
                      onChanged: (val) {
                        setState(() {
                          rememberLoginCheck = val;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        print("기부금 취소 관련 공지사항을 모두 읽고 동의합니다. ");
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
                        child: RichText(
                            text: const TextSpan(
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color:  Color(0xff54c9a8),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansKR",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 13.0
                                      ),
                                      text: "기부금 취소 관련 공지사항을"),
                                  TextSpan(
                                      style: TextStyle(
                                          color:  Color(0xff575757),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansKR",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 13.0
                                      ),
                                      text: "을 모두 읽고 동의합니다.")
                                ]
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text('돌아가기',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                        style: supprotusButtonStyleR10(const Color(0xff54c9a8)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await showCustomDialog2(context,"기부금 취소가 완료되었습니다."," 기부금 취소 내역은 마이페이지 > 기부금/환불내역 메뉴에서 확인 가능합니다. ",buttonText: '기부금 취소내역 바로가기').then((value) =>
                              Navigator.pushNamedAndRemoveUntil(context, '/navigation',(route) => false)
                          );
                        },
                        child: const Text('기부금 취소',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                        style: supprotusButtonStyleR10(const Color(0xff3ca789)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
