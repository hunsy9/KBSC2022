import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';

import '../../style/style.dart';
import '../../utils/page_provider.dart';

class DonateCompletion extends StatefulWidget {
  const DonateCompletion({Key? key}) : super(key: key);

  @override
  State<DonateCompletion> createState() => _DonateCompletionState();
}

class _DonateCompletionState extends State<DonateCompletion> {
  @override
  Widget build(BuildContext context) {
    List<Widget> appMenu = context.watch<TabSelect>().appMenu;

    return Scaffold(
      appBar: baseAppBar('후원하기'),
      body: Container(
        padding: EdgeInsetsDirectional.fromSTEB(15.h, 22.w, 15.h, 17.w),
        color: const Color(0xfff7fbfc),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "후원완료",
                style: TextStyle(
                    color:  const Color(0xff313131),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.sp
                ),
            ),
            SizedBox(height: 10.h,),
            _donateCompletionBox(),
            SizedBox(height: 12.h,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    Navigator.popUntil(context, ModalRoute.withName("/navigation"));
                    context.read<TabSelect>().changeTab(appMenu[3], 3);
                  },
                    child: Text(
                      "마이페이지에서 확인하기",
                      style: TextStyle(
                          color:  const Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: 14.sp
                      ),
                  ),
                    style: supprotusButtonStyleR10(
                        const Color(0xff053dc2)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _donateCompletionBox(){
  return Container(
    height: 160.h,
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
              flex: 88,
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
                        Text("굿네이버스",
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
                        Text("정기후원 | 일시후원",
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
          const Divider(thickness: 0.5),
          Flexible(
            flex: 69,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    "대학생 봉사 활동비 ㅣ 1회 후원",
                    style: TextStyle(
                        color:  const Color(0xff222222),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 13.sp
                    ),
                ),
                SizedBox(height: 3.h,),
                Text(
                    "결제금액 10,000원",
                    style: TextStyle(
                        color:  const Color(0xfff3755e),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 13.sp
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