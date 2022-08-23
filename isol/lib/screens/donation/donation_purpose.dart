import 'package:flutter/material.dart';
import '../../../widget/app_bar.dart';

class DonationPurpose extends StatefulWidget {
  const DonationPurpose({Key? key}) : super(key: key);

  @override
  State<DonationPurpose> createState() => _DonationPurposeState();
}

class _DonationPurposeState extends State<DonationPurpose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafcfd),
      appBar: baseAppBar('기부금 목적'),
    );
  }
}
