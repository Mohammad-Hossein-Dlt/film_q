import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/widgrts/persian_number.dart';
import 'package:film_q/widgrts/summary_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TrailerScreen extends StatefulWidget {
  TrailerScreen({
    super.key,
    required this.name,
    required this.genre,
    required this.image,
    required this.date,
    required this.descriptionText,
    required this.casts,
  });

  final String name;
  final String genre;
  final String image;
  final String date;
  String descriptionText;
  List casts;
  @override
  State<TrailerScreen> createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  String videoTime = "1:05/2:23";

  @override
  Widget build(BuildContext context) {
    widget.descriptionText =
        "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.";
    widget.casts = [
      {
        "name": "Matt Reeves",
        "image": "avatar_3.png",
        "role": "Writers",
      },
      {
        "name": "Matt Reeves",
        "image": "avatar_3.png",
        "role": "Directors",
      },
      {
        "name": "Matt Reeves",
        "image": "avatar_3.png",
        "role": "Writers",
      },
      {
        "name": "Matt Reeves",
        "image": "avatar_3.png",
        "role": "Directors",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 2,
              shadowColor: primaryBlack,
              leading: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: secondaryBlack,
                  padding: EdgeInsets.zero,
                  maximumSize: const Size(34, 34),
                  minimumSize: const Size(34, 34),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Iconsax.heart5,
                  color: red,
                  size: 24,
                ),
              ),
              centerTitle: true,
              title: const Text(
                "اطلاعات و تریلر",
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10),
                    player(),
                    const SizedBox(height: 10),
                    info(),
                    const SizedBox(height: 40),
                    description(),
                    const SizedBox(height: 40),
                    casts(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget player() => Center(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  "assets/images/${widget.image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: secondaryBlack.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          fixedSize: const Size(30, 30),
                          maximumSize: const Size(30, 30),
                          minimumSize: const Size(30, 30),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.pause_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: true,
                        lineHeight: 4,
                        // fillColor: light200,
                        progressColor: lightGray,
                        backgroundColor: darkGray,
                        isRTL: false,
                        percent: 0.4,
                        trailing: null,
                        leading: null,
                        center: null,
                        widgetIndicator: null,
                        barRadius: const Radius.circular(4),
                      ),
                    ),
                    Text(
                      videoTime,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          fixedSize: const Size(30, 30),
                          maximumSize: const Size(30, 30),
                          minimumSize: const Size(30, 30),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_up_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          fixedSize: const Size(30, 30),
                          maximumSize: const Size(30, 30),
                          minimumSize: const Size(30, 30),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.closed_caption_off_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          fixedSize: const Size(30, 30),
                          maximumSize: const Size(30, 30),
                          minimumSize: const Size(30, 30),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          fixedSize: const Size(30, 30),
                          maximumSize: const Size(30, 30),
                          minimumSize: const Size(30, 30),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.fullscreen,
                          color: Colors.white,
                          size: 20,
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

  Widget info() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.name,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PersianNumber(
                    number: widget.date,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: lightGray,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Iconsax.note_text5,
                    color: lightGray,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
                child: VerticalDivider(color: lightGray),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.movie,
                    color: lightGray,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  Widget description() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "خلاصه",
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SummaryText(text: widget.descriptionText, summaryMaxLine: 4),
        ],
      );

  Widget casts() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "عوامل",
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 10,
                runSpacing: 20,
                children: [
                  ...widget.casts.map(
                    (e) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['name'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                e['role'],
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: lightGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/${e['image']}",
                            width: 40, height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
