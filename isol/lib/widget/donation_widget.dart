import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget donationBottomButton(BuildContext context, Widget page, String text){
  return SizedBox(
    height: 60.h,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff54c9a8)),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Text(
          text,
          style: TextStyle(
              color:  const Color(0xffffffff),
              fontWeight: FontWeight.w400,
              fontFamily: "NotoSansKR",
              fontStyle:  FontStyle.normal,
              fontSize: 14.sp
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget donationInfoBox(BuildContext context) {
  return Container(
    height: 215.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19.0),
      color: Colors.white,
      boxShadow: const [BoxShadow(
          color: Color(0xffe2eef0),
          offset: Offset(0,3),
          blurRadius: 6,
          spreadRadius: 0
      )] ,
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 12.w, top: 7.h, right: 12.w, bottom: 13.h),
      child: Column(
        children: [
          Flexible(
              flex: 64,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Image.asset("assets/xhdpi/icon_sample.png",
                    height: 64.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("부산대학교 산학협력단",
                          style: TextStyle(
                              color: const Color(0xff313131),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text("창업지원 | 청년지원 | 창업지원 | 창업지원",
                          style: TextStyle(
                              color: const Color(0xff797979),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.sp),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(height: 6.h,),
          Flexible(
            flex: 124,
            fit: FlexFit.tight,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(7)
                  ),
                  color: Color(0xfff7fbfc)
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Center(
                  child: Text(
                    '“자고 있는데 화재 경보음 소리에 깜짝 놀라 깨보니까, 눈앞에 불이 번쩍하더라고. 큰일 날 뻔했어”오래된 전선이 곧 끊어질 듯 위태하게 이어져 있는 천장에는 불에 탄 시커먼 자국과 켜지지 않는 전등만이 남겨져 있습니다. 그 어두운 방 안 텔레비전 불빛에 의존해 생활하고 있는 정◯◯어르신은 큰 불로 번지지 않았다는 안도감이 든 것도 잠시, 오래된 전선 때문에 또 불이 나지 않을까 불안함에 쉽사리 잠들기가 힘듭니다. 어르신의 모든 삶이 담긴 수십 년 된 노후 주택에는 오랜 세월에 낡아버린 전열 기구에 비닐 배선을 사용하고 있어 전기 화재 발생 위험에 더욱 노출되어 있습니다.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    softWrap: true,
                    style: TextStyle(
                        color:  const Color(0xff313131),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 13.sp
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}


GestureDetector donatoinPurposeBox(String text, context, Widget page){
  return GestureDetector(
    onTap: (){
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => page));
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
              // RotatedBox(
              //     quarterTurns: 3,
              //     child: Image.asset('assets/xhdpi/icon_arrow.png', width: 13.h, height: 7.2,fit: BoxFit.contain,)),
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