import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kindkarma/globals.dart';
import 'package:kindkarma/widgets/action_button.dart';

class AuthPage extends StatefulWidget {
  static const String route = "/LoginPage";

  const AuthPage({super.key});
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  String email = "", password = "", userName = "";
  late double height, width;
  PageController controller = PageController(initialPage: 0);
  bool isLoading = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
      lowerBound: 0,
      upperBound: pi,
    );
    super.initState();
    animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(color: accentColor),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0)
                        .animate(animationController),
                    // angle: animationController.value,
                    child: child,
                  );
                },
                child: ScaleTransition(
                  scale:
                      Tween(begin: 0.0, end: 1.0).animate(animationController),

                  // scale: isLoading ? 0.75 : 1.5,
                  child: SvgPicture.asset(
                    "assets/paths.svg",
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Center(
              child: SvgPicture.asset("assets/logo.svg"),
            ),
            Positioned(
              top: 0.1 * getHeight(context),
              left: 0,
              right: 0,
              bottom: 0,
              child: _getCard(context),
            ),
          ],
        ),
      ),
    );
  }

  _getCard(BuildContext context) {
    return PageView.builder(
        controller: controller,
        itemCount: 2,
        itemBuilder: (context, index) {
          return _getForm(context, index == 0);
        });
  }

  _getForm(BuildContext context, bool isLogin) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isLoading ? 0 : 1,
            child: Card(
              color: Theme.of(context).cardColor,
              elevation: 20,
              shadowColor: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isLogin ? "Login" : "Signup",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: darkColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (!isLogin)
                      _buildTextField("Username", (e) => userName = e.trim()),
                    _buildTextField("Email", (e) => email = e.trim()),
                    _buildTextField("Password", (e) => password = e.trim()),
                    const SizedBox(height: 20),
                    ActionButton(
                      onPressed: () async {
                        isLoading = true;
                        setState(() {});

                        await Future.delayed(const Duration(seconds: 5));
                        isLoading = false;
                        setState(() {});

                        // goToPage(context, const HomePage(), clearStack: true);
                      },
                      text: "Proceed",
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          isLogin ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      child: RichText(
                        text: TextSpan(style: GoogleFonts.poppins(), children: [
                          TextSpan(
                              text: isLogin
                                  ? "Don't have an account?"
                                  : "Already have an account?",
                              style: const TextStyle(color: Colors.black)),
                          TextSpan(
                              text: isLogin ? " Sign Up" : " Login",
                              style: TextStyle(color: accentColor))
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTextField(String text, Function onChange) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          onChanged: (e) => onChange(e),
          decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 20.0)),
        ),
      ),
    );
  }
}
