import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:flutter_instagram/view/home.dart';
import 'package:flutter_instagram/view/mypage.dart';
import 'package:flutter_instagram/view/search.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNAvController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: controller.popAction,
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _bottom(),
        ),
      ),
    );
  }

  Widget _bottom() {
    return BottomNavigationBar(
      currentIndex: controller.index,
      onTap: controller.changeIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.homeOff),
            activeIcon: ImageData(path: ImagePath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.searchOff),
            activeIcon: ImageData(path: ImagePath.searchOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.upload),
            activeIcon: ImageData(path: ImagePath.upload),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.reelsOff),
            activeIcon: ImageData(path: ImagePath.reelsOn),
            label: 'home'),
        const BottomNavigationBarItem(
            icon: ImageAvatar(
                url:
                    'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
                type: AvatarType.OFF),
            activeIcon: ImageAvatar(
              url:
                  'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
              type: AvatarType.ON,
            ),
            label: 'home'),
      ],
    );
  }

  Widget _body() {
    return IndexedStack(
      index: controller.index,
      children: [
        const Home(),
        const Search(),
        Container(color: Colors.red),
        Container(color: Colors.blue),
        const MyPage(),
      ],
    );
  }
}
