import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/style.dart';
import '../../widget/app_bar.dart';
import '../../widget/custom_check_box.dart';
import '../../widget/donation_widget.dart';

import 'package:flutter/material.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';
import 'donate_completion.dart';
import 'package:bootpay_api/bootpay_api.dart';
import 'package:bootpay_api/model/payload.dart';
import 'package:bootpay_api/model/extra.dart';
import 'package:bootpay_api/model/user.dart';
import 'package:bootpay_api/model/item.dart';

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
        appBar: baseAppBar('후원하기'),
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
                                "후원금 목적",
                                style: TextStyle(
                                    color:  const Color(0xff222222),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansKR",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 13.sp
                                ),
                            ),
                            Text(
                                "학교 재건비",
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
                          "후원처에게 남기고 싶은말",
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
                          height: 100.h,
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
                              "",
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
                          "후원금 결제 금액",
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
                                    "후원금 결제 금액",
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
        bottomNavigationBar: SizedBox(
      height: 60.h,
      child: ElevatedButton(
        onPressed: () {
          goBootpayRequest(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(const Color(
              0xff2938ff)),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Text(
            "후원금 결제하기",
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
    ),
    );
  }
}

void goBootpayRequest(BuildContext context) async {
  Payload payload = Payload();
  payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
  payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

  payload.pg = 'nicepay';
  payload.method = 'card';
//  payload.methods = ['card', 'phone', 'vbank', 'bank'];
  payload.name = 'testUser';
  payload.price = 10000.0;
  payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();
//    payload.params = {
//      "callbackParam1" : "value12",
//      "callbackParam2" : "value34",
//      "callbackParam3" : "value56",
//      "callbackParam4" : "value78",
//    };

  User user = User();
  user.username = "사용자 이름";
  user.email = "user1234@gmail.com";
  user.area = "서울";
  user.phone = "010-1234-4567";

  Extra extra = Extra();
  extra.appScheme = 'bootpaySample';

  Item item1 = Item();
  item1.itemName = "기부금1"; // 주문정보에 담길 상품명
  item1.qty = 1; // 해당 상품의 주문 수량
  item1.unique = "ITEM_CODE_DONATE1"; // 해당 상품의 고유 키
  item1.price = 30000; // 상품의 가격

  Item item2 = Item();
  item2.itemName = "기부금2"; // 주문정보에 담길 상품명
  item2.qty = 1; // 해당 상품의 주문 수량
  item2.unique = "ITEM_CODE_DONATE2"; // 해당 상품의 고유 키
  item2.price = 20000; // 상품의 가격
  List<Item> itemList = [item1, item2];

  BootpayApi.request(
    context,
    payload,
    extra: extra,
    user: user,
    items: itemList,
    onDone: (String? json) {
      print('onDone: $json');
    },
    onReady: (String? json) {
      //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
      print('onReady: $json');
    },
    onCancel: (String? json) {
      print('onCancel: $json');
    },
    onError: (String? json) {
      print('onError: $json');
    },
  );
}