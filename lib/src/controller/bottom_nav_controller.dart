import 'dart:io';

import 'package:flutter_instagram/src/binding/upload_binding.dart';
import 'package:flutter_instagram/view/upload.dart';
import 'package:get/get.dart';

enum Page { HOME, SEARCH, UPLOAD, REELS, MYPAGE }

class BottomNAvController extends GetxController {
  final RxInt _pageIndex = 0.obs;

  final List<int> _history = [0];

  int get index => _pageIndex.value;

  void changeIndex(int value) {
    var page = Page.values[value];
    switch (page) {
      case Page.HOME:
      case Page.SEARCH:
      case Page.REELS:
      case Page.MYPAGE:
        moveToPage(value);
        break;
      case Page.UPLOAD:
        moveToUpload();
        break;
    }
  }

  void moveToPage(int value) {
    if (_history.last != value && Platform.isAndroid) {
      _history.add(value);
      print(_history);
    }
    _pageIndex(value);
  }

  Future<bool> popAction() async {
    if (_history.length == 1) {
      return true;
    } else {
      _history.removeLast();
      _pageIndex(_history.last);
      return false;
    }
  }

  void moveToUpload() {
    Get.to(
      () => const Upload(),
      transition: Transition.leftToRight,
      popGesture: false,
      binding: UploadBinding(),
    );
  }
}
