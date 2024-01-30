import 'dart:async';

import 'package:film_q/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'banner_item.dart';

class BannerList extends StatefulWidget {
  const BannerList({super.key, required this.banners});
  final List banners;
  @override
  State<BannerList> createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  int curentPage = 0;
  bool end = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (curentPage == widget.banners.length - 1) {
        end = true;
      } else if (curentPage == 0) {
        end = false;
      }

      if (end == false) {
        curentPage++;
      } else {
        curentPage = 0;
      }

      controller.animateToPage(curentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView(
            controller: controller,
            reverse: true,
            children: widget.banners
                .map(
                  (e) => BannerItem(
                    image: e["image"] ?? "",
                    name: e["name"] ?? "",
                    date: e["date"] ?? "",
                  ),
                )
                .toList(),
            onPageChanged: (value) {
              curentPage = value;
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: controller,
          count: widget.banners.length,
          textDirection: TextDirection.rtl,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: yellow.withOpacity(0.4),
            activeDotColor: yellow,
          ),
        ),
      ],
    );
  }
}
