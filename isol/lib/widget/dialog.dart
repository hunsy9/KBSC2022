import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showCustomDialog(BuildContext context, String text, {String buttonText = '확인'}) {  //TODO 확인 버튼 사이즈
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            width: 300.w,
            height: 160.h,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  width: 300.w,
                  height: 110.h,
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.black12,
                            width: 0.5
                        ),
                      )
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(text,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: -0.48,
                              fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]
                  ),
                ),
                SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(buttonText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black, fontSize: 14, letterSpacing: -0.42,fontWeight: FontWeight.w400))
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
  );
}

Future showCustomDialog2(BuildContext context, String text, String text2, {String buttonText = '확인'}) {  //TODO 확인 버튼 사이즈
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            width: 300.w,
            height: 160.h,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  width: 300.w,
                  height: 110.h,
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.black12,
                            width: 0.5
                        ),
                      )
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(text,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: -0.48,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(text2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color:  Color(0xff747474),
                            fontSize: 13,
                            letterSpacing: -0.48,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]
                  ),
                ),
                SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(buttonText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black, fontSize: 14, letterSpacing: -0.42,fontWeight: FontWeight.w400))
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
  );
}


Future showDonationDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            width: 270.w,
            height: 340.h,
            child: Column(
              children: [
                SizedBox(
                  width: 370.w,
                  height: 45.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.w, right: 7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            "후원 내역",
                            style: TextStyle(
                                color:  Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle:  FontStyle.normal,
                                fontSize: 13.0
                            ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.clear,size: 17.w,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: const AssetImage('assets/xhdpi/icon_sample.png'),width: 64.h,),
                          SizedBox(
                            height: 6.h,
                          ),
                          const Text(
                              "굿네이버스",
                              style: TextStyle(
                                  color:  Color(0xff313131),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 13.0
                              ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          const Text(
                            "사용 목적 : 대학생 봉사 활동비",
                            style: TextStyle(
                                color:  Color(0xff848484),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansKR",
                                fontStyle:  FontStyle.normal,
                                fontSize: 13.0
                            ),
                          ),
                          const Text(
                            "후원 방식 : 단일후원(1회)ㅣ후원금액 : 1만원",
                            style: TextStyle(
                                color:  Color(0xff848484),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansKR",
                                fontStyle:  FontStyle.normal,
                                fontSize: 13.0
                            ),
                          )
                        ],
                      ),
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.black12,
                                width: 0.5
                            ),
                          )
                      ),
                    )
                ),
                Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black12,
                                      width: 0.5
                                  ),
                                )
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context, '후원금 영수증');
                                      },
                                      child: const Text('후원금 영수증',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.black, fontSize: 14, letterSpacing: -0.42,fontWeight: FontWeight.w400))
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black12,
                                      width: 0.5
                                  ),
                                )
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context, '후원금 프로세스');
                                      },
                                      child: const Text('후원금 프로세스',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.black, fontSize: 14, letterSpacing: -0.42,fontWeight: FontWeight.w400))
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context, '기부취소');
                                    },
                                    child: const Text('기부취소',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 14, letterSpacing: -0.42,fontWeight: FontWeight.w400))
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        );
      }
  );
}