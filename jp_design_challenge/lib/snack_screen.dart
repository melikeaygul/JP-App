import 'package:flutter/material.dart';

class SnackishApp extends StatelessWidget {
  const SnackishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackish',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto'),
      ),
      home: SnackScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SnackScreen extends StatelessWidget {
  const SnackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/img/bg_mainscreen.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Choose Your Favorite\nSnack",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategoryChip("🛍️ All categories"),
                          SizedBox(width: 8),
                          _buildCategoryChip(" Salty", highlight: true),
                          SizedBox(width: 8),
                          _buildCategoryChip(" Sweet"),
                          SizedBox(width: 8),
                          _buildCategoryChip(" Drinks"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                padding: EdgeInsets.all(16),
                children: [
                  _buildBurgerCard(),
                  SizedBox(height: 55),
                  Text("We Recommend",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildIceCreamCard(
                            "Mogli's Cup",
                            "Strawberry ice cream",
                            200,
                            "assets/grafik/cupkake_cat.png"),
                        SizedBox(width: 12),
                        _buildIceCreamCard("Balu's Cup", "Pistachio ice cream",
                            130, "assets/grafik/icecream.png"),
                        SizedBox(width: 12),
                        _buildIceCreamCard("Balu's Cup", "Pistachio ice cream",
                            130, "assets/grafik/icecream.png"),
                        SizedBox(width: 12),
                        _buildIceCreamCard("Balu's Cup", "Pistachio ice cream",
                            130, "assets/grafik/icecream.png"),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBurgerCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Die Karte selbst
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage("assets/details/cut_card.png"),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Angi's Yummy Burger",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text("Delish vegan burger\nthat tastes like heaven",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(height: 8),
                    Text("₳ 13.99",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(width: 120), // Platz für den Button + Burger
            ],
          ),
        ),

        // Button + Burger als Stack
        Positioned(
          right: -5,
          bottom: -20,
          child: Row(
            children: [
              // Button
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFBB8DE1),
                      Color(0xFF908CF5),
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
                  onPressed: () {
                    // Action hier
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Add to order",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 39),
              // Burger
              Image.asset(
                "assets/grafik/burger.png",
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIceCreamCard(
      String title, String subtitle, int likes, String imageAsset) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter, // Verlauf startet oben
          end: Alignment.bottomCenter, // Verlauf endet unten
          stops: [0.07, 0.61, 1.0], // Stopps für den Verlauf (Prozentsätze)
          colors: [
            Color.fromARGB(255, 115, 108, 108),
            Color(0xFF908CF5),
            Color(0xFF8C5BEA),
          ],
        ),
      ),
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 170,
            width: 150,
            child: Image.asset(
              imageAsset, // Dynamisches Asset, das als Parameter übergeben wird
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8),
          Text(title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          Text(subtitle,
              style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(107, 255, 255, 255))),
          SizedBox(height: 4),
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "₳ 8.99",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 60),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: const Color.fromARGB(107, 255, 255, 255),
                    size: 14,
                  ),
                  Text(
                    " $likes",
                    style: TextStyle(
                        color: const Color.fromARGB(107, 255, 255, 255)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool highlight = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: highlight
            ? Color(0xFFE970C4) // rosa Hintergrund für Salty
            : Colors.white.withOpacity(0.2), // milchig für andere
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: highlight ? Colors.black : Colors.white, // 👈 Hier ändern
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
