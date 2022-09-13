import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/app_bar.dart';

class DonationProcess extends StatefulWidget {
  const DonationProcess({Key? key}) : super(key: key);

  @override
  State<DonationProcess> createState() => _DonationProcessState();
}

class _DonationProcessState extends State<DonationProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('후원금 프로세스'),
      body: Container(
        padding: const EdgeInsets.all(15),

    )
    );
  }
}