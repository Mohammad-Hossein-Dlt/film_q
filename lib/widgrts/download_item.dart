import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DownloadItem extends StatelessWidget {
  const DownloadItem({
    super.key,
    required this.name,
    required this.genre,
    required this.image,
    required this.onDownloading,
    required this.onTapBtn,
  });

  final String name;
  final String genre;
  final String image;
  final bool onDownloading;
  final Function onTapBtn;

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
              Visibility(
                visible: onDownloading,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned.fill(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: CircularPercentIndicator(
                          reverse: true,
                          animation: true,
                          // fillColor: light200,
                          progressColor: white,
                          backgroundColor: darkGray,
                          lineWidth: 2,
                          percent: 0.6,
                          center: null,
                          widgetIndicator: null,
                          radius: 10,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.pause,
                      color: white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 6),
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
                      onDownloading
                          ? const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.download,
                                    color: lightGray,
                                    size: 16,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "1.25 of 1.78 GB",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: lightGray,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24,
                                    child: VerticalDivider(),
                                  ),
                                  Text(
                                    "75%",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: lightGray,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "فیلم",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: lightGray,
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                  child: VerticalDivider(),
                                ),
                                Text(
                                  "1.78 GB",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: lightGray,
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
                        iconSize: 20,
                      ),
                      onPressed: () {
                        onTapBtn();
                      },
                      icon: const Icon(
                        Iconsax.trash,
                        color: red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
