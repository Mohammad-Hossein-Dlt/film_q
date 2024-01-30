import 'dart:ui';

import 'package:film_q/constants/colors.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List<Map<String, String>> cardsList = [
    {
      "name": "زرینپال",
      "image": "assets/images/zarinpal.png",
    },
    {
      "name": "ایدی پی",
      "image": "assets/images/id_pay.png",
    },
  ];
  String selectedCardName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
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
                      "درگاه بانکی را برای پرداخت اشتراک مورد نظر انتخاب کنید.",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...cardsList.map(
                      (e) => cardItem(
                          name: e["name"] ?? "", image: e["image"] ?? ""),
                    ),
                    const SizedBox(height: 100),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(double.infinity, 56),
                        minimumSize: const Size(double.infinity, 56),
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
                                    horizontal: 10, vertical: 20),
                                height: 360,
                                decoration: const BoxDecoration(
                                  color: secondaryBlack,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/images/successfull.png"),
                                    const Text(
                                      "پرداخت موفق",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Text(
                                      "اشتراک شما فعال شد و شما میتوانید به مدت 31 روز از فیلم کیو استفاده کنید ، حواستان باشد استفاده بیشتر از 3 نفر به صورت هم زمان باعث مسدودی اکانت میشود.",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: lightGray,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        maximumSize: const Size(130, 56),
                                        minimumSize: const Size(130, 56),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "تایید",
                                        style: TextStyle(
                                          color: primaryBlack,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
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
                      child: const Text(
                        "پرداخت کنید",
                        style: TextStyle(
                          color: primaryBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
    );
  }

  Widget cardItem({
    required String name,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          setState(() {
            selectedCardName = name;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          width: double.infinity,
          height: 72,
          decoration: BoxDecoration(
            color: secondaryBlack,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: selectedCardName == name ? yellow : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: yellow, width: 1),
                ),
                child: Center(
                  child: Visibility(
                    visible: selectedCardName == name,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: yellow,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset(image, width: 48, height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
