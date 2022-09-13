import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';
import '../../widget/custom_radio_buttons.dart';
import '../../widget/donation_widget.dart';
import 'donate_method.dart';

class Donate extends StatefulWidget {
  const Donate({Key? key}) : super(key: key);

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  List<RadioModel> sampleData = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    sampleData.add(RadioModel(false, false, '구호물품 구매여비'));
    sampleData.add(RadioModel(false, false, '학교 재건비'));
    sampleData.add(RadioModel(false, false, '자원봉사자 봉사 여비'));
    sampleData.add(RadioModel(false, false, '자유롭게 사용해주세요.'));
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
                "후원금 목적을 선택해주세요.",
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
      bottomNavigationBar: donationBottomButton(context, const DonateMethod(), '다음')
    );
  }
}
