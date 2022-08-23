import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/style.dart';
import '../../../../widget/app_bar.dart';
import '../../../../widget/my_widget.dart';

class MyDonation extends StatefulWidget {
  const MyDonation({Key? key}) : super(key: key);

  @override
  _MyDonationState createState() => _MyDonationState();
}

class _MyDonationState extends State<MyDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('내가 후원한 기부처'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w),
              child: Column(
                children: [
                  myDonationBox(context),
                  myDonationBox(context),
                  myDonationBox(context),
                  myDonationBox(context),
                  myDonationBox(context),
                  myDonationBox(context),
                  myDonationBox(context),
                  myDonationBox(context),
                 ],
              ),
            ),
          );
        }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  print('기부금 영수증 일괄 다운로드');
                },
                child: const Text('기부금 영수증 일괄 다운로드',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                style: supprotusButtonStyle(const Color(0xff54c9a8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
