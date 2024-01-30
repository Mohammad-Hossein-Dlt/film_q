import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/widgrts/download_item.dart';
import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  Map<String, Map<String, dynamic>> favoritList = {
    "1": {
      "image": "spider_man_image2.png",
      "name": "Spider-Man No Way Home",
      "genre": "اکشن",
      "score": "4.5",
      "onDownloading": true,
    },
    "2": {
      "image": "spider_man_image2.png",
      "name": "Spider-Man No Way Home",
      "genre": "اکشن",
      "score": "4.5",
      "onDownloading": false,
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
                "دانلود ها",
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
                      Navigator.of(context).pop();
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
                                  child: DownloadItem(
                                    name: favoritList[e]!["name"] ?? "",
                                    genre: favoritList[e]!["genre"] ?? "",
                                    image: favoritList[e]!["image"] ?? "",
                                    onDownloading:
                                        favoritList[e]!["onDownloading"] ??
                                            true,
                                    onTapBtn: () {
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
                            Image.asset("assets/images/empty_folder.png"),
                            SizedBox(height: 10),
                            const Text(
                              "خالی",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            const Text(
                              "تاحالا هیچ فیلم و یا سریال دانلود نکردید. برای دانلود میتونید از صفحه اصلی فیلمی رو انتخاب و دانلود کنید.",
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
