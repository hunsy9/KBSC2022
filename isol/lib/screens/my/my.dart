import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/screens/my/sub/faq.dart';
import 'package:supportus_flutter_app/screens/my/sub/myDonation/my_donation.dart';
import 'package:supportus_flutter_app/screens/my/sub/my_question.dart';
import 'package:supportus_flutter_app/screens/my/sub/my_question_list.dart';
import 'package:supportus_flutter_app/screens/my/sub/my_refund.dart';
import 'package:supportus_flutter_app/screens/my/sub/notice.dart';

import '../../style/style.dart';
import '../../widget/app_bar.dart';
import '../../widget/my_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  late String userName="";

  Future<bool> _init() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('user').doc(user!.uid).get();

    userName = userData.data()!['userName'];
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('MY'),
      body:  FutureBuilder(
        future: _init(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          // if (snapshot.hasData == false) {
          //   return const Center(child: CircularProgressIndicator(
          //     color: Color(0xff053dc2),
          //   ));
          // }else{
            return SingleChildScrollView(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),
                      boxShadow: [BoxShadow(
                          color: Color(0xfff4f4f4),
                          offset: Offset(0,3),
                          blurRadius: 6,
                          spreadRadius: 0
                      )] ,
                      color: Color(0xffffffff),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w, top: 7.h, bottom: 15.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Color(0xfffafcfd),
                            backgroundImage: AssetImage('assets/xhdpi/icon_my.png'),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            " ${userName}",
                            style: const TextStyle(
                                color:  Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle:  FontStyle.normal,
                                fontSize: 16.0
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              print('편집');
                            },
                            icon: const Icon(Icons.create_sharp),
                            iconSize: 15.w,
                          ),
                          GestureDetector(
                            child: const Text(
                              "로그아웃",
                              style: TextStyle(
                                  color:  Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 16.0
                              ),
                            ),
                            onTap: ()async{
                              await FirebaseAuth.instance.signOut();
                              print(FirebaseAuth.instance.currentUser!.email);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),

            //나의 후원 조회
            Text(
                "나의 후원 조회",
                style: getMyTextStyle(),
            ),
            SizedBox(
              height: 9.h,
            ),
            myButtonBox('내가 후원한 기부처',context, const MyDonation()),
            SizedBox(
              height: 8.h,
            ),
            myButtonBox('기부금 취소/환불 내역',context, const MyRefund()),
            SizedBox(
              height: 30.h,
            ),

            //고객센터
            Text(
              "고객센터",
              style: getMyTextStyle(),
            ),
            SizedBox(
              height: 9.h,
            ),
            myButtonBox('공지사항',context, const Notice()),

            SizedBox(
              height: 8.h,
            ),
            myButtonBox('자주묻는 질문',context, const FAQ()),
            SizedBox(
              height: 8.h,
            ),
            myButtonBox('1:1 문의',context, const MyQuestion()),
            SizedBox(
              height: 8.h,
            ),
            myButtonBox('1:1 문의 내역',context, const MyQuestionList()),
            SizedBox(
              height: 30.h,
            ),
                  SizedBox(
                    height: 9.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            );
          }
        //}
      )
    );
  }
}
