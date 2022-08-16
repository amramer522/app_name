import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/styles.dart';
import '../../shared/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: 'Search',),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: Column(
          children: const [
            SearchBar(
              isEnabled: true,
            )
          ],
        ),
      ),
    );
  }
}
