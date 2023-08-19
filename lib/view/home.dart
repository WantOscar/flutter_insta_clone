import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/feed.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            _story(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      title: ImageData(
        path: ImagePath.logo,
        width: 350,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ImageData(path: ImagePath.activeOff),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ImageData(path: ImagePath.directMessage),
        ),
      ],
    );
  }

  Widget _story() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ImageAvatar(
                    width: 80,
                    url:
                        'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
                    type: AvatarType.MYSTORY),
              ),
              Text('내 스토리'),
            ],
          ),
          ...List.generate(
            20,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const ImageAvatar(
                      width: 80,
                      url:
                          'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
                      type: AvatarType.STORY),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$index user'),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _body() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: 50,
          (context, index) => Feed(
                userName: 'dongwook',
                urls: const [
                  'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg'
                ],
                countLikes: Random().nextInt(50),
                countComment: Random().nextInt(50),
              )),
    );

    // return SliverList.builder(
    //     itemCount: 50,
    //     itemBuilder: (_, index) => const Feed(
    //           userName: 'kko.minjeong',
    //           urls: [
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU'
    //           ],
    //         ));
  }
}
