import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maze_knight/const/const_color.dart';
import 'package:maze_knight/widgets/elevated_icon_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 18, right: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.settings_outlined, size: 30, color: Color.fromRGBO(255, 107, 107, 1)),
                    Gap(10),
                    Text(
                      "SETTINGS",
                      style: GoogleFonts.fredoka(fontSize: 32, fontWeight: FontWeight.w800, height: 0.9),
                    ),
                  ],
                ),

                ElevatedIconButton(
                  icon: Icon(Icons.close_rounded, color: Colors.black, fontWeight: FontWeight.bold),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 30,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 25, offset: Offset(0, 10), spreadRadius: 0.5),
                      ],
                      border: Border.all(color: Color.fromRGBO(241, 245, 249, 1), width: 2),

                      color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Text(
                          "AUDIO",
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 0.9,
                            color: Colors.grey,
                          ),
                        ),

                        Row(
                          children: [
                            IconContainer(
                              backgroundColor: Colors.red[100],
                              iconColor: Colors.red,
                              icons: Icon(Icons.volume_up),
                            ),
                            Gap(10),
                            Text(
                              "AUDIO",
                              style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w600, height: 0.9),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconContainer(
                              backgroundColor: Colors.green[100],
                              iconColor: Colors.green,
                              icons: Icon(Icons.volume_up),
                            ),
                            Gap(10),
                            Text(
                              "MUSIC",
                              style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w600, height: 0.9),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 150,
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 25, offset: Offset(0, 10), spreadRadius: 0.1),
                      ],
                      border: Border.all(color: Color.fromRGBO(241, 245, 249, 1), width: 2),

                      color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Text(
                          "GENERAL",
                          style: GoogleFonts.fredoka(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 0.9,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            IconContainer(
                              backgroundColor: Colors.yellow[100],
                              iconColor: Colors.yellow,
                              icons: Icon(Icons.language),
                            ),
                            Gap(10),
                            Text(
                              "LANGUAGE",
                              style: GoogleFonts.fredoka(fontSize: 18, fontWeight: FontWeight.w600, height: 0.9),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      return AnimatedButton(
                        width: constraints.maxWidth,
                        height: 70,
                        color: Colors.white,
                        shadowDegree: ShadowDegree.dark,
                        onPressed: () {},
                        borderRadius: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete_forever, color: dangerColor),
                            const SizedBox(width: 10),
                            Text(
                              "RESET PROGRESS",
                              style: GoogleFonts.fredoka(fontWeight: FontWeight.bold, fontSize: 18, color: dangerColor),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Color iconColor;
  final Icon icons;

  const IconContainer({super.key, required this.backgroundColor, required this.iconColor, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: backgroundColor),
      child: Icon(icons.icon, color: iconColor),
    );
  }
}
