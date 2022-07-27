import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../shared/second_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: "My Profile"),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: Center(child: Text("My Profile"),),
      ),
    );
  }
}
