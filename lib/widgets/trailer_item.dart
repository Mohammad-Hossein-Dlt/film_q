import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/trailer_screen.dart';
import 'package:film_q/widgets/persian_number.dart';
import 'package:flutter/material.dart';

class TrailerItem extends StatelessWidget {
  const TrailerItem({
    super.key,
    required this.image,
    required this.name,
    required this.genre,
    required this.date,
  });

  final String name;
  final String image;
  final String genre;
  final String date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TrailerScreen(
              name: name,
              genre: genre,
              image: image,
              date: date,
              descriptionText: "",
              casts: [],
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    "assets/images/$image",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: double.infinity,
                      height: 100,
                      color: secondaryBlack,
                    ),
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 46,
                    height: 46,
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
          SizedBox(height: 10),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PersianNumber(
                    number: date,
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
                    genre,
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
      ),
    );
  }
}
