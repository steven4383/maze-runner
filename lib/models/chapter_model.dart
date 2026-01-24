import 'package:flutter/material.dart';

/// --------------------
/// GAME DATA ROOT
/// --------------------
class GameData {
  final String gameTitle;
  final List<Chapter> chapters;

  GameData({required this.gameTitle, required this.chapters});

  factory GameData.fromJson(Map<String, dynamic> json) {
    return GameData(
      gameTitle: json['game_title'],
      chapters: (json['chapters'] as List).map((e) => Chapter.fromJson(e)).toList(),
    );
  }
}

class Chapter {
  final int id;
  final String name;
  final String description;

  /// Converted from hex string "#4CAF50"
  final Color themeColor;

  /// NEW FIELD (below themeColor)
  final IconData icon;

  final String vectorArtAsset;
  final bool isUnlocked;
  final int levelsCompleted;
  final int totalLevels;
  final List<Level> levels;

  Chapter({
    required this.id,
    required this.name,
    required this.description,
    required this.themeColor,
    required this.icon,
    required this.vectorArtAsset,
    required this.isUnlocked,
    required this.levelsCompleted,
    required this.totalLevels,
    required this.levels,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      themeColor: _hexToColor(json['theme_color']),
      icon: _iconFromString(json['icon']),
      vectorArtAsset: json['vector_art_asset'],
      isUnlocked: json['is_unlocked'],
      levelsCompleted: json['levels_completed'],
      totalLevels: json['total_levels'],
      levels: (json['levels'] as List).map((e) => Level.fromJson(e)).toList(),
    );
  }

  /// ---------- Helpers ----------

  static Color _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  static IconData _iconFromString(String iconName) {
    switch (iconName) {
      case 'forest':
        return Icons.park;
      case 'dungeon':
        return Icons.account_tree;
      case 'lava':
        return Icons.local_fire_department;
      case 'ice':
        return Icons.ac_unit;
      case 'sky':
        return Icons.cloud;
      default:
        return Icons.help_outline;
    }
  }
}

class Level {
  final int id;
  final String name;
  final String difficulty;
  final bool isUnlocked;
  final int stars;
  final String? bestTime;

  Level({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.isUnlocked,
    required this.stars,
    this.bestTime,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'],
      name: json['name'],
      difficulty: json['difficulty'],
      isUnlocked: json['is_unlocked'],
      stars: json['stars'],
      bestTime: json['best_time'],
    );
  }
}
