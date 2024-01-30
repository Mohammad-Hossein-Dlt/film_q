import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/widgrts/trailer_item.dart';
import 'package:flutter/material.dart';

class TrailersListScreen extends StatefulWidget {
  const TrailersListScreen({super.key});

  @override
  State<TrailersListScreen> createState() => _TrailersListScreenState();
}

class _TrailersListScreenState extends State<TrailersListScreen> {
  List<Map<String, String>> trailers() => [
        {
          "name": "بتمن",
          "image": "bat_man.png",
          "genre": "اکشن",
          "date": "تاریخ انتشار : 26 شهریور 1402 ",
        },
        {
          "name": "پلنگ سیاه",
          "image": "black_panther.png",
          "genre": "اکشن",
          "date": "تاریخ انتشار : 14 مهر 1402 ",
        },
      ];

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
                "بزودی میاد",
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
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    ...trailers().map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TrailerItem(
                          image: e["image"] ?? "",
                          name: e["name"] ?? "",
                          genre: e["genre"] ?? "",
                          date: e["date"] ?? "",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
