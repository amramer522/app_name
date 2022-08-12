import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/items/item_section.dart';
import '../../../../collages/view.dart';
import '../../../../editor/view.dart';

class SectionsList extends StatelessWidget {
  const SectionsList({Key? key}) : super(key: key);

  final List<String> images = const ["editor", "collages", "offers"];
  final List<String> titles = const ["Editor", "Collages", "Offers"];
  final List<Widget> pages = const [EditorScreen(),CollagesScreen(title: 'Collages',), CollagesScreen(title: 'dasd',)];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
              images.length,
              (index) => ItemSection(index: index,title: titles[index], page: pages[index],image: images[index])),
        ),
      ),
    );
  }
}
