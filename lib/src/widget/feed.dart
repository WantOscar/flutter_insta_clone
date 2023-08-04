import 'dart:js';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Feed extends StatefulWidget {
  final String userName;
  final List<String> urls;
  const Feed({super.key, required this.userName, required this.urls});

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
        // _comment(),
        // _description(),
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
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU',
                type: AvatarType.BASIC,
              ),
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
      ),
    );
  }

  Widget _options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                path: ImagePath.activeOff,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                path: ImagePath.replyIcon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                path: ImagePath.directMessage,
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
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageData(path: ImagePath.bookMarkOffIcon),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
