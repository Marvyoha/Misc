import 'package:cosmic/Login.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Adding a delay before navigating to the next page

    Future.delayed(const Duration(milliseconds: 1700), () {
      // Replace 'NextPage' with the actual page you want to navigate to
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Cosmic Background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          width: 100,
          height: 100,
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(width: 7, color: Colors.white.withOpacity(0.1)),
            ),
          ),
          child: Image.asset('lib/assets/Cosmic logo.png'),
        ),
      ),
    );
  }
}
