import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widget/app_bar.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('공지사항'),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            noticeBox(context,"[공지] ISOL 이용안내"),
            noticeBox(context,"[공지] 사용자 변경안내"),
            noticeBox(context,"[공지] ISOL 정책변경"),
            noticeBox(context,"[공지] 결제 변경안내"),
            noticeBox(context,"[공지] ISOL 결제안내"),

          ],
        ),
      ),
    );
  }
}

GestureDetector noticeBox(BuildContext context, String text){
  return GestureDetector(
    onTap: ()=>{
      print("공지사항 클릭")

    },
    child: Column(
      children: [
        SizedBox(
          height: 33.h,
          child: Row(
            children: [
              SizedBox(
                width: 124.w,
                child: Column(
                  children: [
                    Text(
                        text,
                        style: const TextStyle(
                            color:  const Color(0xff5a5a5a),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 13.0
                        ),
                        textAlign: TextAlign.start
                    ),
                    Padding(
                        child: Text(
                            "2020.11.08 01:49",
                            style: const TextStyle(
                                color:  const Color(0xff5a5a5a),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansKR",
                                fontStyle:  FontStyle.normal,
                                fontSize: 10.0
                            ),
                            textAlign: TextAlign.start
                        ),
                        padding: EdgeInsetsDirectional.only(end: 33.w))
                  ],
                ),
              ),
              SizedBox(
                width: 200.w,
              ),
              Text(
                  ">",
                  style: const TextStyle(
                      color:  const Color(0xff5a5a5a),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle:  FontStyle.normal,
                      fontSize: 10.0
                  ),
                  textAlign: TextAlign.left
              ),

            ],
          ),
        ),
        SizedBox(height: 15.h,),
        Center(
          child: Container(
              width: 344.w,
              height: 1.h,
              decoration: BoxDecoration(
                  color: const Color(0xfff4f4f4)
              )
          ),
        ),
        SizedBox(height: 14.5.h)
      ],
    ),
  );


}
