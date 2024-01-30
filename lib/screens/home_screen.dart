import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/genres_screen.dart';
import 'package:film_q/screens/search_screen.dart';
import 'package:film_q/widgrts/banner_list.dart';
import 'package:film_q/widgrts/simple_movie_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> genres() => [
        {
          "name": "animation",
          "nameFa": "انیمیشن",
        },
        {
          "name": "fantasy",
          "nameFa": "فانتزی",
        },
        {
          "name": "crime",
          "nameFa": "جنایی",
        },
        {
          "name": "action",
          "nameFa": "اکشن",
        },
        {
          "name": "comedy",
          "nameFa": "کمدی",
        },
        {
          "name": "drama",
          "nameFa": "درام",
        },
        {
          "name": "family",
          "nameFa": "خانوادگی",
        },
      ];
  String selectedCategory = "action";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const SearchScreen(showPreSearched: true),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: double.infinity,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: secondaryBlack,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Iconsax.search_normal,
                          color: lightGray,
                          size: 24,
                        ),
                        Row(
                          children: [
                            const Text(
                              "جستجو کن",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: lightGray,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: VerticalDivider(),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const GenresScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Iconsax.setting_4,
                                color: lightGray,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const BannerList(banners: [
                {
                  "image": "black_panther.png",
                  "name": "پلنگ سیاه : واکاندا برای همیشه",
                  "date": "2 آبان 1401",
                },
                {
                  "image": "black_panther.png",
                  "name": "پلنگ سیاه : واکاندا برای همیشه",
                  "date": "2 آبان 1401",
                },
              ]),
              const SizedBox(height: 20),
              categories(),
              const SizedBox(height: 20),
              horizontalList(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget horizontalList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "دیدن بیشتر",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: yellow,
                  ),
                ),
              ),
              const Text(
                "برتر اکشن",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: [
              SizedBox(width: 10),
              SimpleMovieItem(
                image: "spider_man.png",
                name: "Spider-Man No..",
                genre: "اکشن",
                score: "4.5",
                date: "2021",
                time: "148 دقیقه",
                ageGrade: "PG-13",
                isCensored: false,
              ),
              SizedBox(width: 10),
              SimpleMovieItem(
                image: "rivale.png",
                name: "Rivale",
                genre: "اکشن",
                score: "3.8",
                date: "2022",
                time: "78 دقیقه",
                ageGrade: "PG-13",
                isCensored: true,
              ),
              SizedBox(width: 10),
              SimpleMovieItem(
                image: "spider_man.png",
                name: "Spider-Man No..",
                genre: "اکشن",
                score: "4.5",
                date: "2021",
                time: "148 دقیقه",
                ageGrade: "PG-13",
                isCensored: false,
              ),
              SizedBox(width: 10),
              SimpleMovieItem(
                image: "rivale.png",
                name: "Rivale",
                genre: "اکشن",
                score: "3.8",
                date: "2022",
                time: "78 دقیقه",
                ageGrade: "PG-13",
                isCensored: true,
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
          const Text(
            "دسته بندی ها",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: const BoxDecoration(
              color: secondaryBlack,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...genres().map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedCategory == e["name"]
                              ? yellow.withOpacity(0.4)
                              : Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor:
                              selectedCategory == e["name"] ? yellow : white,
                          padding: const EdgeInsets.all(6),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedCategory = e["name"] ?? "";
                          });
                        },
                        child: Text(
                          e["nameFa"] ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
