import 'dart:ui';

import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/widgets/episode_item.dart';
import 'package:film_q/widgets/summary_text.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({
    super.key,
    required this.image,
    required this.name,
    required this.genre,
    required this.score,
    required this.date,
    required this.time,
    required this.ageGrade,
    required this.isCensored,
  });
  final String image;
  final String name;
  final String genre;
  final String score;
  final String date;
  final String time;
  final String ageGrade;
  final bool isCensored;
  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  String descriptionText =
      "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.";

  List seasons() => [
        "فصل 1",
        "فصل 2",
        "فصل 3",
        "فصل 4",
      ];

  String selectedSeason = "";
  bool summarize = true;

  bool showPlayList = false;

  @override
  void initState() {
    selectedSeason = seasons()[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.heart5,
                color: red,
                size: 24,
              ),
            ),
            centerTitle: true,
            title: Text(
              widget.name,
              textDirection: TextDirection.rtl,
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
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: header(),
            ),
            expandedHeight: 552,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  showPlayList ? episodes() : desciption(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget desciption() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "داستان فیلم",
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SummaryText(text: descriptionText, summaryMaxLine: 4),
      ],
    );
  }

  Widget episodes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "اپیزود ها",
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                content: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 340,
                    height: 250,
                    decoration: const BoxDecoration(
                      color: secondaryBlack,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tertiaryBlack,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              maximumSize: const Size(34, 34),
                              minimumSize: const Size(34, 34),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Center(
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...seasons().map(
                                      (e) => TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: selectedSeason == e
                                              ? yellow.withOpacity(0.4)
                                              : Colors.transparent,
                                        ),
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                          setState(() {
                                            selectedSeason = e;
                                          });
                                        },
                                        child: Text(e),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 10,
                              left: 20,
                              child: Icon(
                                Icons.keyboard_double_arrow_up_rounded,
                                color: white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: white,
                size: 24,
              ),
              const SizedBox(width: 6),
              Text(
                selectedSeason,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        EpisodeItem(
          name: "اپیزود 1",
          time: "1h30m",
          description: descriptionText,
          image: "eposed.png",
          isFree: false,
        ),
        const SizedBox(height: 20),
        EpisodeItem(
          name: "اپیزود 1",
          time: "1h30m",
          description: descriptionText,
          image: "eposed.png",
          isFree: true,
        ),
      ],
    );
  }

  Widget header() => SizedBox(
        height: 552,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/${widget.image}",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: double.infinity,
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
                      primaryBlack.withOpacity(0.9),
                      primaryBlack.withOpacity(0.8),
                      primaryBlack.withOpacity(0.8),
                      primaryBlack.withOpacity(0.8),
                      primaryBlack.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    "assets/images/${widget.image}",
                    width: 210,
                    height: 290,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 210,
                      height: 290,
                      color: secondaryBlack,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Iconsax.note_text5,
                          color: lightGray,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.date,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: lightGray,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                      child: VerticalDivider(color: lightGray),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Iconsax.clock5,
                          color: lightGray,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.time,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: lightGray,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                      child: VerticalDivider(color: lightGray),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.movie,
                          color: lightGray,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.genre,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: lightGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  // width: 55,
                  // height: 24,
                  decoration: const BoxDecoration(
                    color: secondaryBlack,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: yellow,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.score,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: secondaryBlack,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              contentPadding: EdgeInsets.zero,
                              content: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: 340,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    color: secondaryBlack,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: tertiaryBlack,
                                            elevation: 0,
                                            padding: EdgeInsets.zero,
                                            maximumSize: const Size(34, 34),
                                            minimumSize: const Size(34, 34),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12))),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Center(
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "اشتراک گذاری",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ...[
                                                "facebook.png",
                                                "instagram.png",
                                                "messenger.png",
                                                "telegram.png",
                                              ].map(
                                                (e) => IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                    "assets/images/$e",
                                                    errorBuilder:
                                                        (_, __, ___) =>
                                                            Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: primaryBlack,
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
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.share,
                          color: yellow,
                          size: 24,
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: secondaryBlack,
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.file_download_rounded,
                          color: yellow,
                          size: 24,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: white,
                              size: 20,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "پخش",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showPlayList = !showPlayList;
                          });
                        },
                        child: showPlayList
                            ? const Row(
                                children: [
                                  Icon(
                                    Iconsax.story,
                                    color: white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "داستان",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                "اپیزود ها",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      );
}
