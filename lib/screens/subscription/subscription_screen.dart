import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/subscription/payment_method_screen.dart';
import 'package:film_q/widgets/persian_number.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  Map<String, Map<String, String>> subscriptionItemsList = {
    "1": {
      "title": "اشتراک سالانه",
      "price": "1 میلیون تومان",
      "period": "365 روز",
    },
    "2": {
      "title": "اشتراک ماهانه",
      "price": "110 هزار تومان",
      "period": "31 روز",
    },
  };

  String selectedItemId = "";
  @override
  void initState() {
    selectedItemId = subscriptionItemsList.keys.toList().first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: const BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      "دسترسی پریمیوم",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryBlack),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "شما برای دیدن بعضی از فیلم ها یا سریال ها نیاز هست پریمیوم باشید",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.spaceAround,
                      runSpacing: 20,
                      children: [
                        ...subscriptionItemsList.keys.toList().map(
                              (e) => item(
                                id: e,
                                title: subscriptionItemsList[e]!["title"] ?? "",
                                price: subscriptionItemsList[e]!["price"] ?? "",
                                period:
                                    subscriptionItemsList[e]!["period"] ?? "",
                              ),
                            ),
                        description(
                          text: "امکان دانلود و ذخیره فیلم ها",
                          icon: const Icon(
                            Iconsax.arrow_down,
                            color: primaryBlack,
                            size: 16,
                          ),
                        ),
                        description(text: "حذف تبلیغات و سریع تر شدن"),
                        description(
                          text: "امکان دانلود و ذخیره فیلم ها",
                          icon: const Icon(
                            Iconsax.arrow_down,
                            color: primaryBlack,
                            size: 16,
                          ),
                        ),
                        description(text: "حذف تبلیغات و سریع تر شدن"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(double.infinity, 56),
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PaymentMethodScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "انتخاب شیوه پرداخت",
                        style: TextStyle(
                          color: primaryBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item({
    required String id,
    required String title,
    required String price,
    required String period,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedItemId = id;
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 156,
        height: 138,
        decoration: BoxDecoration(
          color: selectedItemId == id ? yellow : secondaryBlack,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: selectedItemId == id ? Colors.transparent : tertiaryBlack,
          ),
        ),
        child: Stack(
          children: [
            Visibility(
              visible: selectedItemId == id,
              child: Positioned.fill(
                child: Image.asset(
                  "assets/images/patern_2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedItemId == id ? primaryBlack : white,
                    ),
                  ),
                  PersianNumber(
                    number: price,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    maxLine: 1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedItemId == id ? primaryBlack : white,
                    ),
                  ),
                  PersianNumber(
                    number: period,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    maxLine: 1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedItemId == id ? primaryBlack : white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget description({
    required String text,
    Widget? icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      width: 156,
      height: 64,
      decoration: BoxDecoration(
        color: secondaryBlack,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: tertiaryBlack,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: white,
            ),
            child: icon ??
                Center(
                  child: Container(
                    width: 16,
                    height: 1.6,
                    decoration: const BoxDecoration(
                      color: primaryBlack,
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
