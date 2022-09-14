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
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../../core/helper_methods.dart';
import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/added_to_cart_dialog.dart';
import '../../shared/choose_image_source_dialog.dart';
import '../../shared/save_collage_dialog.dart';
import '../../shared/toast.dart';
import '../../shared/view_all.dart';
import '../home/pages/all_categories/view.dart';
import 'widgets/item_editor_actions.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({Key? key}) : super(key: key);

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  List<Map> selectedImages = [];
  int currentImage = -1;
  final screenShotController = ScreenshotController();
  final collageNameController = TextEditingController();

  // double initialScale = 1.0;
  // double scaleFactor = 1.0;

  Future<File> crop(file) async {
    ImageCropper cropper = ImageCropper();
    CroppedFile? croppedFile = await cropper.cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Edit Your Image',
            toolbarColor: colorPrimary,
            toolbarWidgetColor: colorSecondary,
            initAspectRatio: CropAspectRatioPreset.original,
            showCropGrid: true,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    return File(croppedFile!.path);
  }

  void chooseImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const ChooseImageSourceDialog(),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(25.w), topEnd: Radius.circular(25.w)),
        )).then((value) async {
      if (value != null) {
        File file = await crop(value as File);
        selectedImages.add({
          "image": file,
          "isFlipped": false,
          "height": 120.h,
          "initialScale": 1.0,
          "currentScale": 1.0,
          // "scaleFactor": 1.0,
          // "rotation": 1.0,
          "width": 120.w,
          "top": 100.h,
          "left": 50.w
        });
        currentImage = selectedImages.length - 1;
        setState(() {});
      }
    });
  }

  void onSave() async {
    bool isGranted = await Permission.storage.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.storage.request().isGranted;
    }
    if (isGranted) {
      currentImage = -1;
      setState(() {});
      String directory = Directory("/storage/emulated/0/Download").path;
      String fileName = collageNameController.text.trim() +
          DateTime.now().microsecondsSinceEpoch.toString().substring(0, 5) +
          ".png";
      screenShotController
          .captureAndSave(directory, fileName: fileName)
          .then((value) {
        // currentImage = -1;
        selectedImages.clear();

        print(value);
        showToast(
          context,
          msg: "Collage Saved Successfully",
        );

        setState(() {});
      });
      Navigator.pop(context);
    }
  }

  void send({forward = true}) {
    if (selectedImages.isEmpty) {
      showToast(
        context,
        msg: "import images first",
      );
    } else if (forward && currentImage == selectedImages.length - 1) {
      showToast(
        context,
        msg: "Already in Top",
      );
    } else if (!forward && currentImage == 0) {
      showToast(
        context,
        msg: "Already in Bottom",
      );
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
        color: Colors.black,
        actions: [
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
            onTap: () {
              chooseImage(context);
            },
            child: Container(
              height: 45.h,
              width: 45.h,
              decoration: BoxDecoration(
                  // color: Color(0xffE6E6E6),
                  ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 27.h,
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
            onTap: () {
              if (currentImage != -1) {
                saveCollageDialog(context,
                    controller: collageNameController, onSavePress: onSave);
              } else {
                showToast(context,
                    msg: "You need to add products to editor to save collage");
              }
            },
            child: Container(
                height: 45.h,
                width: 45.h,
                padding: EdgeInsetsDirectional.only(bottom: 8.h, top: 4.h),
                decoration: BoxDecoration(
                    // color: Color(0xffE6E6E6),
                    ),
                child: SvgPicture.asset(
                  Assets.icons.download,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Expanded(
                        child: Screenshot(
                          controller: screenShotController,
                          child: SizedBox(
                            height: 380.h,
                            child: InteractiveViewer(
                              scaleEnabled: selectedImages.isNotEmpty,
                              child: Stack(
                                children: selectedImages.isNotEmpty
                                    ? List.generate(
                                        selectedImages.length,
                                        (index) => Positioned(
                                              top: double.parse(
                                                  selectedImages[index]["top"]
                                                      .toString()),
                                              left: double.parse(
                                                  selectedImages[index]["left"]
                                                      .toString()),
                                              child: GestureDetector(
                                                // onScaleStart: ((details) {
                                                //   selectedImages[currentImage].update("initialScale", (value) => selectedImages[currentImage]["currentScale"]);
                                                // }),
                                                // onScaleUpdate: (details){
                                                //   double scaleFactor = selectedImages[currentImage]["initialScale"] * details.scale;
                                                //   selectedImages[currentImage].update("height", (value) =>selectedImages[currentImage]["height"]* scaleFactor);
                                                //   selectedImages[currentImage].update("width", (value) => selectedImages[currentImage]["width"]*scaleFactor);
                                                //   setState(() {
                                                //
                                                //   });
                                                // },
                                                onTap: () {
                                                  currentImage = index;
                                                  setState(() {});
                                                },
                                                onLongPress: () {
                                                  showDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      builder: (context) =>
                                                          Dialog(
                                                            child:
                                                                InteractiveViewer(
                                                              child: Transform(
                                                                transform: Matrix4.rotationY(
                                                                    selectedImages[index]
                                                                            [
                                                                            "isFlipped"]
                                                                        ? pi
                                                                        : 2 *
                                                                            pi),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    Image.file(
                                                                  selectedImages[
                                                                          index]
                                                                      ["image"],
                                                                ),
                                                              ),
                                                            ),
                                                          ));
                                                },
                                                onPanUpdate: (details) {
                                                  print(context.size!.width);
                                                  print(selectedImages[
                                                          currentImage]["left"]
                                                      .toString());

                                                  selectedImages[currentImage].update(
                                                      "top",
                                                      (value) => max(
                                                          0,
                                                          double.parse(selectedImages[
                                                                          currentImage]
                                                                      ["top"]
                                                                  .toString()) +
                                                              details
                                                                  .delta.dy));
                                                  selectedImages[currentImage].update(
                                                      "left",
                                                      (value) => max(
                                                          0,
                                                          double.parse(selectedImages[
                                                                          currentImage]
                                                                      ["left"]
                                                                  .toString()) +
                                                              details
                                                                  .delta.dx));
                                                  setState(() {});
                                                },
                                                child: Transform(
                                                  transform: Matrix4.rotationY(
                                                      selectedImages[index]
                                                              ["isFlipped"]
                                                          ? pi
                                                          : 2 * pi),
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: index ==
                                                                currentImage
                                                            ? Border.all(
                                                                color:
                                                                    Colors.red)
                                                            : null),
                                                    child: Image.file(
                                                      selectedImages[index]
                                                          ["image"],
                                                      // scale: double.parse(
                                                      //     selectedImages[currentImage]
                                                      //             ["scaleFactor"]
                                                      //         .toString()),
                                                      fit: BoxFit.contain,
                                                      height:
                                                          selectedImages[index]
                                                              ["height"],
                                                      width:
                                                          selectedImages[index]
                                                              ["width"],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))
                                    : [
                                        Center(
                                          child: Text(
                                              "Add products to\ncreate your first collage",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 22.sp,
                                                  fontFamily:
                                                      FontFamily.extraBold,
                                                  color: Colors.white)),
                                        )
                                      ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      selectedImages.isNotEmpty
                          ? Row(
                              children: [
                                ItemEditorActions(
                                    title: "Remove",
                                    imageName: "delete",
                                    onPress: () {
                                      if (selectedImages.isEmpty) {
                                        showToast(
                                          context,
                                          msg: "Nothing to remove",
                                        );
                                      } else {
                                        selectedImages.removeAt(currentImage);
                                        currentImage--;
                                      }
                                      setState(() {});
                                    }),
                                ItemEditorActions(
                                    title: "Flip",
                                    imageName: "flip",
                                    onPress: () {
                                      selectedImages[currentImage].update(
                                          "isFlipped",
                                          (value) =>
                                              !selectedImages[currentImage]
                                                  ["isFlipped"]);
                                      setState(() {});
                                    }),
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
                            )
                          : SizedBox(
                              height: 53.h,
                            ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: mainPagePadding,
                    child: const ViewAll(
                        label: "Categories", page: AllCategoriesScreen()),
                  ),
                  Container(
                    height: 180.h,
                    margin: EdgeInsets.only(bottom: 20.h),
                    padding: EdgeInsetsDirectional.only(
                        bottom: 2.h, start: 20.w, end: 10.w),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const ItemEditorCategory(),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: mainPagePadding.copyWith(bottom: 16.h),
        child: ElevatedButton.icon(
            onPressed: () {
              showAddToCartSheet(context);
            },
            icon: SvgPicture.asset(
              Assets.icons.cart,
              height: 27.h,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
                primary: colorSecondary, fixedSize: Size(350.w, 50.h)),
            label: Text(
              "Add to Cart",
              style: TextStyle(height: 2.7.h),
            )),
      ),
    );
  }
}
