import 'package:flutter/material.dart';
import 'package:liturgia_app/data/models/reading_item_model.dart';

class ReadingSection {
  final String sectionTitle;
  final ReadingItemModel item;
  final bool isPsalm;
  final Color bg;
  final Color referenceColor;
  final Color? titleColor;

  ReadingSection({
    required this.sectionTitle,
    required this.item,
    this.isPsalm = false,
    required this.bg,
    required this.referenceColor,
    this.titleColor,
  });

  String get displayTitle {
    if (isPsalm && item.refrao?.trim().isNotEmpty == true) {
      return item.refrao!;
    }
    return item.displayTitle;
  }
}