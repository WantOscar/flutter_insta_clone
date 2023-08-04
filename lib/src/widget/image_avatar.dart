import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:get/get.dart';

enum AvatarType { ON, OFF, STORY, MYSTORY, BASIC }

class ImageAvatar extends StatelessWidget {
  final double width;
  final String url;
  final AvatarType type;
  const ImageAvatar(
      {super.key, required this.url, required this.type, this.width = 35});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.ON:
        return _onAvatar();
      case AvatarType.OFF:
        return _offAvatar();
      case AvatarType.STORY:
        return _storyImage();
      case AvatarType.MYSTORY:
        return _myStoryImage();
      case AvatarType.BASIC:
        return _basic();
    }
  }

  Widget _onAvatar() {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(1.0),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: _basic(),
      ),
    );
  }

  Widget _offAvatar() {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: _basic(),
    );
  }

  Widget _basic() {
    return SizedBox(
      width: 70 / Get.mediaQuery.devicePixelRatio,
      height: 70 / Get.mediaQuery.devicePixelRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(65.0),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _storyImage() {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xffe0c214), Color(0xffe01488)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(1.0),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: _basic(),
      ),
    );
  }

  Widget _myStoryImage() {
    return Stack(
      children: [
        _basic(),
        Positioned(
          bottom: 0.1,
          right: 0.1,
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: ImageData(path: ImagePath.plusIcon),
          ),
        ),
      ],
    );
  }
}
