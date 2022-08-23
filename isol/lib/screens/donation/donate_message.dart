import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/app_bar.dart';
import '../../widget/donation_widget.dart';
import 'donate_payment.dart';

class DonateMessage extends StatefulWidget {
  const DonateMessage({Key? key}) : super(key: key);

  @override
  State<DonateMessage> createState() => _DonateMessageState();
}

class _DonateMessageState extends State<DonateMessage> {
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
    return Scaffold(
        appBar: baseAppBar('기부하기'),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, top: 20.h, right: 15.w, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  donationInfoBox(context),
                  SizedBox(height: 43.h,),
                  Text(
                    "기부처에게 남기고 싶은말",
                    style: TextStyle(
                        color:  const Color(0xff313131),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 16.sp
                    ),
                  ),
                  SizedBox(height: 9.h,),
                  Container(
                    height: 140.h,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)
                        ),
                        border: Border.all(
                            color: const Color(0xffe2eef0),
                            width: 1
                        ),
                        boxShadow: const [BoxShadow(
                            color: Color(0xffe2eef0),
                            offset: Offset(0,3),
                            blurRadius: 6,
                            spreadRadius: 0
                        )] ,
                        color: const Color(0xffffffff)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 6,
                              onTap: (){
                                _scrollController.animateTo(100.h,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease);
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '직접입력',
                                enabled: true,
                                hintStyle: TextStyle(
                                    color:  Color(0xff909090),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NotoSansKR",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 15.0
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100.h,)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: donationBottomButton(context, const DonatePayment(), '다음')
    );
  }
}
