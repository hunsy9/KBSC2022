import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = [];

  @override
  void initState() {
    sampleData.add(RadioModel(false, false, '후원방식이 마음에 안들어요.'));
    sampleData.add(RadioModel(false, false, '후원금액을 변경하고싶어요.'));
    sampleData.add(RadioModel(false, false, '다른 기부처에 후원하고 싶어요.'));
    sampleData.add(RadioModel(false, true, '직접입력'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio test"),
      ),
      body: ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print('asdf');
              setState(() {
                for (var element in sampleData) {
                  element.isSelected = false;
                  element.myFocusNode.unfocus();
                }
                sampleData[index].isSelected = true;
                sampleData[index].myFocusNode.requestFocus();
              });
            },
            child: RadioItem(sampleData[index]),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(10)
            ),
            border: Border.all(
                color: _item.isSelected ? const Color(0xff000275) : const Color(0xffe2eef0),
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
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IgnorePointer(
            child: TextField(
              onChanged: (text){
                _item.enteredText = text;
              },
              focusNode: _item.myFocusNode,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _item.text,
                enabled: _item.isInput,
                hintStyle: TextStyle(
                    color:  _item.isSelected ? const Color(0xff000275) : const Color(0xff909090),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle:  FontStyle.normal,
                    fontSize: 15.sp
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  bool isInput;
  String enteredText= '';
  final String text;

  FocusNode myFocusNode = FocusNode();

  RadioModel(this.isSelected, this.isInput, this.text);
}