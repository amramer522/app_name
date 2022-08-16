import 'package:app_name/core/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../fake_data/fake_data.dart';
import '../../shared/items/item_my_order.dart';
import '../../shared/second_app_bar.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "My Orders"),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          padding: mainPagePadding,
            itemBuilder: (context, index) => ItemMyOrder(index: index),
            itemCount: fakeMyOrders.length),
      ),
    );
  }
}
