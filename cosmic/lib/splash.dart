import 'package:avatar_glow/avatar_glow.dart';
import 'package:cosmic/Login.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Adding a delay before navigating to the next page

    Future.delayed(const Duration(milliseconds: 2500), () {
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
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AvatarGlow(
                  endRadius: 300,
                  duration: const Duration(milliseconds: 2100),
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                            width: 1, color: Colors.white.withOpacity(0.1)),
                      ),
                    ),
                    child: Image.asset(
                      'lib/assets/Cosmic logo.png',
                    ),
                  ),
                ),
                CircularPercentIndicator(
                  radius: 204,
                  percent: 0.78,
                  lineWidth: 8,
                  progressColor: Colors.white.withOpacity(0.5),
                  backgroundColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                )
              ],
            ),
          )),
    );
  }
}
