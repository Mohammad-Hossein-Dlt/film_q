import 'dart:ui';

import 'package:film_q/constants/colors.dart';
import 'package:film_q/screens/movie_screen.dart';
import 'package:flutter/material.dart';

class SimpleMovieItem extends StatelessWidget {
  const SimpleMovieItem({
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
      child: Stack(
        children: [
          Container(
            width: 136,
            height: 230,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: secondaryBlack,
            ),
            child: Column(
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
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: lightGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      genre,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: lightGray,
                      ),
                    ),
                  ),
                ),
              ],
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
      ),
    );
  }
}
