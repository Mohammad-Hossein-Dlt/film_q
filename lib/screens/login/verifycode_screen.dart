import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/login/new_password_screen.dart';
import 'package:film_q/screens/main_screen.dart';
import 'package:film_q/widgets/persian_number.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pinput/pinput.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({
    super.key,
    required this.email,
    this.changePassword = false,
  });
  final String email;
  final bool changePassword;
  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  late Timer countDown;

  Duration duration = const Duration(seconds: 59);

  void setCountDown() {
    int reduceSeconsBy = 1;
    setState(() {
      final curentSeconds = duration.inSeconds - reduceSeconsBy;
      if (curentSeconds <= 0) {
        duration = const Duration(seconds: 0);
        countDown.cancel();
      } else {
        duration = Duration(seconds: curentSeconds);
      }
    });
  }

  @override
  void initState() {
    countDown = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
    super.initState();
  }

  @override
  void dispose() {
    countDown.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      textStyle: const TextStyle(
          fontSize: 20, color: white, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: secondaryBlack,
        border: Border.all(color: secondaryBlack),
        borderRadius: BorderRadius.circular(12),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: secondaryBlack),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: yellow),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext, bool) => [
            SliverAppBar(
              pinned: true,
              leading: const SizedBox(),
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
                      Navigator.of(context).pop();
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
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "کد تایید وارد کنید",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "یک کد 4 عددی به آدرس ایمیل ${widget.email} ارسال شد.",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: lightGray,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Pinput(
                  autofocus: true,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  enabled: duration.inSeconds != 0,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  length: 4,
                  onCompleted: (pin) {},
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellow,
                    maximumSize: const Size(double.infinity, 56),
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  onPressed: () {
                    if (widget.changePassword) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NewPasswordScreen(),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MainScreenNavigationBar(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "تایید کد",
                    style: TextStyle(
                      color: primaryBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                duration.inSeconds != 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PersianNumber(
                            number:
                                "${(duration.inSeconds / 60).floor()}:${(duration.inSeconds % 60).floor() < 10 ? 00 : ''}${(duration.inSeconds % 60).floor()}",
                            style: const TextStyle(
                              color: yellow,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "ارسال دوباره کد",
                            style: TextStyle(fontSize: 16, color: darkGray),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: yellow,
                            ),
                            onPressed: () {},
                            child: const Text(
                              "ارسال مجدد",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Text(
                            "کد را دریافت نکردید؟",
                            style: TextStyle(
                              fontSize: 16,
                              color: darkGray,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
