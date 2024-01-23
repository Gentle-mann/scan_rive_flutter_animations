import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import 'components/animated_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _buttonAnimationController;
  @override
  void initState() {
    super.initState();
    _buttonAnimationController = OneShotAnimation('active', autoplay: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 10,
              ),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset('assets/rive_assets/shapes.riv'),
          Positioned(
              bottom: 200,
              left: 100,
              width: MediaQuery.of(context).size.width * 1.7,
              child: Image.asset('assets/backgrounds/spline.png')),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          'Learn design & code',
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Poppins',
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Don\'t skip design'),
                      ],
                    ),
                  ),
                  AnimatedButton(
                    buttonAnimationController: _buttonAnimationController,
                    press: () {
                      _buttonAnimationController.isActive = false;
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: 'Sign in',
                        pageBuilder: (context, animation, secondary) => Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 36),
                                height: 620,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Column(
                                  children: [
                                    const Text(
                                      'Sign in',
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                        'Access to 240+ hours of content. Learn design and code by building real apps with Flutter and Swift.'),
                                    const SizedBox(height: 10),
                                    const Text('Email'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: SvgPicture.asset(
                                          'assets/icons/email.svg',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text('Password'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: SvgPicture.asset(
                                          'assets/icons/password.svg',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    ElevatedButton.icon(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                              topLeft: Radius.circular(10),
                                            ),
                                          )),
                                      icon: const Icon(
                                          CupertinoIcons.arrow_right),
                                      label: const Text('Sign in'),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Divider(),
                                        ),
                                        Text('OR',
                                            style: TextStyle(
                                                color: Colors.black26)),
                                        Expanded(
                                          child: Divider(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                        'Sign up with Email, Apple or Google'),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SvgPicture.asset(
                                        'assets/icons/email_box.svg'),
                                    SvgPicture.asset(
                                        'assets/icons/apple_box.svg'),
                                    SvgPicture.asset('assets/icons/google.svg'),
                                    Positioned(
                                        bottom: -50,
                                        child: CircleAvatar(
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.close),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
