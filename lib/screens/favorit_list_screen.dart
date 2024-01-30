import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/widgrts/playlist_item.dart';
import 'package:flutter/material.dart';

class FavoritListScreen extends StatefulWidget {
  const FavoritListScreen({super.key});

  @override
  State<FavoritListScreen> createState() => _FavoritListScreenState();
}

class _FavoritListScreenState extends State<FavoritListScreen> {
  Map<String, Map<String, String>> favoritList = {
    "1": {
      "image": "spider_man_image2.png",
      "name": "Spider-Man No Way Home",
      "genre": "اکشن",
      "score": "4.5",
    },
    "2": {
      "image": "spider_man_image2.png",
      "name": "Spider-Man No Way Home",
      "genre": "اکشن",
      "score": "4.5",
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: const SizedBox(),
              centerTitle: true,
              title: const Text(
                "لیست علاقمندی",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryBlack,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      maximumSize: const Size(34, 34),
                      minimumSize: const Size(34, 34),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pop();
                    },
                    child: const Center(
                      child: Icon(
                        Iconsax.arrow_right_3,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            favoritList.isNotEmpty
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ...favoritList.keys.toList().map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: FavoritItem(
                                    name: favoritList[e]!["name"] ?? "",
                                    genre: favoritList[e]!["genre"] ?? "",
                                    image: favoritList[e]!["image"] ?? "",
                                    score: favoritList[e]!["score"] ?? "",
                                    onTapHeartBtn: () {
                                      setState(() {
                                        favoritList.remove(e);
                                      });
                                    },
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  )
                : SliverFillRemaining(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/empty_box.png"),
                            const SizedBox(height: 10),
                            const Text(
                              "لیست تماشا",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "شما هیچ فیلمی رو در لیست تماشای خودتون ندارید برای اضافه کردن وارد صفحه اصلی بشید و قلب کنار فیلم هایی که دوست دارید رو قرمز کنید.",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: lightGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
