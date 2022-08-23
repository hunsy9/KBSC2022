import 'dart:ffi';
import 'dart:ui';
// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';
import 'package:flutter/services.dart';

import '../../style/style.dart';
import '../../widget/dialog.dart';
import '../../widget/sns_container.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore= FirebaseFirestore.instance;

  late FocusNode emailNode;
  late FocusNode nameNode;
  late FocusNode phoneNode;
  late FocusNode passwordNode;
  late FocusNode passwordCheckNode;
  late FocusNode otpNode;

  var idController = TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordReController = TextEditingController();
  var otpController = TextEditingController();


  String userID='';
  String userName='';
  String userPhone='';
  String userPassword='';
  String userPasswordCheck='';

  bool checkid = false; //id 중복체크 여부
  bool idReadonly = false; // 아이디 텍스트폼필드 비활성화용
  bool privacyReadonly = false; // 개인정보 텍스트폼필드 비활성화용
  bool _visibility = false;
  bool _snsvisibility = false;

  bool authOk=false;
  bool requestedAuth=false;
  String verificationId='';
  bool verifiedOK = true;


  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);

      if(authCredential.user != null){
        setState(() {
          print("인증완료 및 로그인성공");
          authOk=true;
          requestedAuth=false;
        });
        await _auth.currentUser!.delete();
        print("auth정보삭제");
        _auth.signOut();
        print("phone로그인된것 로그아웃");
        await showCustomDialog(context, "인증이 완료되었습니다.",buttonText: "확인").then((value) =>
            FocusScope.of(context).requestFocus(passwordNode));

        _scrollController.animateTo(170.h,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease);

        setState(() {
          _visibility = false;
          privacyReadonly = true;
          verifiedOK = false;
        });

      }

    } on FirebaseAuthException catch (e) {
      setState(() {
        print("인증실패..로그인실패");
      });

    }
  }


  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    emailNode = FocusNode();
    nameNode = FocusNode();
    phoneNode = FocusNode();
    passwordNode = FocusNode();
    passwordCheckNode = FocusNode();
    otpNode = FocusNode();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    emailNode.dispose();
    nameNode.dispose();
    phoneNode.dispose();
    passwordNode.dispose();
    passwordCheckNode.dispose();
    otpNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = baseAppBar('회원가입');

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = appBar.preferredSize.height;
    final logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height - statusBarHeight - appBarHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(20, 30.h, 20, 50.h),
            height: _height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이메일 입력',
                        style: getLoginTextStyle(),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 45.h,
                        child: TextFormField(//아이디 입력 텍스트폼필드 key 1
                          readOnly: idReadonly,
                          focusNode: emailNode,
                          autofocus: true,
                          onChanged: (value){
                            userID=value;
                          },
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: idController,
                          decoration: getInputDeco('이메일 입력'),
                          keyboardType: TextInputType.emailAddress,
                          onTap: (){
                            _scrollController.animateTo(50.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);

                          },
                        ),
                      ),
                      SizedBox(height: 9.h),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton( //중복체크버튼
                              onPressed: () async {
                                if(idController.text.isEmpty)
                                {
                                  showCustomDialog(context, "이메일을 입력해주세요.",buttonText: "확인");
                                }
                                else
                                {
                                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regExp = RegExp(pattern);
                                  if(!regExp.hasMatch(idController.text)){
                                    showCustomDialog(context, "이메일의 형식으로 해주세요.",buttonText: "확인");
                                  }
                                  else{
                                    await firestore
                                        .collection('user')
                                        .where("Id",
                                        isEqualTo: idController.text)
                                        .get()
                                        .then((QuerySnapshot querySnapshot) async{
                                      if(querySnapshot.docs.isNotEmpty){ //query를 통해 중복되는 아이디 확인시
                                        showCustomDialog(context, "중복되는 아이디가 있습니다.",buttonText: "확인");
                                      }
                                      else{ // 중복되는 아이디가 없으면
                                        setState(() {
                                          checkid = true;
                                          idReadonly = true;
                                        });
                                        await showCustomDialog(context, "사용 가능한 아이디입니다.",buttonText: "확인").then((value) =>
                                            FocusScope.of(context).requestFocus(nameNode)
                                        );
                                      }
                                    });
                                  }

                                }
                              },
                              child: const Text('중복체크',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                              style: supprotusButtonStyle(const Color(0xff626262)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        '개인정보 입력',
                        style: getLoginTextStyle(),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 45.h,
                        child: TextFormField( //이름 입력 key 2
                          focusNode: nameNode,
                          readOnly: privacyReadonly,
                          onChanged: (value){
                            userName=value;
                          },
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: nameController,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(phoneNode);
                            _scrollController.animateTo(140.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          decoration: getInputDeco('이름 입력'),
                          onTap: () async {
                            if(!checkid){
                              await showCustomDialog(context, "이메일을 먼저 입력해주세요", buttonText: "확인");
                              FocusScope.of(context).requestFocus(emailNode);
                            }
                            _scrollController.animateTo(120.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                      ),
                      SizedBox(height: 9.h),
                      SizedBox(
                        height: 45.h,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 21,
                              child: TextFormField( //연락처 입력 key3
                                focusNode: phoneNode,
                                readOnly: privacyReadonly,
                                onChanged: (value){ //값이 바뀌면 변수에 저장
                                  userPhone=value;
                                },
                                cursorColor: const Color(0xffe2eef0),
                                style: getTextFieldFontStyle(),
                                controller: mobileController,
                                decoration: getInputDeco('‘-’없이 연락처를 입력해주세요.'),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                onTap: ()async{
                                  if(!checkid){
                                    await showCustomDialog(context, "이메일을 먼저 입력해주세요", buttonText: "확인");
                                    FocusScope.of(context).requestFocus(emailNode);
                                  }
                                  _scrollController.animateTo(140.h,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            Flexible(
                                flex:6,
                                child: verifiedOK?RawMaterialButton(

                                    fillColor: const Color(0xff626262),
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                    elevation: 2.0,

                                    child: const Center(
                                      child: Text('인증요청',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.white)),
                                    ),
                                    onPressed: ()async{
                                      if(!checkid){
                                        showCustomDialog(context, "이메일을 입력해주세요", buttonText: "확인");
                                      }
                                      else{
                                        if(mobileController.text.isNotEmpty){
                                          await _auth.verifyPhoneNumber(
                                              phoneNumber: mobileController.text.replaceAll('010', '+8210'),
                                              verificationCompleted: (PhoneAuthCredential credential) async{
                                                print("성공");
                                              },
                                              verificationFailed: (FirebaseAuthException e){
                                                if (e.code == 'invalid-phone-number') {
                                                  print('The provided phone number is not valid.');
                                                }
                                              },
                                              codeSent:(String verificationID, int? resendToken)async{
                                                print('코드보냄');
                                                String smsCode = '';
                                                setState(() {
                                                  requestedAuth = true;
                                                  FocusScope.of(context).nextFocus();
                                                  this.verificationId = verificationID;
                                                });
                                              },
                                              codeAutoRetrievalTimeout:  (String verificationId) {
                                                //
                                              }
                                          );
                                          _snsvisibility=true;
                                          _visibility=true;
                                        }
                                        else{
                                          showCustomDialog(context, "연락처를 입력해주세요.", buttonText: "확인");
                                        }

                                      }

                                    }

                                )
                                    :
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xff626262),
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: Center(
                                    child: Text('인증완료',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.white)),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 9.h),

                      Visibility(
                        visible: _visibility,
                        child: SizedBox(
                          height: 46.h,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 21,
                                child: TextFormField( //otp 받는곳
                                  focusNode: otpNode,
                                  onChanged: (value){ //값이 바뀌면 변수에 저장
                                    userPhone=value;
                                  },
                                  cursorColor: const Color(0xffe2eef0),
                                  style: getTextFieldFontStyle(),
                                  controller: otpController,
                                  decoration: getInputDeco('인증번호 6자리 입력해주세요'),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  onTap: ()async{
                                    if(!checkid){
                                      await showCustomDialog(context, "이메일을 먼저 입력해주세요", buttonText: "확인");
                                      FocusScope.of(context).requestFocus(emailNode);
                                    }
                                    _scrollController.animateTo(140.h,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                              Flexible(
                                flex:6,
                                child: RawMaterialButton(

                                    fillColor: const Color(0xff626262),
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                    elevation: 2.0,

                                    child: const Center(
                                      child: Text('확인',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.white)),
                                    ),
                                    onPressed: ()async{
                                      PhoneAuthCredential phoneAuthCredential =
                                      PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
                                      signInWithPhoneAuthCredential(phoneAuthCredential);
                                    }

                                ),
                              )


                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                        '비밀번호 입력',
                        style: getLoginTextStyle(),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 45.h,
                        child: TextFormField( //비밀번호 입력 key 4
                          focusNode: passwordNode,
                          onChanged: (value){
                            userPassword=value;
                          },
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: passwordController,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(passwordCheckNode);
                            _scrollController.animateTo(200.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          decoration: getInputDeco('비밀번호 입력'),
                          onTap: ()async{
                            if(!checkid){
                              await showCustomDialog(context, "이메일을 먼저 입력해주세요", buttonText: "확인");
                              FocusScope.of(context).requestFocus(emailNode);
                            }
                            _scrollController.animateTo(170.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                      ),
                      SizedBox(height: 9.h),
                      SizedBox(
                        height: 45.h,
                        child: TextFormField( //비번 확인 key5
                          focusNode: passwordCheckNode,
                          onChanged: (value){
                            userPasswordCheck=value;
                          },
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: passwordReController,
                          decoration: getInputDeco('비밀번호 확인'),
                          obscureText: true,
                          textInputAction: TextInputAction.done,

                          onTap: ()async{
                            if(!checkid){
                              await showCustomDialog(context, "이메일을 먼저 입력해주세요", buttonText: "확인");
                              FocusScope.of(context).requestFocus(emailNode);
                            }
                            _scrollController.animateTo(200.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                if(passwordController.text==passwordReController.text)
                                {
                                  try {
                                    final newUser = await _auth  //authentication에 이메일,비번 등록
                                        .createUserWithEmailAndPassword(
                                        email: userID, password: userPassword);

                                    await firestore.collection('user').doc('data').set({ //firestore에 사용자정보 등록

                                      "Id":userID,
                                      "passWord":userPassword,
                                      "name":userName,
                                      "phoneNumber":userPhone,
                                    });

                                    if(newUser.user != null)
                                    {
                                      await showCustomDialog(context,"회원가입이 완료되었습니다.",buttonText: '기부처 찾으러 가기').then((value) =>
                                          Navigator.pushNamedAndRemoveUntil(context, '/navigation',(route) => false)
                                      );
                                    }

                                  }catch(e){
                                    print(e);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content:
                                          Text('이메일과 패스워드를 확인해주세요'),
                                          backgroundColor: Colors.blue,
                                        )
                                    );
                                  }
                                }
                                else{
                                  showCustomDialog(context,"비밀번호를 확인해주세요.",buttonText: "확인").then((value) =>
                                      FocusScope.of(context).requestFocus(passwordCheckNode)
                                  );
                                }
                              },
                              child: const Text('회원가입 완료',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                              style: supprotusButtonStyle(const Color(0xff54c9a8)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: !_snsvisibility,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SNS 간편 회원가입',
                        style: getLoginTextStyle(),
                      ),
                      SizedBox( height: 9.h),
                      const SnsContainer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
