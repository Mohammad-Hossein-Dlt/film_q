import 'package:film_q/constants/colors.dart';
import 'package:film_q/constants/iconsax_icons.dart';
import 'package:film_q/screens/login/verifycode_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPassword = true;
  bool acceptRuls = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: const SizedBox(),
              title: const Text("ثبت نام"),
              centerTitle: true,
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
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "خوش آمدید",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "به سایت فیلم و سریال فیلم کیو خوش آمدید.",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: lightGray,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        maxLines: 1,
                        minLines: 1,
                        textDirection: TextDirection.ltr,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(color: yellow, width: 1.4)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(color: secondaryBlack, width: 1)),
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          hintText: "نام و نام خانوادگی",
                          label: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: secondaryBlack,
                            ),
                            child: const Text(
                              "نام و نام خانوادگی شما",
                              style: TextStyle(
                                color: lightGray,
                              ),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        maxLines: 1,
                        minLines: 1,
                        textDirection: TextDirection.ltr,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(color: yellow, width: 1.4)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(color: secondaryBlack, width: 1)),
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          hintText: "آدرس ایمیل",
                          label: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: secondaryBlack,
                            ),
                            child: const Text(
                              "آدرس ایمیل شما",
                              style: TextStyle(
                                color: lightGray,
                              ),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        maxLines: 1,
                        minLines: 1,
                        textDirection: TextDirection.ltr,
                        keyboardType: TextInputType.text,
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(color: yellow, width: 1.4)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(color: secondaryBlack, width: 1)),
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          hintText: "پسورد اکانت",
                          label: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: secondaryBlack,
                            ),
                            child: const Text(
                              "پسورد اکانت شما",
                              style: TextStyle(
                                color: lightGray,
                              ),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: darkGray,
                              )),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "رو قبول میکنم.",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12, color: lightGray),
                            ),
                            Text(
                              " قوانین ",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12, color: yellow),
                            ),
                            Text(
                              "تمام",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12, color: lightGray),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Checkbox(
                              activeColor: yellow,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              side: const BorderSide(
                                width: 1,
                                color: lightGray,
                              ),
                              value: acceptRuls,
                              onChanged: (value) {
                                setState(() {
                                  acceptRuls = value ?? false;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: yellow,
                        maximumSize: const Size(double.infinity, 56),
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const VerifyCodeScreen(
                              email: "test@gmail.com",
                            ),
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
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
