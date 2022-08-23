import 'package:flutter/material.dart';

import '../../../widget/app_bar.dart';

class MyQuestion extends StatefulWidget {
  const MyQuestion({Key? key}) : super(key: key);

  @override
  _MyQuestionState createState() => _MyQuestionState();
}

class _MyQuestionState extends State<MyQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('1:1 문의'),
    );
  }
}
