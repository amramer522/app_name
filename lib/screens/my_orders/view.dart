import '/../core/helper_methods.dart';
import '/../core/styles/styles.dart';
import '/../screens/home/view.dart';
import 'package:flutter/material.dart';

import '../../fake_data/fake_data.dart';
import '../../shared/items/item_my_order.dart';
import '../../shared/second_app_bar.dart';

class MyOrdersScreen extends StatelessWidget {
  final bool isFormOrderSuccess;
  const MyOrdersScreen({Key? key,  this.isFormOrderSuccess=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(isFormOrderSuccess)
          {
            navigateTo(page: HomeScreen());
          }
        return true;
      },
      child: Scaffold(
        appBar: const SecondAppBar(title: "My Orders",),
        body: SizedBox(
          width: double.infinity,
          child: ListView.builder(
            padding: mainPagePadding,
              itemBuilder: (context, index) => ItemMyOrder(index: index),
              itemCount: fakeMyOrders.length),
        ),
      ),
    );
  }
}
