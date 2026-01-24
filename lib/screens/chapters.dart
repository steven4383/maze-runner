import 'dart:async';
import 'dart:convert';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maze_knight/const/const_color.dart';
import 'package:maze_knight/models/chapter_model.dart';
import 'package:maze_knight/widgets/player_currency.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Chapters extends StatefulWidget {
  const Chapters({super.key});

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  GameData? _gameData;

  Future<void> _loadData() async {
    final data = await loadGameData();
    if (!mounted) return;
    setState(() {
      _gameData = data;
    });
  }

  Future<GameData> loadGameData() async {
    final jsonString = await rootBundle.loadString('assets/chapter.json');
    final jsonMap = jsonDecode(jsonString);
    return GameData.fromJson(jsonMap);
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_gameData == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          // SLIVER APP BAR
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            backgroundColor: backgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Select Chapter",
              style: GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            actions: const [PlayerCurrency(), SizedBox(width: 8)],
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Colors.grey),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Campaign Chapters", style: GoogleFonts.fredoka(fontWeight: FontWeight.w500, fontSize: 28)),
                  const SizedBox(height: 6),
                  Text(
                    "Continue your journey through the Realms",
                    style: GoogleFonts.fredoka(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          // CHAPTER LIST
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final chapter = _gameData!.chapters[index];
                return ChapterContainer(chapter: chapter);
              }, childCount: _gameData!.chapters.length),
            ),
          ),
        ],
      ),
    );
  }
}

class ChapterContainer extends StatelessWidget {
  final Chapter chapter;

  const ChapterContainer({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 450,
        decoration: BoxDecoration(color: chapter.themeColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: Center(child: Icon(chapter.icon, size: 80, color: Colors.white)),
            ),
            Container(
              height: 230,
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chapter.name, style: GoogleFonts.fredoka(fontSize: 28, fontWeight: FontWeight.w600)),
                  Text(chapter.description, style: GoogleFonts.fredoka(fontSize: 14, color: Colors.grey)),
                  Gap(10),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PROGRESS',
                            style: GoogleFonts.fredoka(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '4/10',
                            style: GoogleFonts.fredoka(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 32,
                          size: 12,
                          padding: 0,
                          selectedColor: const Color.fromRGBO(79, 70, 229, 1),
                          unselectedColor: const Color.fromARGB(255, 237, 234, 234),
                          roundedEdges: Radius.circular(10),
                          // selectedGradientColor: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          //   colors: [Colors.yellowAccent, Colors.deepOrange],
                          // ),
                          // unselectedGradientColor: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          //   colors: [Colors.black, Colors.blue],
                          // ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return AnimatedButton(
                        height: 60,
                        width: constraints.maxWidth,
                        color: const Color.fromRGBO(79, 70, 229, 1),
                        borderRadius: 15,
                        onPressed: () {},
                        // onPressed: chapter.isUnlocked
                        //     ? () {
                        //         // Navigate to ACTUAL game screen
                        //       }
                        //     : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.play_arrow, color: Colors.white),
                            SizedBox(width: 10),
                            Text("Resume Play", style: TextStyle(color: Colors.white, fontSize: 18)),
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
