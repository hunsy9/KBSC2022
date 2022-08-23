// import 'dart:html';



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';
import '../../widget/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../style/style.dart';

class SearchId extends StatefulWidget {
  const SearchId({Key? key}) : super(key: key);

  @override
  _SearchIdState createState() => _SearchIdState();
}

class _SearchIdState extends State<SearchId> {
  FirebaseFirestore firestore= FirebaseFirestore.instance;

  var nameController = TextEditingController();
  var mobileController = TextEditingController();

  String userName = '';
  String userPhone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,//키보드올라올때 bottom overflow해결
      backgroundColor: Colors.white,
      appBar: baseAppBar('아이디 찾기'),
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
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '가입한 이름과 전화번호를 입력해주세요.',
                        style: getLoginTextStyle(),
                      ),
                      SizedBox(height: 11.h),

                      SizedBox(
                        height: 45.h,
                        child: TextFormField( //이름 입력 field
                          key: const ValueKey(1),
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: nameController,
                          textInputAction: TextInputAction.next,
                          decoration: getInputDeco('이름 입력'),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value){
                            userName=value;
                          },
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 45.h,
                        child: TextFormField(
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: mobileController,
                          decoration: getInputDeco('핸드폰 번호(-제외)'),
                          textInputAction: TextInputAction.done,
                          onChanged: (value){
                            userPhone=value;
                          },
                          onFieldSubmitted: (String value) async{
                            print('아이디 찾기');
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


                                if(nameController.text.isEmpty){
                                  showCustomDialog(context, "이름을 입력해주세요.",buttonText: "확인");
                                }
                                else{
                                  if(mobileController.text.isEmpty){
                                    showCustomDialog(context, "핸드폰 번호를 입력해주세요.",buttonText: "확인");
                                  }
                                  else{
                                    await firestore
                                        .collection('user')
                                        .where("name",
                                        isEqualTo: nameController.text)
                                        .where("phoneNumber",
                                        isEqualTo: mobileController.text)
                                        .get()
                                        .then((QuerySnapshot querySnapshot) {
                                      if(querySnapshot.docs.isEmpty){
                                        showCustomDialog(context, "정보가 존재하지 않습니다.",buttonText: "확인");
                                      }
                                      querySnapshot.docs.forEach((doc) {

                                        showCustomDialog(context,
                                            nameController.text + "님의 아이디는\n" +
                                                doc["Id"] + "입니다.",
                                            buttonText: "확인");
                                      });
                                    });
                                  }
                                }

                              },
                              child: const Text('아이디 찾기',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                              style: supprotusButtonStyle(const Color(0xff54c9a8)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
                          Navigator.pushReplacementNamed(context, '/searchPassword');
                        },
                        child: const Text(
                          '비밀번호 찾기',
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