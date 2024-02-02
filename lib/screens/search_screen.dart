import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/widgets/full_details_movie_item.dart';
import 'package:film_q/widgets/simple_movie_item.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.showPreSearched,
  });
  final bool showPreSearched;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();

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

  String selectedCategory = "";

  @override
  void initState() {
    search.text = widget.showPreSearched ? "اسپایدرمن" : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: lightGray,
                      ),
                      onPressed: () {
                        setState(() {
                          search.clear();
                        });
                      },
                      child: const Text("پاک کردن"),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: secondaryBlack,
                        ),
                        child: TextField(
                          controller: search,
                          textDirection: TextDirection.rtl,
                          textAlignVertical: TextAlignVertical.center,
                          autofocus: false,
                          maxLines: 1,
                          minLines: 1,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: yellow, width: 1.4)),
                            enabledBorder: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 15),
                            hintText: "جستجو کن...",
                            hintStyle: TextStyle(
                                color: lightGray,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                            prefixIcon: Icon(
                              Iconsax.search_normal,
                              color: lightGray,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: search,
              builder: (_, value, ___) => value.text.isNotEmpty
                  ? value.text == "اسپایدرمن"
                      ? SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      alignment: WrapAlignment.end,
                                      // crossAxisAlignment: WrapCrossAlignment.end,
                                      // runAlignment: WrapAlignment.end,
                                      spacing: 20,
                                      runSpacing: 20,
                                      children: [
                                        Image.asset(
                                            "assets/images/avatar_1.png"),
                                        Image.asset(
                                            "assets/images/avatar_2.png"),
                                      ],
                                    ),
                                  ),
                                ),
                                const FullDetailsMovieItem(
                                  image: "spider_man.png",
                                  name: "اسپایدر من : بازگشت به ....",
                                  genre: "اکشن",
                                  score: "4.5",
                                  date: "2021",
                                  time: "148 دقیقه",
                                  ageGrade: "PG-13",
                                  isCensored: false,
                                ),
                              ],
                            ),
                          ),
                        )
                      : SliverFillRemaining(
                          child: topicNotExist(),
                        )
                  : SliverToBoxAdapter(
                      child: preview(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget preview() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: secondaryBlack,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "فیلم ویژه امروز",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  FullDetailsMovieItem(
                    image: "spider_man.png",
                    name: "اسپایدر من : بازگشت به ....",
                    genre: "اکشن",
                    score: "4.5",
                    date: "2021",
                    time: "148 دقیقه",
                    ageGrade: "PG-13",
                    isCensored: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
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
                    "پیشنهادی روز",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
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
                    date: "2021",
                    time: "148 دقیقه",
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
                    date: "2021",
                    time: "148 دقیقه",
                    ageGrade: "PG-13",
                    isCensored: true,
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget topicNotExist() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/search.png"),
          const Text(
            "چیزی پیدا نکردیم",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Text(
            "متاسفانه چیزی که جست و جو کردی توی برنامه ما وجود نداره لطفا دقت کنید که اسم درست رو نوشته باشید.",
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
    );
  }
}
