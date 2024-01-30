import 'dart:ui';

import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/movie_screen.dart';
import 'package:flutter/material.dart';

class FullDetailsMovieItem extends StatelessWidget {
  const FullDetailsMovieItem({
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
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieScreen(
              image: image,
              name: name,
              genre: genre,
              score: score,
              date: date,
              time: time,
              ageGrade: ageGrade,
              isCensored: isCensored,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 178,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        isCensored ? "سانسور شده" : "سانسور نشده!",
                        textDirection: TextDirection.rtl,
                        style:
                            const TextStyle(color: primaryBlack, fontSize: 10),
                      ),
                    ),
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: lightGray,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Iconsax.note_text5,
                          color: darkGray,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          date,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: darkGray,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Iconsax.clock5,
                              color: darkGray,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              time,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: darkGray,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: blue),
                          ),
                          child: Text(
                            ageGrade,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.movie,
                          color: darkGray,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          genre,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: lightGray,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                          child: VerticalDivider(),
                        ),
                        const Text(
                          "فیلم",
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      "assets/images/$image",
                      width: 136,
                      height: 178,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 136,
                        height: 178,
                        color: secondaryBlack,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        width: 55,
                        height: 24,
                        decoration: BoxDecoration(
                          color: secondaryBlack.withOpacity(0.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: yellow,
                              size: 16,
                            ),
                            Text(
                              score,
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
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
