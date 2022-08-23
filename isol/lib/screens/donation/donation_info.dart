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
      appBar: baseAppBar('기부처 정보'),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 15.w),
            child: Text(
              "부산대학교 산학협력단",
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
                "assets/xhdpi/banner_sample_img.png",
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
                Text(
                  "목적",
                  style: TextStyle(
                      color:  const Color(0xff313131),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansKR",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.sp
                  ),
                ),
                SizedBox(height: 7.h,),
                donatoinPurposeBox('기부처와 기부목적을 찾아보세요!',context, const DonationPurpose()),
                SizedBox(height: 8.h,),
                donatoinPurposeBox('기부처와 기부목적을 찾아보세요!',context, const DonationPurpose()),
                SizedBox(height: 8.h,),
                donatoinPurposeBox('기부처와 기부목적을 찾아보세요!',context, const DonationPurpose()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: donationBottomButton(context, const Donate(), '기부하러가기')
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
          '“자고 있는데 화재 경보음 소리에 깜짝 놀라 깨보니까, 눈앞에 불이 번쩍하더라고. 큰일 날 뻔했어”오래된 전선이 곧 끊어질 듯 위태하게 이어져 있는 천장에는 불에 탄 시커먼 자국과 켜지지 않는 전등만이 남겨져 있습니다. 그 어두운 방 안 텔레비전 불빛에 의존해 생활하고 있는 정◯◯어르신은 큰 불로 번지지 않았다는 안도감이 든 것도 잠시, 오래된 전선 때문에 또 불이 나지 않을까 불안함에 쉽사리 잠들기가 힘듭니다. 어르신의 모든 삶이 담긴 수십 년 된 노후 주택에는 오랜 세월에 낡아버린 전열 기구에 비닐 배선을 사용하고 있어 전기 화재 발생 위험에 더욱 노출되어 있습니다.',
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
