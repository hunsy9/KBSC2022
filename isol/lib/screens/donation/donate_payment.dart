import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/style.dart';
import '../../widget/app_bar.dart';
import '../../widget/custom_check_box.dart';
import '../../widget/donation_widget.dart';
import 'donate_paymentApi.dart';

class DonatePayment extends StatefulWidget {
  const DonatePayment({Key? key}) : super(key: key);

  @override
  State<DonatePayment> createState() => _DonatePaymentState();
}

class _DonatePaymentState extends State<DonatePayment> {
  late ScrollController _scrollController;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  bool check = false;


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
    return Scaffold(
        appBar: baseAppBar('기부하기'),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 20.h, right: 15.w, bottom: 20.h),
                  child: donationInfoBox(context),
                ),
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(15.h, 22.w, 15.h, 17.w),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "선택확인",
                          style: TextStyle(
                              color:  const Color(0xff222222),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 16.sp
                          ),
                      ),
                      SizedBox(height: 6.h,),
                      Container(
                          height: 1,
                          decoration: const BoxDecoration(
                              color: Color(0xffd0d0d0)
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.h, bottom: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "기부금 목적",
                                style: TextStyle(
                                    color:  const Color(0xff222222),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansKR",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 13.sp
                                ),
                            ),
                            Text(
                                "대학생 봉사 활동비",
                                style: TextStyle(
                                    color:  const Color(0xff222222),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansKR",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 13.sp
                                ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: 1,
                          decoration: const BoxDecoration(
                              color: Color(0xfff8f8f8)
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.h, bottom: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "후원 방식",
                              style: TextStyle(
                                  color:  const Color(0xff222222),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 13.sp
                              ),
                            ),
                            Text(
                              "1회 후원",
                              style: TextStyle(
                                  color:  const Color(0xff222222),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 13.sp
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: 1,
                          decoration: const BoxDecoration(
                              color: Color(0xfff8f8f8)
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.h, bottom: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "후원 금액",
                              style: TextStyle(
                                  color:  const Color(0xff222222),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 13.sp
                              ),
                            ),
                            Text(
                              "1만원",
                              style: TextStyle(
                                  color:  const Color(0xff222222),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 13.sp
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: 1,
                          decoration: const BoxDecoration(
                              color: Color(0xfff8f8f8)
                          )
                      ),
                      SizedBox(height: 15.h,),
                      Text(
                          "기부처에게 남기고 싶은말",
                          style: TextStyle(
                              color:  const Color(0xff222222),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 13.sp
                          ),
                      ),
                      SizedBox(height: 7.h,),
                      Container(
                          height: 140.h,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5)
                              ),
                              border: Border.all(
                                  color: const Color(0xfff6f6f6),
                                  width: 1
                              ),
                              color: const Color(0xfffdfdfd)
                          ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 9.w, top: 15.h, right: 9.w, bottom: 15.h),
                          child: Text(
                              "“자고 있는데 화재 경보음 소리에 깜짝 놀라 깨보니까, 눈앞에 불이 번쩍하더라고. 큰일 날 뻔했어” 오래된 전선이 곧 끊어질 듯 위태하게 이어져 있는 천장에는 불에 탄 시커먼 자국과 켜지지 않는 전등만이 남겨져 있습니다. 그 어두운 방 안 텔레비전 불빛에 의존해 생활하고 있는 정◯◯어르신은 큰 불로 번지지 않았다는 안도감이 든 것도 잠시, 오래된 전선 때문에 또 ",
                          style: TextStyle(
                              color:  const Color(0xff313131),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 13.sp
                        ),
                            maxLines: 6,
                      ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 9.h,),
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(15.h, 22.w, 15.h, 20.w),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "서포터정보",
                        style: TextStyle(
                            color:  const Color(0xff222222),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 16.sp
                        ),
                      ),
                      SizedBox(height: 6.h,),
                      Container(
                          height: 1,
                          decoration: const BoxDecoration(
                              color: Color(0xffd0d0d0)
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only( top: 14.h, bottom: 5.h),
                        child: Text(
                            "이름 *",
                            style: TextStyle(
                                color:  const Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle:  FontStyle.normal,
                                fontSize: 13.sp
                            ),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                        child: TextFormField(
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: nameController,
                          decoration: getInputDeco('이름 입력'),
                          onTap: (){
                            _scrollController.animateTo(480.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only( top: 14.h, bottom: 5.h),
                        child: Text(
                          "이메일 *",
                          style: TextStyle(
                              color:  const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 13.sp
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                        child: TextFormField(
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: emailController,
                          decoration: getInputDeco('이메일 입력'),
                          keyboardType: TextInputType.emailAddress,
                          onTap: (){
                            _scrollController.animateTo(525.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only( top: 14.h, bottom: 5.h),
                        child: Text(
                          "휴대폰번호 *",
                          style: TextStyle(
                              color:  const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 13.sp
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                        child: TextFormField(
                          cursorColor: const Color(0xffe2eef0),
                          style: getTextFieldFontStyle(),
                          controller: mobileController,
                          decoration: getInputDeco("'-'없이 연락처를 입력해주세요."),
                          keyboardType: TextInputType.phone,
                          onTap: (){
                            _scrollController.animateTo(570.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                      ),
                      SizedBox(height: 27.h,),
                      Text(
                          "기부금 결제 금액",
                          style: TextStyle(
                              color:  const Color(0xff222222),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 16.sp
                          ),
                      ),
                      SizedBox(height: 6.h,),
                      Container(
                        padding: EdgeInsetsDirectional.fromSTEB(11.w, 9.h, 14.w, 9.h),
                          height: 67.h,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5)
                              ),
                              border: Border.all(
                                  color: const Color(0xfff6f6f6),
                                  width: 1
                              ),
                              color: const Color(0xfffdfdfd)
                          ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "기부금 결제 금액",
                                    style: TextStyle(
                                        color:  const Color(0xff000000),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NotoSansKR",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 13.sp
                                    ),
                                ),
                                Text(
                                    "10,000원",
                                    style: TextStyle(
                                        color:  const Color(0xff000000),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NotoSansKR",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 13.sp
                                    ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "최종금액",
                                    style: TextStyle(
                                        color:  const Color(0xfff3755e),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NotoSansKR",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 13.sp
                                    ),
                                ),
                                Text(
                                    "1,0000원",
                                    style: TextStyle(
                                        color:  const Color(0xfff3755e),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NotoSansKR",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 13.sp
                                    ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h,),
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(15.h, 11.w, 15.h, 20.w),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "결제수단 선택",
                          style: TextStyle(
                              color:  const Color(0xff222222),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 16.sp
                          ),
                      ),
                      SizedBox(height: 6.h,),
                      SizedBox(
                        height: 40.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('신용카드');
                                },
                                child: Text(
                                  "신용카드",
                                  style: TextStyle(
                                      color:  const Color(0xff4b4b4b),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 13.sp
                                  ),
                                ),
                                style: paymentButtonStyle(const Color(0xfffafafa)),
                              ),
                            ),
                            SizedBox(width: 7.w,),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('실시간 계좌이체');

                                },
                                child: Text(
                                  "실시간 계좌이체",
                                  style: TextStyle(
                                      color:  const Color(0xff4b4b4b),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 13.sp
                                  ),
                                ),
                                style: paymentButtonStyle(const Color(0xfffafafa)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 6.h,),
                      SizedBox(
                        height: 40.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('가상계좌(무통장입금)');

                                },
                                child: Text(
                                  "가상계좌(무통장입금)",
                                  style: TextStyle(
                                      color:  const Color(0xff4b4b4b),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 13.sp
                                  ),
                                ),
                                style: paymentButtonStyle(const Color(0xfffafafa)),
                              ),
                            ),
                            SizedBox(width: 7.w,),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('에스크로(가상계좌)');

                                },
                                child: Text(
                                  "에스크로(가상계좌)",
                                  style: TextStyle(
                                      color:  const Color(0xff4b4b4b),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 13.sp
                                  ),
                                ),
                                style: paymentButtonStyle(const Color(0xfffafafa)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 6.h,),
                      SizedBox(
                        height: 40.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('카카오페이');

                                },
                                child: Text(
                                  "카카오페이",
                                  style: TextStyle(
                                      color:  const Color(0xff4b4b4b),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 13.sp
                                  ),
                                ),
                                style: paymentButtonStyle(const Color(0xfffafafa)),
                              ),
                            ),
                            SizedBox(width: 7.w,),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('네이버페이');
                                },
                                child: Text(
                                  "네이버페이",
                                  style: TextStyle(
                                      color:  const Color(0xff4b4b4b),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 13.sp
                                  ),
                                ),
                                style: paymentButtonStyle(const Color(0xfffafafa)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8.h,),
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(15.h, 11.w, 15.h, 20.w),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "이용약관 동의",
                          style: TextStyle(
                              color:  const Color(0xff383838),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 13.sp
                          ),
                      ),
                      SizedBox(height: 6.h,),
                      RichText(
                          text: TextSpan(
                              children: [
                          TextSpan(
                              style: TextStyle(
                              color:  const Color(0xff545454),
                              fontWeight: FontWeight.w300,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
                              fontSize: 13.sp
                          ),
                              text: "구매동의 및 결제대행 서비스 이용약관 등에 모두 동의하십니까?")
                              ])),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          print('약관보기');
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h, right: 8.w, bottom: 8.w),
                          child: Text(
                              '약관보기',
                              style : TextStyle(
                                  color:  const Color(0xffff7045),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 13.sp,
                                  decoration: TextDecoration.underline,
                              ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            check = !check;
                          });
                        },
                        child: Row(
                          children: [
                            CustomCheckBox(
                              checkBoxSize: 15,
                              borderRadius: 10,
                              shouldShowBorder: true,
                              borderWidth: 1,
                              borderColor: const Color(0xfff3755e),
                              checkedFillColor: const Color(0xfff3755e),
                              value: check,
                              onChanged: (val) {
                                setState(() {
                                  check = val;
                                });
                              },
                            ),
                            SizedBox(width: 3.w,),
                            Text(
                                "모두 동의합니다.",
                                style: TextStyle(
                                    color:  const Color(0xff000000),
                                    fontWeight: FontWeight.w400,
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
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: donationBottomButton(context, const DonatePaymentApi(), '기부금 결제하기')
    );
  }
}
