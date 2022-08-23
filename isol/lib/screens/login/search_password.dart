//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../style/style.dart';
import '../../widget/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SearchPassword extends StatefulWidget {
  const SearchPassword({Key? key}) : super(key: key);

  @override
  _SearchPasswordState createState() => _SearchPasswordState();
}

class _SearchPasswordState extends State<SearchPassword> {
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();

  late FocusNode emailNode;
  late FocusNode nameNode;
  late FocusNode phoneNode;

  @override
  void initState(){
    emailNode = FocusNode();
    nameNode = FocusNode();
    phoneNode = FocusNode();
  }

  @override
  void dispose(){
    emailNode.dispose();
    nameNode.dispose();
    phoneNode.dispose();
  }


  void judge() async{
    if(idController.text.isEmpty || nameController.text.isEmpty || mobileController.text.isEmpty){
      showCustomDialog(context, "빈 칸을 채워주세요.",buttonText: "확인");
    }
    else{
      await firestore
          .collection('user')
          .where("Id",
          isEqualTo: idController.text)
          .where("name",
          isEqualTo: nameController.text)
          .where("phoneNumber",
          isEqualTo: mobileController.text)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          resetPassword(idController.text);
          showCustomDialog(context, "비밀번호 재설정 알림이 발송되었습니다.", buttonText: "확인");
        }
        else {
          showCustomDialog(context, "일치하는 정보가 없습니다.", buttonText: "확인");
        }
      }
      );
    }
  }


  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: baseAppBar('비밀번호 찾기'),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            children: [
              const Flexible(
                fit: FlexFit.tight,
                child: Text(""),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '가입한 정보를 입력해주세요.',
                      style: getLoginTextStyle(),
                    ),
                    SizedBox(height: 11.h),
                    SizedBox(
                      height: 45.h,
                      child: TextFormField(
                        focusNode: emailNode,
                        cursorColor: const Color(0xffe2eef0),
                        style: getTextFieldFontStyle(),
                        controller: idController,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: (){
                          FocusScope.of(context).nextFocus();
                        },
                        decoration: getInputDeco('이메일 입력'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 45.h,
                      child: TextFormField(
                        focusNode: nameNode,
                        cursorColor: const Color(0xffe2eef0),
                        style: getTextFieldFontStyle(),
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: (){
                          FocusScope.of(context).nextFocus();
                        },
                        decoration: getInputDeco('이름 입력'),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 45.h,
                      child: TextFormField(
                        focusNode: phoneNode,
                        cursorColor: const Color(0xffe2eef0),
                        style: getTextFieldFontStyle(),
                        controller: mobileController,
                        decoration: getInputDeco('핸드폰 번호(-제외)'),
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (String value) async{
                          print('비밀번호 찾기');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              judge();
                              print('비밀번호 찾기');
                            },
                            child: const Text('비밀번호 찾기',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                            style: supprotusButtonStyle(const Color(0xff54c9a8)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom:28.h),
                      child: TextButton(
                        style: TextButton.styleFrom(primary: const Color(0xffaeefdd)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/searchId');
                        },
                        child: const Text(
                          '아이디 찾기',
                          style: TextStyle(
                            color:  Color(0xff484848),
                            fontWeight: FontWeight.w300,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline, //TODO 텍스트 밑줄 높이 조정
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
