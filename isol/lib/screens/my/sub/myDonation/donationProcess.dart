import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/app_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import './../../../../widget/donation_widget.dart';

class DonationProcess extends StatefulWidget {
  const DonationProcess({Key? key}) : super(key: key);

  @override
  State<DonationProcess> createState() => _DonationProcessState();
}

class _DonationProcessState extends State<DonationProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('후원금 프로세스'),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 10.h),
          child: Container(
              width: 345.w,
              height: 634.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  ),
                  boxShadow: [BoxShadow(
                      color: const Color(0xffe2eef0),
                      offset: Offset(0,3),
                      blurRadius: 6,
                      spreadRadius: 0
                  )] ,
                  color: const Color(0xffffffff)
              ),
              child: Column(
              children: [
                SizedBox(height: 16.h,),
                Image.asset("assets/xhdpi/icon_sample.png",
                  height: 50.h,
                ),
                SizedBox(height: 20.h,),
              Text(
                  "대학생 봉사 활동비 목적으로 총 10,000원을 \n부산대학교 산학협력단에게 지급을 했습니다!",
              style: const TextStyle(
              color:  const Color(0xff222222),
              fontWeight: FontWeight.w600,
              fontFamily: "NotoSansKR",
              fontStyle:  FontStyle.normal,
              fontSize: 13.0
          ),
            textAlign: TextAlign.left
        ),
                SizedBox(height: 50.h,),
                SimpleCircularProgressBar(
                  progressColors: const [Colors.cyan, Colors.purple],
                  onGetText: (double value) {
                    return Text('${value.toInt()}%');
                  },
                ),
                SizedBox(height: 20.h,),
                Text(
                    "전달완료!",
                    style: const TextStyle(
                        color:  const Color(0xff313131),
                        fontWeight: FontWeight.w600,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 15.0
                    ),
                    textAlign: TextAlign.left
                ),
                SizedBox(height: 35.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 14.5.w,),
                    Text(
                        "사용 내역",
                        style: const TextStyle(
                            color:  const Color(0xff313131),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 15.0
                        ),
                        textAlign: TextAlign.left
                    ),
                  ],
                ),
                SizedBox(height: 5.h,),

                Container(
                    width: 314.w,
                    height: 1.h,
                    decoration: BoxDecoration(
                        color: const Color(0xff707070)
                    )
                ),
                SizedBox(height: 14.5.h,),
                donationProcessRow(context),
                donationProcessRow(context),
                donationProcessRow(context),
                donationProcessRow(context),
                donationProcessRow(context),
              ],
          ),
          )
        ),


    )
    );
  }
}

