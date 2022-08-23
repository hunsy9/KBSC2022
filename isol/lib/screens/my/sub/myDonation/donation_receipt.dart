import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/app_bar.dart';

class DonationReceipt extends StatefulWidget {
  const DonationReceipt({Key? key}) : super(key: key);

  @override
  State<DonationReceipt> createState() => _DonationReceiptState();
}

class _DonationReceiptState extends State<DonationReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('기부금 영수증'),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset('assets/xhdpi/DonationReceipt_sample.png',fit: BoxFit.contain,),
            SizedBox(
              height: 13.h,
            ),
            GestureDetector(
              onTap: (){
                print('카카오톡으로 수령하기');
              },
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/xhdpi/icon_kakaoTalk.png', width: 30.w, height: 27.h,),
                      SizedBox(width: 6.w,),
                      const Text(
                        "카카오톡으로 수령하기",
                        style: TextStyle(
                            color: Color(0xff391b1b),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 14.0
                        ),
                      )
                    ],
                  ),
                  height: 45.h,
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
                      color: Color(0xffffd809)
                  )
              ),
            ),
          ],
        ),

      ),
    );
  }
}
