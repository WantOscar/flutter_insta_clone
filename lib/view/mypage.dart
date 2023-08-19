import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:flutter_instagram/src/widget/mypage_button.dart';
import 'package:flutter_instagram/src/widget/mypage_info.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: _appBar(),
        body: RefreshIndicator(
          notificationPredicate: (notification) {
            if (notification is OverscrollNotification || Platform.isIOS) {
              return notification.depth == 2;
            }
            return notification.depth == 0;
          },
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      _info(),
                      _buttons(),
                    ],
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                _tabs(),
                _tabBarView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Row(
        children: [
          const Text(
            'ospi_k',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          ImageData(path: ImagePath.downArrow, width: 60),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: ImageData(path: ImagePath.upload),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: ImageData(path: ImagePath.menuIcon),
        ),
      ],
    );
  }

  Widget _info() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ImageAvatar(
              width: Get.size.width * 0.2 + 10,
              url:
                  'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
              type: AvatarType.MYSTORY),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyPageInfo(cnt: 35, label: '게시물'),
                MyPageInfo(cnt: 166, label: '팔로워'),
                MyPageInfo(cnt: 143, label: '팔로잉'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: MyPageButton(
                label: '프로필 편집',
                onTap: () {},
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: MyPageButton(
                label: '프로필 공유',
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xfff3f3f3),
                ),
                child: ImageData(path: ImagePath.addFriend, width: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      indicatorColor: Colors.black,
      tabs: [
        Tab(
          child: ImageData(path: ImagePath.gridViewOff),
        ),
        Tab(
          child: ImageData(path: ImagePath.myTagImageOff),
        ),
      ],
    );
  }

  Widget _tabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          _myFeeds(),
          _tagFeeds(),
        ],
      ),
    );
  }

  Widget _myFeeds() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 1.0, crossAxisSpacing: 1.0),
      itemCount: 50,
      itemBuilder: (context, index) => Container(
        color: Colors.blue,
      ),
    );
  }

  Widget _tagFeeds() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 1.0, crossAxisSpacing: 1.0),
      itemCount: 50,
      itemBuilder: (context, index) => Container(
        color: Colors.red,
      ),
    );
  }
}
