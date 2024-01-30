import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/trailers_list_screen.dart';
import 'package:flutter/material.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  List<Map<String, String>> genresList() => [
        {
          "name": "اکشن",
          "image": "action.png",
        },
        {
          "name": "ترسناک",
          "image": "honor.png",
        },
        {
          "name": "فانتزی",
          "image": "fantasy.png",
        },
        {
          "name": "انیمه",
          "image": "",
        },
        {
          "name": "داستان عاشقانه",
          "image": "",
        },
        {
          "name": " علمی",
          "image": "science_fiction.png",
        },
        {
          "name": "کمدی",
          "image": "comedy.png",
        },
        {
          "name": "خانوادگی",
          "image": "",
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
                "ژانر ها",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TrailersListScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 60,
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: secondaryBlack,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: tertiaryBlack,
                                ),
                                child: const Icon(
                                  Iconsax.arrow_left_2,
                                  color: blue,
                                  size: 20,
                                ),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.movie_creation_rounded,
                                    color: blue,
                                    size: 20,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "بزودی میاد",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        // crossAxisAlignment: WrapCrossAlignment.end,
                        // runAlignment: WrapAlignment.end,

                        spacing: 10,
                        runSpacing: 20,
                        children: [
                          ...genresList().map(
                            (e) => Material(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              elevation: 4,
                              shadowColor: secondaryBlack,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/images/${e['image']}",
                                      width: 155,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => Container(
                                        width: 155,
                                        height: 80,
                                        color: secondaryBlack,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            primaryBlack.withOpacity(0.8),
                                            primaryBlack.withOpacity(0.8),
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    e["name"] ?? "",
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
