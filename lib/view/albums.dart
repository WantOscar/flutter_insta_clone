import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/upload_controller.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:flutter_instagram/src/widget/upload_image.dart';
import 'package:get/get.dart';

class Albums extends GetView<UploadController> {
  const Albums({super.key});

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
        title: const Text('사진첩 선택'),
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
        () => ListView.builder(
            itemCount: controller.albums.length,
            itemBuilder: (context, index) {
              final album = controller.albums[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    controller.changeIndex(index);
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width / 4,
                          height: Get.width / 4,
                          child: UploadImage(
                              entity: album.images![0], fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(album.name!),
                            Text(album.images!.length.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
