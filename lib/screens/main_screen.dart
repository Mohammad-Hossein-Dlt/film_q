import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/favorit_list_screen.dart';
import 'package:film_q/screens/home_screen.dart';
import 'package:film_q/screens/profile/profile_screen.dart';
import 'package:film_q/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreenNavigationBar extends StatefulWidget {
  const MainScreenNavigationBar({super.key});

  @override
  State<MainScreenNavigationBar> createState() =>
      _MainScreenNavigationBarState();
}

class _MainScreenNavigationBarState extends State<MainScreenNavigationBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 3);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      navBarStyle: NavBarStyle.style12,
      confineInSafeArea: true,

      backgroundColor: primaryBlack,

      stateManagement: true,
      bottomScreenMargin: 0,
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.once,
      popAllScreensOnTapAnyTabs: false,
      // hideNavigationBarWhenKeyboardShows: true,
      // navBarHeight: 0,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10),
          colorBehindNavBar: Colors.white),
      items: [
        item(
          activeIcon: const Icon(Iconsax.profile_2user5, size: 28),
          inactiveIcon: const Icon(Iconsax.profile_2user, size: 20),
          title: "پروفایل",
        ),
        item(
          activeIcon: const Icon(Icons.bookmark_added_rounded, size: 28),
          inactiveIcon: const Icon(Icons.bookmark_added_outlined, size: 20),
          title: "لیست علاقمندی",
        ),
        item(
          activeIcon: const Padding(
            padding: EdgeInsets.only(right: 32),
            child: Icon(Iconsax.search_normal_15, color: yellow, size: 28),
          ),
          inactiveIcon:
              const Icon(Iconsax.search_normal_1, color: lightGray, size: 20),
          title: "جستجو",
          isCenter: true,
        ),
        item(
          activeIcon: const Icon(Iconsax.home5, size: 28),
          inactiveIcon: const Icon(Iconsax.home, size: 20),
          title: "خانه",
        ),
      ],
      screens: const [
        ProfileScreen(),
        FavoritListScreen(),
        SearchScreen(showPreSearched: false),
        HomeScreen(),
      ],
    );
  }

  PersistentBottomNavBarItem item({
    required String title,
    required Widget activeIcon,
    required Widget inactiveIcon,
    bool isCenter = false,
  }) {
    return PersistentBottomNavBarItem(
      icon: activeIcon,
      inactiveIcon: inactiveIcon,
      // --------------------------
      activeColorPrimary: yellow,
      inactiveColorPrimary: lightGray,
      // --------------------------
      title: title,
      // iconSize: 24,

      textStyle: const TextStyle(
        fontSize: 12,
        color: primaryBlack,
      ),

      // --------------------------
    );
  }
}
