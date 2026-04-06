import 'package:flutter/material.dart';
import 'package:liturgia_app/core/widgets/text/text_empty.dart';
import 'package:liturgia_app/data/models/liturgy_model.dart';
import 'package:liturgia_app/presentation/viewmodels/liturgy_view_model.dart';
import 'package:provider/provider.dart';

class LiturgyBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, LiturgyModel liturgy) builder;
  final Widget? empty;

  const LiturgyBuilder({
    super.key,
    required this.builder,
    this.empty
  });

  @override
  Widget build(BuildContext context) {
    final liturgy = context.select<LiturgyViewModel, LiturgyModel?>(
      (value) => value.liturgyModel,
    );

    if (liturgy == null) {
      return empty ?? TextEmpty(text: 'Não foi possível carregar');
    }

    return builder(context, liturgy);
  }
}