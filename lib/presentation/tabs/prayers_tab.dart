import 'package:flutter/material.dart';
import 'package:liturgia_app/core/extensions/liturgical_color_extension.dart';
import 'package:liturgia_app/core/widgets/card/prayer._card.dart';
import 'package:liturgia_app/core/widgets/text/text_empty.dart';
import 'package:liturgia_app/data/models/prayer_model.dart';
import 'package:liturgia_app/core/widgets/text/text_title_category.dart';
import 'package:liturgia_app/presentation/tabs/models/prayer_section.dart';
import 'package:liturgia_app/presentation/widgets/builder/liturgy_builder.dart';
import 'package:liturgia_app/presentation/widgets/scroll_safe_area.dart';

class PrayersTab extends StatefulWidget {
  const PrayersTab({super.key});

  @override
  State<PrayersTab> createState() => _PrayersTabState();
}

class _PrayersTabState extends State<PrayersTab> {
  final ScrollController _controller = ScrollController();
  int _expandedIndex = -1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<PrayerSection> _buildSections(PrayerModel prayer) {
    return [
      if (prayer.coleta.trim().isNotEmpty)
        PrayerSection(title: 'Oração da Coleta', text: prayer.coleta),
      if (prayer.oferendas.trim().isNotEmpty)
        PrayerSection(title: 'Oração das Oferendas', text: prayer.oferendas),
      if (prayer.comunhao.trim().isNotEmpty)
        PrayerSection(title: 'Oração da Comunhão', text: prayer.comunhao),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LiturgyBuilder(
      builder: (context, liturgy) {
        final sections = _buildSections(liturgy.oracoes);
        final bgColor = liturgy.cor.toLiturgyColor().background;

        final extraList = liturgy.leituras.extras;

        if (sections.isEmpty && extraList.isEmpty) {
          return TextEmpty(text: 'Não contém nenhuma oração do dia');
        }

        return ScrollSafeArea(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextTitleCategory(text: 'Orações da Missa'),
              for (var index = 0; index < sections.length; index++) ...[
                CardPrayer(
                  title: sections[index].title,
                  text: sections[index].text,
                  isExpanded: index == _expandedIndex,
                  onToggle: () {
                    setState(() {
                      _expandedIndex = _expandedIndex == index ? -1 : index;
                    });
                  },
                ),
              ],
              if (extraList.isNotEmpty) const TextTitleCategory(text: 'Extras'),
              for (
                var extraIndex = 0;
                extraIndex < extraList.length;
                extraIndex++
              ) ...[
                CardPrayer(
                  title: extraList[extraIndex].titulo,
                  text: extraList[extraIndex].texto,
                  reference: extraList[extraIndex].referencia ?? '',
                  type: extraList[extraIndex].tipo ?? '',
                  bgColor: bgColor,
                  isExpanded: (sections.length + extraIndex) == _expandedIndex,
                  onToggle: () {
                    setState(() {
                      final globalIndex = sections.length + extraIndex;
                      _expandedIndex = _expandedIndex == globalIndex
                          ? -1
                          : globalIndex;
                    });
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
