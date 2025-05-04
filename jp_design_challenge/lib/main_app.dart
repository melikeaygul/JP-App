import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_design_challenge/snack_screen.dart';

//import 'package:google_fonts/google_fonts.dart';
//import 'package:jp_design_challenge/wave_painter.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/img/bg_startscreen.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment(0.6, -0.12),
              child: Transform.scale(
                scale: 2.5,
                child: Image.asset(
                  "assets/grafik/cupcake_chick.png",
                  width: 230,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.54),
              child: Transform.scale(
                scale: 2,
                child: Image.asset(
                  "assets/details/snack_snack.png",
                  width: 199,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: 8.0, left: 8.0),
                child: Align(
                  alignment: Alignment(0.0, 0.75),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                      child: Container(
                        width: 360,
                        height: 200,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 240, 238, 238)
                                .withOpacity(0.0),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.3))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Feeling Snackish Today?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Explore Angi's most popular snack selection and get instantly happy.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Builder(
                                builder: (context) => ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SnackScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                    ),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFE970C4),
                                            Color(0xFFF69EA3)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 64, vertical: 12),
                                        child: Text(
                                          "Order Now",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: ClipRRect(
                //     child: OverflowBox(
                //       maxWidth: double.infinity,
                //       child: Transform.translate(
                //         offset: Offset(8.0, -301),
                //         child: Text(
                //           'SNACK',
                //           style: GoogleFonts.openSans(
                //             textStyle: TextStyle(
                //                 fontSize: 125,
                //                 fontWeight: FontWeight.bold,
                //                 foreground: Paint()
                //                   ..style = PaintingStyle.stroke
                //                   ..strokeWidth = 2
                //                   ..color =
                //                       const Color.fromARGB(228, 255, 255, 255)),
                //           ),
                //           overflow: TextOverflow.clip,
                //           softWrap: false,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
