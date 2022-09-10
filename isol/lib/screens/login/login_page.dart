import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/style.dart';
import '../../widget/app_bar.dart';
import '../../widget/custom_check_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../screens/navigation.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final _authentication = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String userID = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
    }
  }

  bool rememberLoginCheck = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      // appBar: statusBarColor(SystemUiOverlayStyle.dark),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
            return const Navigation();
          }
          else if(snapshot.hasError){
            return const Center(child: Text("Something Went Wrong!"),);
          }
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: SizedBox(
                height: _height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 270.h),
                        child: Column(children: [
                          Image.asset('assets/xhdpi/ISOL.png',
                              width: 250.w),
                          Column(
                            children: [
                              Form(
                                key: _formkey,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        key: ValueKey(1),
                                        validator: (value) {
                                          if (value!.isEmpty || value.length < 4) {
                                            return '4자리 수보다 많은 자릿수를 입력하세요.';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          userID = value!;
                                        },
                                        onChanged: (value) {
                                          userID = value;
                                        },
                                        cursorColor: const Color(0xffe2eef0),
                                        style: getTextFieldFontStyle(),
                                        controller: emailController,
                                        textInputAction: TextInputAction.next,
                                        decoration: getInputDeco('이메일'),
                                        keyboardType: TextInputType.emailAddress,
                                        // onTap: () {
                                        //   _scrollController.animateTo(120.h,
                                        //       duration:
                                        //       const Duration(milliseconds: 500),
                                        //       curve: Curves.ease);
                                        // },
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        key: ValueKey(2),
                                        validator: (value) {
                                          if (value!.isEmpty || value.length < 6) {
                                            return '6자리 수보다 많은 자릿수를 입력하세요.';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          userPassword = value!;
                                        },
                                        onChanged: (value) {
                                          userPassword = value;
                                        },
                                        cursorColor: const Color(0xffe2eef0),
                                        style: getTextFieldFontStyle(),
                                        controller: passwordController,
                                        decoration: getInputDeco('패스워드'),
                                        obscureText: true,
                                        textInputAction: TextInputAction.done,
                                        // onTap: () {
                                        //   _scrollController.animateTo(120.h,
                                        //       duration:
                                        //       const Duration(milliseconds: 500),
                                        //       curve: Curves.ease);
                                        // },
                                        onFieldSubmitted: (String value) async {
                                          print('로그인');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        rememberLoginCheck = !rememberLoginCheck;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomCheckBox(
                                          checkBoxSize: 15,
                                          borderRadius: 10,
                                          shouldShowBorder: true,
                                          borderWidth: 1,
                                          borderColor: const Color(0xff0029d7),
                                          checkedFillColor: const Color(0xff0029d7),
                                          value: rememberLoginCheck,
                                          onChanged: (val) {
                                            setState(() {
                                              rememberLoginCheck = val;
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        const Text('자동 로그인',
                                            style: TextStyle(
                                                color: Color(0xff484848),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                                letterSpacing: -0.6)),
                                      ],
                                    ),
                                  ),
                                  Row(children: <Widget>[
                                    // 아이디 찾기
                                    GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          Navigator.pushNamed(context, '/searchId');
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('아이디',
                                              style: TextStyle(
                                                  color:
                                                  Color.fromRGBO(72, 72, 72, 1),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                  letterSpacing: -0.6)),
                                        )),
                                    const Text(' | ',
                                        style: TextStyle(
                                            color: Color.fromRGBO(72, 72, 72, 1),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            letterSpacing: -0.6)),
                                    //비밀번호 찾기
                                    GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/searchPassword');
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('비밀번호 찾기',
                                              style: TextStyle(
                                                  color:
                                                  Color.fromRGBO(72, 72, 72, 1),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                  letterSpacing: -0.6)),
                                        )),
                                  ]),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Navigator.pushNamed(context, '/signUpPage');
                                      },
                                      child: const Text('회원가입',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                      style: supprotusButtonStyle(
                                          const Color(0xff053dc2)),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                          try {
                                            final newUser = await _authentication
                                                .signInWithEmailAndPassword(
                                                email: userID,
                                                password: userPassword);
                                            if (newUser.user != null) {
                                              print("로그인성공");
                                            }
                                          } catch (e) {
                                            print(e);
                                          }
                                        }
                                        // Navigator.pushNamed(
                                        //     context, '/navigation');
                                        /*_tryValidation();
                                        try {
                                          final newUser = await _authentication
                                              .signInWithEmailAndPassword(
                                              email: userID,
                                              password: userPassword);
                                          if (newUser.user != null) {
                                            Navigator.pushNamed(
                                                context, '/navigation');
                                          }
                                        } catch (e) {
                                          print(e);
                                        }
                                      },*/
                                      ,child: const Text('로그인',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                      style: supprotusButtonStyle(
                                          const Color(0xff000275)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
          );
        }
      ),
    );
  }
}