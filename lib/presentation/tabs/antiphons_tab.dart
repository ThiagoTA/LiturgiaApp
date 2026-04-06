import 'package:flutter/material.dart';
import 'package:liturgia_app/core/widgets/text/text_empty.dart';
import 'package:liturgia_app/data/models/antiphons_model.dart';
import 'package:liturgia_app/core/widgets/card/antiphons_card.dart';
import 'package:liturgia_app/core/widgets/text/text_title_category.dart';
import 'package:liturgia_app/presentation/tabs/models/antiphons_section.dart';
import 'package:liturgia_app/presentation/widgets/builder/liturgy_builder.dart';
import 'package:liturgia_app/presentation/widgets/scroll_safe_area.dart';

class AntiphonsTab extends StatefulWidget {
  const AntiphonsTab({super.key});

  @override
  State<AntiphonsTab> createState() => _AntiphonsTabState();
}

class _AntiphonsTabState extends State<AntiphonsTab> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<AntiphonsSection> _buildSections(AntiphonsModel antiphons) {
    return [
      if (antiphons.entrada.trim().isNotEmpty)
        AntiphonsSection(title: 'Entrada', text: antiphons.entrada),
      if (antiphons.comunhao.trim().isNotEmpty)
        AntiphonsSection(title: 'Comunhão', text: antiphons.comunhao),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LiturgyBuilder(
      builder: (context, liturgy) {
        final sections = _buildSections(liturgy.antifonas);

        if (sections.isEmpty) {
          return TextEmpty(text: 'Não contém nenhum antífona do dia');
        }

        return ScrollSafeArea(
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitleCategory(text: 'Antífonas'),
                for (final section in sections) ...[
                  CardAntiphons(title: section.title, text: section.text),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
