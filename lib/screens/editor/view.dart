import 'dart:io';
import 'dart:math';

import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/gen/assets.gen.dart';
import 'package:app_name/screens/editor/widgets/item_editor_category.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/choose_image_source_dialog.dart';
import '../../shared/save_collage_dialog.dart';
import '../../shared/toast.dart';
import '../../shared/view_all.dart';
import '../collages/view.dart';
import 'widgets/item_editor_actions.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({Key? key}) : super(key: key);

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  List<Map> selectedImages = [];
  int currentImage = -1;

  void chooseImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const ChooseImageSourceDialog(),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(25.w), topEnd: Radius.circular(25.w)),
        )).then((value) {
      if (value != null) {
        selectedImages.add({
          "image": value as File,
          "isFliped": false,
          "height": 80.h,
          "width": 80.w,
          "top": 100.h,
          "left": 50.w
        });
        currentImage = selectedImages.length - 1;
        setState(() {});
      }
    });
  }

  void send({forward = true}) {
    if (selectedImages.isEmpty) {
      Toast.show("import images first", context);
    } else if (forward && currentImage == selectedImages.length - 1) {
      Toast.show("Already in Top", context);
    } else if (!forward && currentImage == 0) {
      Toast.show("Already in Bottom", context);
    } else {
      final temp = selectedImages[currentImage];
      selectedImages.removeAt(currentImage);
      selectedImages.insert(
          forward ? currentImage + 1 : currentImage - 1, temp);
      forward ? currentImage++ : currentImage--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(
        actions: [
          IconButton(
            onPressed: () {
              chooseImage(context);
            },
            icon: Icon(
              Icons.camera_alt,
              size: 27.h,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
              onTap: () {
                // chooseImage(context);
                saveCollageDialog(context);
              },
              child: SvgPicture.asset(Assets.icons.download))
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   color: Colors.white,
                //   child: Row(
                //     children: [
                //       // const Spacer(),
                //       IconButton(
                //           onPressed: () {
                //             if (selectedImages.isEmpty) {
                //               Toast.show("Nothing to remove", context);
                //             } else {
                //               selectedImages.removeAt(currentImage);
                //               currentImage--;
                //             }
                //             setState(() {});
                //           },
                //           icon: const Icon(
                //             Icons.delete_forever,
                //             color: Colors.red,
                //           )),
                //       Expanded(
                //         child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //                 fixedSize: Size.fromWidth(80.w)),
                //             onPressed: () {
                //               send();
                //               setState(() {});
                //             },
                //             child: Text("Forward")),
                //       ),
                //       SizedBox(
                //         width: 10.w,
                //       ),
                //       Expanded(
                //         child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //                 fixedSize: Size.fromWidth(80.w)),
                //             onPressed: () {
                //               send(forward: false);
                //               setState(() {});
                //             },
                //             child: Text("Back")),
                //       ),
                //       SizedBox(
                //         width: 10.w,
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  height: 380.h,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Stack(
                    children: selectedImages.isNotEmpty
                        ? List.generate(
                            selectedImages.length,
                            (index) => Positioned(
                                  top: double.parse(
                                      selectedImages[index]["top"].toString()),
                                  left: double.parse(
                                      selectedImages[index]["left"].toString()),
                                  child: GestureDetector(
                                    onTap: () {
                                      currentImage = index;
                                      setState(() {});
                                    },
                                    onPanUpdate: (details) {
                                      print(context.size!.width);
                                      print(selectedImages[currentImage]["left"]
                                          .toString());

                                      selectedImages[currentImage].update(
                                          "top",
                                          (value) => max(
                                              0,
                                              double.parse(
                                                      selectedImages[currentImage]
                                                              ["top"]
                                                          .toString()) +
                                                  details.delta.dy));
                                      selectedImages[currentImage].update(
                                          "left",
                                          (value) => max(
                                              0,
                                              double.parse(
                                                      selectedImages[currentImage]
                                                              ["left"]
                                                          .toString()) +
                                                  details.delta.dx));
                                      setState(() {});
                                    },
                                    child: Image.file(
                                      selectedImages[index]["image"],
                                      fit: BoxFit.contain,
                                      height: selectedImages[index]["height"],
                                      width: selectedImages[index]["width"],
                                    ),
                                  ),
                                ))
                        : [
                            Center(
                              child: Text(
                                  "Add products to\ncreate your first collage",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: FontFamily.extraBold,
                                      color: Colors.white)),
                            )
                          ],
                  ),
                ),
                selectedImages.isNotEmpty
                    ? Container(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ItemEditorActions(
                                title: "Remove",
                                imageName: "delete",
                                onPress: () {
                                  if (selectedImages.isEmpty) {
                                    Toast.show("Nothing to remove", context);
                                  } else {
                                    selectedImages.removeAt(currentImage);
                                    currentImage--;
                                  }
                                  setState(() {});
                                }),
                            ItemEditorActions(
                                title: "Flip", imageName: "flip", onPress: () {}),
                            ItemEditorActions(
                                title: "Backward",
                                imageName: "backward_image",
                                onPress: () {
                                  send(forward: false);
                                  setState(() {});
                                }),
                            ItemEditorActions(
                                title: "Forward",
                                imageName: "forward_image",
                                onPress: () {
                                  send();
                                  setState(() {});
                                }),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                Column(
                  children: [
                    Padding(
                      padding: mainPagePadding,
                      child: ViewAll(
                          label: "Categories",
                          isBold: true,
                          page: CollagesScreen(
                            title: "Top Collages",
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 145.h,
                      padding: EdgeInsetsDirectional.only(
                          bottom: 2.h, start: 20.w, end: 10.w),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ItemEditorCategory(),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        itemCount: 10,
                      ),
                    ),

                    // Container(
                    //   height: 100.h,
                    //   padding: EdgeInsetsDirectional.only(bottom: 2.h),
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) => GestureDetector(
                    //       onTap: () {
                    //         currentImage = index;
                    //         setState(() {});
                    //       },
                    //       child: Container(
                    //         margin: EdgeInsetsDirectional.only(
                    //             start: index == 0 ? 3.w : 5.w),
                    //         clipBehavior: Clip.antiAlias,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10.r),
                    //             border: currentImage == index
                    //                 ? Border.all(color: Colors.red, width: 2.w)
                    //                 : null),
                    //         child: Image.file(
                    //           selectedImages[index]["image"],
                    //           height: 100.h,
                    //           // width: 50.w,
                    //           fit: BoxFit.fill,
                    //         ),
                    //       ),
                    //     ),
                    //     itemCount: selectedImages.length,
                    //   ),
                    // )
                  ],
                ),
                const Divider(),
                SizedBox(
                  height: 15.h,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.icons.cart,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: colorSecondary, fixedSize: Size(350.w, 50.h)),
                    label: Text("Add to Cart"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
