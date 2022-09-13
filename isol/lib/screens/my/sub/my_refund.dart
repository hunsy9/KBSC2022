import 'package:flutter/material.dart';

import '../../../widget/app_bar.dart';

class MyRefund extends StatefulWidget {
  const MyRefund({Key? key}) : super(key: key);

  @override
  _MyRefundState createState() => _MyRefundState();
}

class _MyRefundState extends State<MyRefund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('후원금 취소/환불 내역'),
    );
  }
}
