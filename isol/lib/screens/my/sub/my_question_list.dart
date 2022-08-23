import 'package:flutter/material.dart';

import '../../../widget/app_bar.dart';

class MyQuestionList extends StatefulWidget {
  const MyQuestionList({Key? key}) : super(key: key);

  @override
  _MyQuestionListState createState() => _MyQuestionListState();
}

class _MyQuestionListState extends State<MyQuestionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('1:1문의 내역'),
    );
  }
}
