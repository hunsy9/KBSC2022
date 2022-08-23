import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SnsContainer extends StatefulWidget {
  const SnsContainer({Key? key}) : super(key: key);

  @override
  SnsContainerState createState() => SnsContainerState();
}

class SnsContainerState extends State<SnsContainer> {

  @override
  void initState(){
    super.initState();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithKaKao() async {
    final clientState = Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': "16a759a5c12588068f1bcaf56772f2e9",
      'response_mode': 'form_post',
      'redirect_uri':
      'https://warp-dazzling-vegetarian.glitch.me/callback/kakao/sign_in',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: "webauthcallback"); //"applink"//"signinwithapple"
    final body = Uri.parse(result).queryParameters;
    print(body["code"]);

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': "16a759a5c12588068f1bcaf56772f2e9",
      'redirect_uri':
      'https://warp-dazzling-vegetarian.glitch.me/callback/kakao/sign_in',
      'code': body["code"],
    });
    var customTokenUrl = Uri.parse("https://warp-dazzling-vegetarian.glitch.me/callback/kakao/token");

    var responseTokens = await http.post(tokenUrl);
    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http.post(
        customTokenUrl,
        body: {"accessToken": bodys['access_token']});
    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }

  Future<UserCredential> signInWithNaver() async {
    final clientState = Uuid().v4();
    final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
      'response_type': 'code',
      'client_id': "AZUGiZBs79I2lVP5BD4f",
      'response_mode': 'form_post',
      'redirect_uri':
      'https://warp-dazzling-vegetarian.glitch.me/callback/naver/sign_in/',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: "webauthcallback"); //"applink"//"signinwithapple"
    final body = Uri.parse(result).queryParameters;
    print(body["code"]);

    final tokenUrl = Uri.https('nid.naver.com', '/oauth2.0/token', {
      'grant_type': 'authorization_code',
      'client_id': "AZUGiZBs79I2lVP5BD4f",
      'client_secret':'4y7jDDYe_R',
      'code': body["code"],
      'state': clientState,
    });
    var customTokenUrl = Uri.parse("https://warp-dazzling-vegetarian.glitch.me/callback/naver/token");

    var responseTokens = await http.post(tokenUrl);
    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http.post(
        customTokenUrl,
        body: {"accessToken": bodys['access_token']});
    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }

  Future<UserCredential> signInWithApple() async {

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(clientId: "com.supportus.supportusFlutterApp.web", redirectUri: Uri.parse("https://warp-dazzling-vegetarian.glitch.me/callbacks/sign_in_with_apple"),)
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  @override
  Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.only(left: 40.w, right: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  signInWithGoogle();
                  print('구글 로그인');
                },
                child: Image.asset('assets/xhdpi/icon_facebook.png',
                  width: 50.w,),
              ),
              GestureDetector(
                onTap: (){
                  signInWithApple();
                  print('애플 로그인');
                },
                child: Image.asset('assets/xhdpi/icon_apple.png',
                  width: 50.w,),
              ),
              GestureDetector(
                onTap: () async{
                  signInWithNaver();
                  print('네이버 로그인');
                },
                child: Image.asset('assets/xhdpi/icon_naver.png',
                  width: 50.w,),
              ),
              GestureDetector(
                onTap: (){
                  signInWithKaKao();
                  print('카카오 로그인');
                },
                child: Image.asset('assets/xhdpi/icon_kakao.png',
                  width: 50.w,),
              ),
            ],
          ),
        );
      }
  }
