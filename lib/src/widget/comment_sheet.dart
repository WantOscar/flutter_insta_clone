import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';

class CommentSheet extends StatelessWidget {
  const CommentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _header(),
          _body(),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('댓글'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(path: ImagePath.directMessage),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) => ListTile(
                leading: const ImageAvatar(
                    url:
                        'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/pt/2023/05/22/202305221630774259_646b1a242bc47.jpg',
                    type: AvatarType.BASIC),
                title: Text(
                  '$index user',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('$index번 째 댓글입니다.'),
                trailing: ImageData(
                  path: ImagePath.activeOff,
                  width: 40,
                ),
              )),
    );
  }
}
