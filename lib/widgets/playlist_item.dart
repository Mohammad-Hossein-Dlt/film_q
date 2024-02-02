import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:flutter/material.dart';

class FavoritItem extends StatelessWidget {
  const FavoritItem({
    super.key,
    required this.name,
    required this.genre,
    required this.image,
    required this.score,
    required this.onTapHeartBtn,
  });

  final String name;
  final String genre;
  final String image;
  final String score;
  final Function onTapHeartBtn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 116,
      decoration: const BoxDecoration(
        color: secondaryBlack,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        genre,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      // SizedBox(height: 10)
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Icon(
                                  Icons.star_rate_rounded,
                                  color: yellow,
                                  size: 16,
                                ),
                              ),
                              const SizedBox(width: 4),
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
                          const SizedBox(width: 10),
                          const Text(
                            "فیلم",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        fixedSize: const Size(24, 24),
                        maximumSize: const Size(24, 24),
                        minimumSize: const Size(24, 24),
                        iconSize: 24,
                      ),
                      onPressed: () {
                        onTapHeartBtn();
                      },
                      icon: const Icon(
                        Iconsax.heart5,
                        color: red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  "assets/images/$image",
                  width: 120,
                  height: 84,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 120,
                    height: 84,
                    color: secondaryBlack,
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
