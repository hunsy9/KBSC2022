import 'package:flutter/material.dart';
import 'package:supportus_flutter_app/widget/app_bar.dart';
import 'donate_completion.dart';
import 'package:bootpay_api/bootpay_api.dart';
import 'package:bootpay_api/model/payload.dart';
import 'package:bootpay_api/model/extra.dart';
import 'package:bootpay_api/model/user.dart';
import 'package:bootpay_api/model/item.dart';

class DonatePaymentApi extends StatefulWidget {
  const DonatePaymentApi({Key? key}) : super(key: key);

  @override
  State<DonatePaymentApi> createState() => _DonatePaymentApiState();
}

class _DonatePaymentApiState extends State<DonatePaymentApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar('결제'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
                '결제 API'
            ),
            ElevatedButton(onPressed: () {
              goBootpayRequest(context);
            }, child: const Text('결제하러 GO'))
          ],
        ),
      ),
    );
  }
}

void goBootpayRequest(BuildContext context) async {
  Payload payload = Payload();
  payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
  payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

  payload.pg = 'nicepay';
  payload.method = 'card';
//  payload.methods = ['card', 'phone', 'vbank', 'bank'];
  payload.name = 'testUser';
  payload.price = 10000.0;
  payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();
//    payload.params = {
//      "callbackParam1" : "value12",
//      "callbackParam2" : "value34",
//      "callbackParam3" : "value56",
//      "callbackParam4" : "value78",
//    };

  User user = User();
  user.username = "사용자 이름";
  user.email = "user1234@gmail.com";
  user.area = "서울";
  user.phone = "010-1234-4567";

  Extra extra = Extra();
  extra.appScheme = 'bootpaySample';

  Item item1 = Item();
  item1.itemName = "기부금1"; // 주문정보에 담길 상품명
  item1.qty = 1; // 해당 상품의 주문 수량
  item1.unique = "ITEM_CODE_DONATE1"; // 해당 상품의 고유 키
  item1.price = 30000; // 상품의 가격

  Item item2 = Item();
  item2.itemName = "기부금2"; // 주문정보에 담길 상품명
  item2.qty = 1; // 해당 상품의 주문 수량
  item2.unique = "ITEM_CODE_DONATE2"; // 해당 상품의 고유 키
  item2.price = 20000; // 상품의 가격
  List<Item> itemList = [item1, item2];

  BootpayApi.request(
    context,
    payload,
    extra: extra,
    user: user,
    items: itemList,
    onDone: (String? json) {
      print('onDone: $json');
    },
    onReady: (String? json) {
      //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
      print('onReady: $json');
    },
    onCancel: (String? json) {
      print('onCancel: $json');
    },
    onError: (String? json) {
      print('onError: $json');
    },
  );
}