import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<PageViewModel> listPagesViewModel() => [
        PageViewModel(
          titleWidget: Column(
            children: [
              Image.asset(
                "assets/images/welcomr_page_image_1.png",
                width: double.infinity,
              ),
              const Text(
                "فیلم کیو",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bodyWidget: const Text(
            "با استفاده از اپلیکیشن فیلم و سریال فیلم کیو میتوانید به راحتی فیلم و سریال های روز دنیا رو ببینید و از دیدن فیلم ها لذت ببرید. ",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: lightGray,
            ),
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
            contentMargin: EdgeInsets.zero,
            bodyPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          titleWidget: Column(
            children: [
              Container(
                // color: gray100,
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      left: 0,
                      top: 40,
                      // bottom: 20,
                      child: Image.asset(
                        "assets/images/welcomr_page_image_3.png",
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/app_icon_with_opacity.png",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/images/welcomr_page_image_2.png",
                      width: 210,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const Text(
                "فیلم های بروز",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bodyWidget: const Text(
            "شما میتوانید به جدید ترین و بروز ترین فیلم و سریال های روز دنیا دسترسی داشته باشید.",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: lightGray,
            ),
          ),
        ),
        PageViewModel(
          titleWidget: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: darkGray),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: yellow,
                              ),
                              Text(
                                "امتیاز",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: lightGray,
                                ),
                              ),
                              Text(
                                "9 / 10",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: darkGray),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.clock5,
                                color: yellow,
                              ),
                              Text(
                                "تایم",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: lightGray,
                                ),
                              ),
                              Text(
                                "1h 20m",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/welcomr_page_image_4.png",
                    ),
                  ],
                ),
              ),
              const Text(
                "نقد کنید",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // titleWidget: const Text(
          //   "فیلم های بروز",
          //   style: TextStyle(
          //     fontSize: 48,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          bodyWidget: const Text(
            "به راحتی نظر هاتون رو در مورد فیلم ها بنویسید و امتیاز بدید ، توجه کنید امتیاز های شما به صورت مستقیم در imdb تاثیر دارد.",
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: lightGray,
            ),
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox(),
          decoration: const PageDecoration(
            bodyAlignment: Alignment.center,
          ),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app_icon_with_opacity.png",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const Text(
                "FILMQ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "فیلم و سریال های روز دنیا رو با ما تجربه کنید",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: lightGray,
                ),
              ),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: IntroductionScreen(
            pages: listPagesViewModel(),
            showNextButton: false,
            // showSkipButton: true,
            showBackButton: false,
            done: const Text(
              "ورورد/ثبت نام",
              style: TextStyle(color: yellow),
            ),
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: yellow,
              color: yellow.withOpacity(0.4),
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
