
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/screens/my/sub/myDonation/cancel_donation.dart';
import 'package:supportus_flutter_app/screens/my/sub/myDonation/donationProcess.dart';

import '../screens/my/sub/myDonation/donation_receipt.dart';
import 'dialog.dart';
GestureDetector myButtonBox(String text, context, Widget page){
  return GestureDetector(
    onTap: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w,right: 13.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    color:  const Color(0xff272727),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansKR",
                    fontStyle:  FontStyle.normal,
                    fontSize: 15.sp
                ),
              ),
              RotatedBox(
                  quarterTurns: 3,
                  child: Image.asset('assets/xhdpi/icon_arrow.png', width: 13.h, height: 7.2,fit: BoxFit.contain,)),
            ],
          ),
        ),
        height: 50.h,
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
  );
}

Widget myDonationBox(context){
  return Padding(
    padding: EdgeInsets.only(bottom: 15.w),
    child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "후원일자 2022.09.08",
                      style: TextStyle(
                          color:  Color(0xff000000),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 13.0
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "후원금 미수령",
                          style: TextStyle(
                              color:  Color(0xffe26800),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 13.0
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              await showDonationDialog(context).then((value) {
                                print(value);
                                switch (value){
                                  case '후원금 영수증':
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const DonationReceipt()));
                                    break;
                                  case '증빙자료':
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const DonationProcess()));
                                    break;
                                  case '기부취소':
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const CancelDonation()));
                                    break;
                                  default:
                                }
                              });
                            },
                            child: Icon(Icons.more_vert,size: 16.h,)
                        )
                      ],
                    )
                  ],
                ),
                flex: 2,
              ),
              Container(
                  height: 1,
                  decoration: const BoxDecoration(
                      color: Color(0xfff8f8f8)
                  )
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  children: [
                    SizedBox(
                        width: 10.w
                    ),
                    Image(image: const AssetImage('assets/xhdpi/icon_sample.png'),width: 64.h,),
                    SizedBox(
                        width: 7.w
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            height: 6.h
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
                    )
                  ],
                ),
                flex: 5,
              ),
            ],
          ),
        ),
        height: 135.h,
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
  );
}