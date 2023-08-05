import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/search_grid_view.dart';
import 'package:flutter_instagram/view/search_focus.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(),
          _body(),
        ],
      ),
    );
  }

  Widget _body() {
    return SearchGridView(
      child: CachedNetworkImage(
        imageUrl:
            'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/pt/2023/05/22/202305221630774259_646b1a242bc47.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      title: InkWell(
        onTap: () {
          Get.to(() => const SearchFocus(), transition: Transition.fadeIn);
        },
        onLongPress: () {
          Get.to(() => const SearchFocus(), transition: Transition.fadeIn);
        },
        highlightColor: Colors.black12,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xff7d7d7d),
                  size: 20,
                ),
              ),
              Text(
                '검색',
                style: TextStyle(fontSize: 18, color: Color(0xff7d7d7d)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
