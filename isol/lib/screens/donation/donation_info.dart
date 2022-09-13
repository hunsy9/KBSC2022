import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/screens/donation/donation_purpose.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';
import '../../widget/donation_widget.dart';
import 'donate.dart';

class DonationInfo extends StatefulWidget {
  const DonationInfo({Key? key}) : super(key: key);

  @override
  State<DonationInfo> createState() => _DonationInfoState();
}

class _DonationInfoState extends State<DonationInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar('후원처 정보'),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 15.w),
            child: Text(
              "UNICEF",
              style: TextStyle(
                  color:  const Color(0xff313131),
                  fontWeight: FontWeight.w500,
                  fontFamily: "NotoSansKR",
                  fontStyle:  FontStyle.normal,
                  fontSize: 15.sp
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: ClipRRect(
              child: Image.asset(
                "assets/xhdpi/isol_begin.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13.h, left: 15.w, bottom: 20.h, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "소개",
                  style: TextStyle(
                      color:  const Color(0xff313131),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansKR",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.sp
                  ),
                ),
                SizedBox(height: 8.h,),
                _donationInfoBox(context),
                SizedBox(height: 10.h,),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: donationBottomButton(context, const Donate(), '후원하러가기')
    );
  }

  Widget _donationInfoBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xffcff1e0),
            offset: Offset(0.0, 0.3), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Text(
          '“기후 변화로 인한 사상 최악의 홍수로 파키스탄 3분의 1이 물에 잠겼습니다. 지난 6월 이후 파키스탄 강수량은 한세기동안 최고 기록을 경신했습니다. 석달 째 내린 폭우로 집 110만 채 이상이 떠내려가거나 파손되고, 학교 1만 8천개가 무너져 버렸습니다. 어린이 400명을 포함해 1,200명 이상이 사망했습니다. 파키스탄 정부는 최소 3,300만 명이 피해를 입었을 것으로 추산하고 있습니다. 340만 명의 홍수 피해 지역 어린이들의 상황은 위급하며, 긴급한 구호를 필요로 합니다.',
          style: TextStyle(
              color:  const Color(0xff313131),
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansKR",
              fontStyle:  FontStyle.normal,
              fontSize: 15.sp
          ),
        ),
      ),
    );
  }
}
