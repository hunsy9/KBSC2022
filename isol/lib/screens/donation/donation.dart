import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/app_bar.dart';
import 'filter.dart';
import 'donation_info.dart';

class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  final choices = ['전체', '아동,청소년', '어르신', '여성', '우리사회', '환경', '동물'];
  var index = 0;

  Map<int, bool> selectedFilter = {
    0: true, //교육
    1: true, //의료
    2: true, //문화예술
    3: true, //장학
    4: true, //생계
    5: true, //인식
    6: true, //글로벌
    7: true, //주거
    8: true, //보호
  };

  Future<bool> _init() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        backgroundColor: const Color(0x99f7fbfc),
        appBar: baseAppBar('기부처'),
        body: FutureBuilder(
          future: _init(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return const Center(child: CircularProgressIndicator(
                color: Color(0xff053dc2),
              ));
            } else {
              return Center(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(
                              color: Color(0xffe2eef0),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                              spreadRadius: 0
                          )
                          ],
                          color: Color(0xffffffff)
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                            child: TabBar(
                              onTap: (idx) {
                                setState(() {
                                  index = idx;
                                });
                              },
                              tabs: choices.map((String choice) {
                                return Tab(text: choice);
                              }).toList(),
                              isScrollable: true,
                              unselectedLabelColor: const Color(0xff313131),
                              indicatorColor: const Color(0xff053dc2),
                              labelColor: const Color(0xff053dc2), // 많으면 자동 스크롤
                            ),
                          ),
                          Builder(
                              builder: (context) {
                                return Visibility(
                                  visible: index != 0,
                                  child: SizedBox(
                                    height: 40.h,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.w, right: 10.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              padding: const EdgeInsets.all(9),
                                              itemCount: selectedFilter.length,
                                              itemBuilder: (
                                                  BuildContext context,
                                                  int index) {
                                                if (selectedFilter[index]!) {
                                                  return filterItem(index);
                                                } else {
                                                  return const SizedBox(
                                                    width: 0,);
                                                }
                                              },
                                            ),
                                          ),
                                          IconButton(onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (
                                                  context) => const Filter()),
                                            ).then((value) {
                                              setState(() {
                                                if (value != null)
                                                  selectedFilter = value;
                                              });
                                            });
                                          },
                                              icon: const ImageIcon(
                                                AssetImage(
                                                    "assets/xhdpi/icon_filter.png"),
                                                color: Colors.black,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: TabBarView(
                          children: <Widget>[
                            _donationMainTab(context),
                            _donationSubTab(context),
                            _donationSubTab(context),
                            _donationSubTab(context),
                            _donationSubTab(context),
                            _donationSubTab(context),
                            _donationSubTab(context),
                          ]
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _donationMainTab(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 18.h, left: 15.w),
          child: const Text(
            "서포터님을 찾고 있는 기부처",
            style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
          ),
        ),
        SizedBox(
          height: 310.h,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection(
                  'donation_organization').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff053dc2),
                    ),
                  );
                }
                return CarouselSlider.builder(
                    enableAutoSlider: true,
                    autoSliderTransitionTime: const Duration(seconds: 1),
                    autoSliderDelay: const Duration(seconds: 5),
                    unlimitedMode: true,
                    slideBuilder: (index) {
                      return _donationMainBox(context,
                          snapshot.data!.docs[index]); // TODO: Create _box list
                    },
                    slideIndicator: CircularSlideIndicator(
                        padding: EdgeInsets.only(top: 313.h),
                        itemSpacing: 18,
                        indicatorRadius: 4,
                        currentIndicatorColor: const Color(0xff053dc2)
                    ),
                    itemCount: 4
                );
              }
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 23.h, left: 15.w),
          child: const Text(
            "서포터님이 좋아할만한 기부처",
            style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
          ),
        ),
        Column(
          children: [
            _donationSubBox(context),
            _donationSubBox(context),
            _donationSubBox(context),
          ],
        ),
      ],
    );
  }

  Widget _donationSubTab(BuildContext context) {
    return ListView(
        children: <Widget>[
          _donationSubBox(context),
          _donationSubBox(context),
          _donationSubBox(context),
          _donationSubBox(context),
          _donationSubBox(context),
          _donationSubBox(context),
          _donationSubBox(context),
          _donationSubBox(context),
        ]
    );
  }

  Widget _donationMainBox(BuildContext context,
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Padding(
      padding: EdgeInsets.only(top: 9.h, bottom: 12.h, left: 15.w, right: 15.w),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DonationInfo()),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: const Color(0x99f7fbfc),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xffcff1e0),
                offset: Offset(0.0, 0.3), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(19),
                    topRight: Radius.circular(19)),
                child: Image.asset(
                  "assets/xhdpi/banner_sample_img.png",
                  fit: BoxFit.cover,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 150.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.h, left: 13.w, right: 13.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc['name'],
                      style: TextStyle(
                          color: const Color(0xff262626),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp),
                    ),
                    SizedBox(height: 6.h,),
                    Row(
                      children: [
                        for(int i = 0; i < doc['hashtag'].length; i++)
                          (i < doc['hashtag'].length - 1) ?
                          Text("${doc['hashtag'][i]} | ",
                            style: TextStyle(
                                color: const Color(0xff797979),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.sp),
                          ) :
                          Text("${doc['hashtag'][i]}",
                            style: TextStyle(
                                color: const Color(0xff797979),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.sp),
                          )
                      ],
                    ),
                    SizedBox(height: 13.h,),
                    Image.asset(
                      "assets/xhdpi/icon_donationPurpose.png",
                      height: 15.h,
                    ),
                    SizedBox(height: 7.h,),
                    Text(
                      doc['Introduction'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: const Color(0xff676767),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.sp),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _donationSubBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 11.h, right: 15.w, bottom: 2.h),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DonationInfo()),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: const Color(0x99f7fbfc),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
        ),
        child: Container(
          height: 133.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.0),
            color: Colors.white,
            boxShadow: const [BoxShadow(
                color: Color(0xffe2eef0),
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0
            )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 12.w, top: 7.h, right: 12.w, bottom: 13.h),
            child: Column(
              children: [
                Flexible(
                    flex: 64,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Image.asset("assets/xhdpi/icon_sample.png",
                          height: 64.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("부산대학교 산학협력단",
                                style: TextStyle(
                                    color: const Color(0xff313131),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text("창업지원 | 청년지원 | 창업지원",
                                style: TextStyle(
                                    color: const Color(0xff797979),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.sp),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(height: 3.h,),
                Flexible(
                  flex: 50,
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(7)
                        ),
                        color: Color(0xfff7fbfc)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/xhdpi/icon_donationPurpose.png",
                            height: 15.h,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              '"자고 있는데 화재 경보음 소리에 깜짝 놀라 깨보니까, 눈앞에 불이 번쩍하더라고. 큰일 날 뻔했어"',
                              softWrap: true,
                              style: TextStyle(
                                  color: const Color(0xff676767),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filterItem(int index) {
    Map<int, String> _filterList = {
      0: '교육',
      1: '의료',
      2: '문화예술',
      3: '장학',
      4: '생계 및 기초생활',
      5: '인식',
      6: '글로벌',
      7: '주거',
      8: '보호',
    };

    return Padding(
      padding: EdgeInsets.only(right: 6.w),
      child: Container(
        height: 23.h,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(12)
            ),
            border: Border.all(
                color: const Color(0xffafafaf),
                width: 1
            )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Text(
              _filterList[index]!,
              style: TextStyle(
                  color: const Color(0xff5c5c5c),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 11.sp
              ),
            ),
          ),
        ),
      ),
    );
  }
}
