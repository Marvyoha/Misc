import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Image.asset('lib/assets/Cosmic logo.png'),
            SizedBox(height: size.height * 0.13),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              height: size.height * 0.6,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.05),
                    const Text(
                      'Sign in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E-mail',
                        hintStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.all(
                            16), // Padding inside the TextField
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(44),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 9.3),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.all(
                            16), // Padding inside the TextField
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(44),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.3),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    const SizedBox(
                      width: 279,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF11DCE8),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          height: 1.12,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    // SIGN IN BUTTON
                    Center(
                      child: Container(
                        width: 279,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 6),
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(-0.69, -0.72),
                            end: Alignment(0.69, 0.72),
                            colors: [
                              Color(0xFF00E5E5),
                              Color(0xFF72A4F1),
                              Color(0xFFE860FF)
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(44),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sign in',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    // 'OR SIGN IN USING'
                    const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'or sign in using',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF8C8E99),
                              fontSize: 14,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: 100,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
