import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maze_knight/const/const_color.dart';
import 'package:maze_knight/screens/chapters.dart';
import 'package:maze_knight/screens/setting.dart';
import 'package:maze_knight/widgets/elevated_icon_button.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedIconButton(
                      icon: Icon(Icons.settings, color: Colors.grey),
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen())),
                    ),
                    ElevatedIconButton(icon: Icon(Icons.person, color: Colors.grey)),
                  ],
                ),
              ),

              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text(
                        "Maze",
                        style: GoogleFonts.fredoka(
                          fontSize: 65,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2,
                          height: 0.9,
                          color: Color.fromRGBO(255, 107, 107, 1),
                        ),
                      ),
                      Text(
                        "Runner",
                        style: GoogleFonts.fredoka(
                          fontSize: 65,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2,
                          height: 0.9,
                          color: Color.fromRGBO(30, 41, 59, 1),
                        ),
                      ),
                    ],
                  ),

                  Gap(35),

                  AnimatedButton(
                    width: 300,
                    height: 70,
                    color: Color.fromRGBO(255, 107, 107, 1),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Chapters()));
                    },
                    borderRadius: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(Icons.play_arrow_outlined, fontWeight: FontWeight.bold, color: Colors.white),
                        Text(
                          "CONTINUE",
                          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedButton(
                        width: 145,
                        height: 160,
                        color: Color.fromRGBO(78, 205, 196, 1),
                        onPressed: () {},
                        borderRadius: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(Icons.map_outlined, fontWeight: FontWeight.bold, color: Colors.white, size: 30),
                            Text(
                              "LEVELS",
                              style: GoogleFonts.fredoka(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(5),
                      AnimatedButton(
                        width: 145,
                        height: 160,
                        color: Color.fromRGBO(255, 230, 109, 1),
                        onPressed: () {},
                        borderRadius: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(Icons.checkroom, fontWeight: FontWeight.bold, color: Colors.black, size: 30),
                            Text(
                              "SKINS",
                              style: GoogleFonts.fredoka(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Gap(15),

                  AnimatedButton(
                    width: 300,
                    height: 70,
                    color: Colors.white,
                    shadowDegree: ShadowDegree.dark,
                    onPressed: () {},
                    borderRadius: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(Icons.people_outline, fontWeight: FontWeight.bold, color: Color.fromRGBO(78, 205, 196, 1)),
                        Text(
                          "CREATE ROOM",
                          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'QUIT GAME',
                      style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.workspace_premium_outlined, color: Colors.grey),
                        Text("Rank", style: GoogleFonts.fredoka(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.stars_sharp, color: Colors.grey),
                        Text("120 xp", style: GoogleFonts.fredoka(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.person_add_alt, color: Colors.grey),
                        Text("Friends", style: GoogleFonts.fredoka(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
