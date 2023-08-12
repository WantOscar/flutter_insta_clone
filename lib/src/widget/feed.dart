import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/comment_sheet.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Feed extends StatefulWidget {
  final String userName;
  // final String userUrl;
  final List<String> urls;
  final int countLikes;
  final int countComment;
  const Feed({
    super.key,
    required this.userName,
    required this.urls,
    // required this.userUrl,
    required this.countLikes,
    required this.countComment,
  });

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        _images(),
        _options(),
        _comment(),
      ],
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ImageAvatar(
                  url:
                      'https://postfiles.pstatic.net/MjAyMTA2MDlfMjM0/MDAxNjIzMjIyMjU5Mjgz.cv3La0LhNLcFnPJ091a8jHz6K8-UoA8BIQrZRZcJ54sg.z4v7OPd07iQ7gD7gj1I_WUxRjVxilKiwwvjV1uvHzhcg.PNG.sglucia_/%EB%9E%84%EB%A1%9C%EC%8D%AC%EA%B8%8002.png?type=w773',
                  type: AvatarType.BASIC),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageData(
            path: ImagePath.postMoreIcon,
            width: 65,
          ),
        ),
      ],
    );
  }

  Widget _images() {
    return CarouselSlider.builder(
        itemCount: widget.urls.length,
        itemBuilder: (context, index, pageIndex) => SizedBox(
              width: Get.size.width,
              height: Get.size.width,
              child: CachedNetworkImage(
                imageUrl: widget.urls[index],
                fit: BoxFit.cover,
              ),
            ),
        options: CarouselOptions(
          aspectRatio: 1,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ));
  }

  Widget _options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: ImageData(path: ImagePath.activeOff),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: showCommentSheet,
                child: ImageData(path: ImagePath.replyIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: ImageData(path: ImagePath.directMessage),
              ),
            ),
          ],
        ),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: widget.urls.length,
          effect: const ScrollingDotsEffect(
            activeDotColor: Colors.blue,
            activeStrokeWidth: 1.0,
            dotWidth: 8.0,
            dotHeight: 8.0,
          ),
        ),
        Row(
          children: [
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageData(path: ImagePath.bookMarkOffIcon),
              ),
            ),
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageData(path: ImagePath.bookMarkOffIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(path: ImagePath.bookMarkOffIcon),
            ),
          ],
        ),
      ],
    );
  }

  Widget _comment() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '좋아요 ${widget.countLikes}개',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpandableText(
              '컨텐츠 입니다. \n컨텐츠 입니다. \n컨텐츠 입니다. \n컨텐츠 입니다. \n컨텐츠 입니다.',
              expandText: '더보기',
              linkColor: Colors.grey,
              prefixText: widget.userName,
              prefixStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                '댓글 ${widget.countComment}개 모두 보기',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ImageAvatar(
                  url:
                      'https://postfiles.pstatic.net/MjAyMTA2MDlfMjM0/MDAxNjIzMjIyMjU5Mjgz.cv3La0LhNLcFnPJ091a8jHz6K8-UoA8BIQrZRZcJ54sg.z4v7OPd07iQ7gD7gj1I_WUxRjVxilKiwwvjV1uvHzhcg.PNG.sglucia_/%EB%9E%84%EB%A1%9C%EC%8D%AC%EA%B8%8002.png?type=w773',
                  type: AvatarType.BASIC,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  '댓글 달기...',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showCommentSheet() => showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) => const CommentSheet());
}
