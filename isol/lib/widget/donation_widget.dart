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
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff000275)),
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
                  Image.asset("assets/xhdpi/unicef.png",
                    height: 64.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("UNICEF",
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
                        Text("수해지역 | 정기후원 | 일시후원",
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
                    '"기후 변화로 인한 사상 최악의 홍수로 파키스탄 3분의 1이 물에 잠겼습니다. 지난 6월 이후 파키스탄 강수량은 한세기동안 최고 기록을 경신했습니다. 석달 째 내린 폭우로 집 110만 채 이상이 떠내려가거나 파손되고, 학교 1만 8천개가 무너져 버렸습니다. 어린이 400명을 포함해 1,200명 이상이 사망했습니다. 파키스탄 정부는 최소 3,300만 명이 피해를 입었을 것으로 추산하고 있습니다. 340만 명의 홍수 피해 지역 어린이들의 상황은 위급하며, 긴급한 구호를 필요로 합니다."',
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

Widget donationProcessRow(BuildContext context){
  return Container(
      width: 311.5.w,
      height: 37.5.h,

      child: Column(
        children: [
          Row(
          children: [
            Text(
                "2022.09.01",
                style: const TextStyle(
                    color:  const Color(0xff313131),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansKR",
                    fontStyle:  FontStyle.normal,
                    fontSize: 13.0
                ),
                textAlign: TextAlign.left
            ),
            SizedBox(width: 23.w,),
            Text(
                "아동에게 지급",
                style: const TextStyle(
                    color:  const Color(0xff313131),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansKR",
                    fontStyle:  FontStyle.normal,
                    fontSize: 13.0
                ),
                textAlign: TextAlign.left
            ),
            SizedBox(width: 87.w,),
            Text(
                "2,000원",
                style: const TextStyle(
                    color:  const Color(0xff313131),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansKR",
                    fontStyle:  FontStyle.normal,
                    fontSize: 13.0
                ),
                textAlign: TextAlign.left
            ),
            SizedBox(width: 12.w,)
          ],
  ),
          SizedBox(height: 6.h,),

          Container(
              width: 310.w,
              height: 1.h,
              decoration: BoxDecoration(
                  color: const Color(0xfff2f2f2)
              )
          ),
          SizedBox(height: 15.h,)
        ],
      ),
  );

}