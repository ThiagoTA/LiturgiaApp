import 'package:flutter/material.dart';
import 'package:liturgia_app/core/widgets/card/prayer._card.dart';
import 'package:liturgia_app/core/widgets/text/text_empty.dart';
import 'package:liturgia_app/core/widgets/text/text_title_category.dart';
import 'package:liturgia_app/presentation/widgets/builder/liturgy_builder.dart';
import 'package:liturgia_app/presentation/widgets/scroll_safe_area.dart';

class ExtrasTab extends StatefulWidget {
  const ExtrasTab({super.key});

  @override
  State<ExtrasTab> createState() => _ExtrasTabState();
}

class _ExtrasTabState extends State<ExtrasTab> {
  final ScrollController _controller = ScrollController();
  int _expandIndex = -1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LiturgyBuilder(
      builder: (context, liturgy) {
        final extrasList = liturgy.leituras.extras;

        if (extrasList.isEmpty) {
          return const TextEmpty(text: 'Não contém nenhum extra para essa liturgia');
        }

        return ScrollSafeArea(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitleCategory(text: 'Extras'),
              for (var index = 0; index < extrasList.length; index++) ...[
                CardPrayer(
                  title: extrasList[index].titulo,
                  text: extrasList[index].texto,
                  isExpanded: index == _expandIndex,
                  onToggle: () {
                    setState(() {
                      _expandIndex = _expandIndex == index ? -1 : index;
                    });
                  },
                ),
              ]
            ],
          )
        );
      },
    );
  }
}
