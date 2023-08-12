import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/upload_controller.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:flutter_instagram/src/widget/upload_image.dart';
import 'package:get/get.dart';

class Upload extends GetView<UploadController> {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: GestureDetector(
            onTap: Get.back,
            child: ImageData(path: ImagePath.closeImage),
          ),
        ),
        title: const Text('새 게시물'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: ImagePath.nextImage),
          )
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            _preview(),
            _header(),
            _images(),
          ],
        ),
      ),
    );
  }

  Widget _preview() {
    return (controller.selectImage == null)
        ? Container(
            width: Get.width,
            height: Get.width,
            color: Colors.black,
          )
        : SizedBox(
            width: Get.width,
            height: Get.height,
            child: UploadImage(
              entity: controller.selectImage!,
              fit: BoxFit.contain,
            ),
          );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              (controller.albums.isEmpty)
                  ? Container()
                  : GestureDetector(
                      onTap: controller.changeAlbum,
                      child: Text(
                        controller.albums[controller.index].name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
              ImageData(
                path: ImagePath.downArrow,
                width: 60,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff808080)),
                child: ImageData(path: ImagePath.imageSelectIcon, width: 60),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff808080)),
                child: ImageData(path: ImagePath.cameraIcon, width: 60),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _images() {
    return (controller.albums.isEmpty)
        ? Container()
        : Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0),
                itemCount: controller.albums[controller.index].images!.length,
                itemBuilder: (context, index) {
                  final image =
                      controller.albums[controller.index].images![index];
                  return GestureDetector(
                    onTap: () {
                      controller.select(image);
                    },
                    child: UploadImage(entity: image, fit: BoxFit.cover),
                  );
                }),
          );
  }
}
