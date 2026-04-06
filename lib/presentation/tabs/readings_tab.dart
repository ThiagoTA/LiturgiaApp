import 'package:flutter/material.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:liturgia_app/core/widgets/card/reading_card.dart';
import 'package:liturgia_app/core/widgets/text/text_empty.dart';
import 'package:liturgia_app/data/models/reading_model.dart';
import 'package:liturgia_app/core/widgets/text/text_title_category.dart';
import 'package:liturgia_app/presentation/tabs/models/reading_section.dart';
import 'package:liturgia_app/core/extensions/liturgical_color_extension.dart';
import 'package:liturgia_app/presentation/widgets/builder/liturgy_builder.dart';
import 'package:liturgia_app/presentation/widgets/scroll_safe_area.dart';

class ReadingsTab extends StatefulWidget {
  const ReadingsTab({super.key});

  @override
  State<ReadingsTab> createState() => _ReadingsTabState();
}

class _ReadingsTabState extends State<ReadingsTab> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<ReadingSection> _buildSections(
    ReadingModel readingModel,
    Color primaryColor,
    Color bgColor,
  ) {
    final List<ReadingSection> sections = [];

    final primeira = readingModel.primeiraLeitura.isNotEmpty
        ? readingModel.primeiraLeitura.first
        : null;
    final salmo = readingModel.salmo.isNotEmpty
        ? readingModel.salmo.first
        : null;
    final segunda = readingModel.segundaLeitura.isNotEmpty
        ? readingModel.segundaLeitura.first
        : null;
    final evangelho = readingModel.evangelho.isNotEmpty
        ? readingModel.evangelho.first
        : null;

    if (primeira != null) {
      sections.add(
        ReadingSection(
          sectionTitle: 'Primeira Leitura',
          item: primeira,
          bg: AppColors.bgCard,
          referenceColor: primaryColor,
        ),
      );
    }

    if (salmo != null) {
      sections.add(
        ReadingSection(
          sectionTitle: 'Salmo',
          item: salmo,
          isPsalm: true,
          bg: bgColor,
          referenceColor: primaryColor,
          titleColor: primaryColor,
        ),
      );
    }

    if (segunda != null) {
      sections.add(
        ReadingSection(
          sectionTitle: 'Segunda Leitura',
          item: segunda,
          bg: AppColors.bgCard,
          referenceColor: primaryColor,
        ),
      );
    }

    if (evangelho != null) {
      sections.add(
        ReadingSection(
          sectionTitle: 'Evangelho',
          item: evangelho,
          bg: bgColor,
          referenceColor: primaryColor,
          titleColor: primaryColor,
        ),
      );
    }

    return sections;
  }

  @override
  Widget build(BuildContext context) {
    return LiturgyBuilder(
      builder: (context, liturgy) {
        final primaryColor = liturgy.cor.toLiturgyColor().primary;
        final bgColor = liturgy.cor.toLiturgyColor().background;

        final sections = _buildSections(
          liturgy.leituras,
          primaryColor,
          bgColor,
        );

        if (sections.isEmpty) {
          return TextEmpty(text: 'Não contém nenhuma liturgia do dia');
        }

        return ScrollSafeArea(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final section in sections) ...[
                TextTitleCategory(text: section.sectionTitle),
                CardReading(
                  bg: section.bg,
                  isPsalm: section.isPsalm,
                  reference: section.item.referencia,
                  referenceColor: section.referenceColor,
                  title: section.item.displayTitle,
                  titleColor: section.titleColor ?? AppColors.textPrimary,
                  text: section.item.texto,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
