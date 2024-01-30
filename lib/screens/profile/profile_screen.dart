import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/profile/download_screen.dart';
import 'package:film_q/screens/profile/notification_screen.dart';
import 'package:film_q/screens/profile/user_acount_edit_screen.dart';
import 'package:film_q/screens/subscription/subscription_screen.dart';
import 'package:film_q/screens/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: const SizedBox(),
            centerTitle: true,
            title: const Text(
              "پروفایل",
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
                    // Navigator.of(context).pop();
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
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 86,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: secondaryBlack,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.edit,
                            color: yellow,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "محمد حسین دولت آبادی",
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "test@gmail.com",
                                      textDirection: TextDirection.rtl,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: lightGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 6),
                              Image.asset(
                                "assets/images/avatar_2.png",
                                width: 54,
                                height: 54,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SubscriptionScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 110,
                          decoration: const BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        Positioned.fill(
                          child: Image.asset(
                            "assets/images/patern.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 20,
                          right: 20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "خرید اشتراک پریمیوم",
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "شما میتوانید با خرید اشتراک پریمیوم میتوانید فیلم هارو دانلود کنید.",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: white.withOpacity(0.4),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14)),
                                ),
                                child: const Icon(
                                  Iconsax.medal_star5,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  item(
                    title: "پروفایل",
                    icon: const Icon(
                      Icons.person,
                      color: lightGray,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UserAcountEditScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: secondaryBlack),
                  item(
                    title: "اعلانات",
                    icon: const Icon(
                      Icons.notifications,
                      color: lightGray,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: secondaryBlack),
                  item(
                    title: "دانلود ها",
                    icon: const Icon(
                      Iconsax.arrow_down,
                      color: lightGray,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DownloadScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: secondaryBlack),
                  item(
                    title: "نظرات شما",
                    icon: const Icon(
                      Icons.comment,
                      color: lightGray,
                    ),
                    function: () {},
                  ),
                  const Divider(color: secondaryBlack),
                  item(
                    title: "قوانین و مقررات",
                    icon: const Icon(
                      Iconsax.shield_tick5,
                      color: lightGray,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const TermsAndConditionsScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: secondaryBlack),
                  const SizedBox(height: 40),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: red,
                      side: const BorderSide(color: red),
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "خروج از حساب کاربری",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget item({
    required String title,
    String? subTitle,
    required Widget icon,
    required Function() function,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      // margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          function();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: tertiaryBlack,
                ),
                child: const Icon(
                  Iconsax.arrow_left_2,
                  color: blue,
                  size: 20,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          subTitle != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        subTitle,
                                        textDirection: TextDirection.rtl,
                                        // overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: lightGray,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: secondaryBlack,
                        shape: BoxShape.circle,
                      ),
                      child: icon,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
