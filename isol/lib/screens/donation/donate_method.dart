import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';

import '../../widget/custom_radio_buttons.dart';
import '../../widget/donation_widget.dart';
import 'donate_message.dart';

class DonateMethod extends StatefulWidget {
  const DonateMethod({Key? key}) : super(key: key);

  @override
  State<DonateMethod> createState() => _DonateMethodState();
}

class _DonateMethodState extends State<DonateMethod> {
  List<RadioModel> sampleData = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    //TODO 정기후원 결제 시스템(2차 업데이트 시 배포 예정)
    _scrollController = ScrollController();
    sampleData.add(RadioModel(false, false, '1만원'));
    sampleData.add(RadioModel(false, false, '5만원'));
    sampleData.add(RadioModel(false, false, '10만원'));
    sampleData.add(RadioModel(false, false, '30만원'));
    sampleData.add(RadioModel(false, true, '직접입력'));
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
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, top: 20.h, right: 15.w, bottom: 20.h),
            child: ListView(
              controller: _scrollController,
              children: [
                donationInfoBox(context),
                SizedBox(height: 43.h,),
                Text(
                  "후원 금액을 선택해 주세요.",
                  style: TextStyle(
                      color:  const Color(0xff313131),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansKR",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.sp
                  ),
                ),
                SizedBox(height: 9.h,),
                SizedBox(
                  width: double.infinity,
                  height: 300.h,
                  child: ListView.builder(
                    itemCount: sampleData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var element in sampleData) {
                              element.isSelected = false;
                              element.myFocusNode.unfocus();
                            }
                            sampleData[index].isSelected = true;
                            sampleData[index].myFocusNode.requestFocus();
                          });

                          if(sampleData[index].text == "직접입력"){
                            _scrollController.animateTo(120.h,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.ease);
                          }

                          print(sampleData[index].text);
                          print(sampleData[index].enteredText);
                        },
                        child: RadioItem(sampleData[index]),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: donationBottomButton(context, const DonateMessage(), '다음')
    );
  }
}
