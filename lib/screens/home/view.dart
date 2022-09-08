import 'package:app_name/screens/home/pages/all_categories/view.dart';
import 'package:app_name/screens/home/pages/cart/view.dart';
import 'package:app_name/screens/home/pages/home/view.dart';
import 'package:app_name/screens/home/pages/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> icons = const ["home", "categories", "cart", "profile"];
  final List<Widget> pages = const [
    HomePage(),
    AllCategoriesScreen(fromHome: true),
    CartPage(),
    ProfilePage()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: icons.length,
      initialIndex: currentIndex,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(icons.length, (index) => pages[index]),
          ),
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: colorSecondary,
          onTap: (int index) {
            currentIndex = index;
            setState(() {});
          },
          tabs: List.generate(
            icons.length,
            (index) => Tab(
              height: 60.h,
              icon: SvgPicture.asset(
                "assets/icons/${icons[index]}.svg",
                color: currentIndex == index ? colorSecondary : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
