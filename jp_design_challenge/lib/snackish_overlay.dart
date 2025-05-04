import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_design_challenge/snack_screen.dart' show SnackScreen;

class SnackishOverlay extends StatefulWidget {
  const SnackishOverlay({super.key});

  @override
  _SnackishOverlayState createState() => _SnackishOverlayState();
}

class _SnackishOverlayState extends State<SnackishOverlay>
    with SingleTickerProviderStateMixin {
  int quantity = 1;
  String selectedSize = 'Large';
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 54, 54).withOpacity(0.5),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Container(color: const Color.fromARGB(0, 0, 0, 0)),
            ),
            SlideTransition(
              position: _offsetAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.89,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 38, 30, 30),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -150,
                          left: MediaQuery.of(context).size.width * 0.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/grafik/cupkake_cat.png',
                              height: 370,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 125),
                            Padding(
                              padding: EdgeInsets.all(6),
                              child: Align(
                                alignment: Alignment(0.0, 0.25),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 13),
                                    child: Container(
                                      width: 360,
                                      height: 350,
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                0, 255, 253, 253)
                                            .withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                                  0, 78, 78, 78)
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.white70,
                                                  size: 17,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "200",
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(height: 18),
                                              Text(
                                                "Mogli's Cup",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                "Lorem ipsum dolor sit amet consectetur. Non\n feugiat imperdiet a vel sit at amet. Mi\n accumsan feugiat magna aliquam feugiat ac\n et. Pulvinar hendrerit id arcu at sed etiam\n semper mi hendrerit. Id aliquet quis quam.",
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 22),
                                              Center(
                                                child: Text(
                                                  "₳ 8.99",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 21,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Center(
                                                child: Container(
                                                  width: 305,
                                                  height: 2,
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Ingredients",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.white70,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        SizedBox(width: 100),
                                                        Text(
                                                          "Reviews",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.white70,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/details/gluten_1_360.png",
                                                          height: 21,
                                                          width: 21,
                                                          color: Colors.white70,
                                                        ),
                                                        SizedBox(width: 8),
                                                        Image.asset(
                                                          "assets/details/sugar_360.png",
                                                          height: 21,
                                                          width: 21,
                                                          color: Colors.white70,
                                                        ),
                                                        SizedBox(width: 8),
                                                        Image.asset(
                                                          "assets/details/lowfat_360.png",
                                                          height: 21,
                                                          width: 21,
                                                          color: Colors.white70,
                                                        ),
                                                        SizedBox(width: 8),
                                                        Image.asset(
                                                          "assets/details/kcal_360.png",
                                                          height: 21,
                                                          width: 21,
                                                          color: Colors.white70,
                                                        ),
                                                        SizedBox(width: 60),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.white70,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.white70,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.white70,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.white70,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.star_border,
                                                          color: Colors.white70,
                                                          size: 20,
                                                        ),
                                                        SizedBox(width: 7),
                                                        Text(
                                                          "4.0",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.white70,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                            SizedBox(height: 70),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2.0, vertical: 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SegmentedButton<String>(
                                    segments: const [
                                      ButtonSegment(
                                          value: 'Small',
                                          label: Text(
                                            'Small',
                                            style: TextStyle(fontSize: 11),
                                          )),
                                      ButtonSegment(
                                          value: 'Medium',
                                          label: Text(
                                            'Medium',
                                            style: TextStyle(fontSize: 11),
                                          )),
                                      ButtonSegment(
                                          value: 'Large',
                                          label: Text(
                                            'Large',
                                            style: TextStyle(fontSize: 11),
                                          )),
                                    ],
                                    selected: {selectedSize},
                                    onSelectionChanged: (newSelection) {
                                      setState(() {
                                        selectedSize = newSelection.first;
                                      });
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                Colors.grey[800]),
                                        foregroundColor:
                                            WidgetStateProperty.all(
                                                Colors.white),
                                        side: WidgetStateProperty.all(
                                            BorderSide(color: Colors.white24)),
                                        padding: WidgetStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 4, vertical: 2)),
                                        minimumSize: WidgetStateProperty.all(
                                            Size(0, 30))),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.remove_circle_outline_outlined,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          if (quantity > 1) {
                                            setState(() => quantity--);
                                          }
                                        },
                                      ),
                                      Text(
                                        '$quantity',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          setState(() => quantity++);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFF69EA3),
                                    Color(0xFFE970C4),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFBB8DE1).withOpacity(0.6),
                                    blurRadius: 18,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 84, vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Add to order for ₳8.99",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
