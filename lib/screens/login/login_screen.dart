import 'package:film_q/constants/colors.dart';
import 'package:film_q/screens/login/sign_in_screen.dart';
import 'package:film_q/screens/login/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellow,
                    maximumSize: const Size(double.infinity, 56),
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "ثبت نام",
                    style: TextStyle(
                      color: primaryBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: yellow,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "وارد شوید",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Text(
                      "قبلا ثبت نام کردید؟",
                      style: TextStyle(color: lightGray, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            // "یا وارد شدن با",
                            "ثبت نام با موارد دیگر",
                            style: TextStyle(
                              color: lightGray,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              padding: EdgeInsets.zero,
                              maximumSize: const Size(70, 70),
                              minimumSize: const Size(70, 70),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/images/google.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                          IconButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              maximumSize: const Size(70, 70),
                              minimumSize: const Size(70, 70),
                              shape: const CircleBorder(side: BorderSide.none),
                            ),
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/images/apple.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ],
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
