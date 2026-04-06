import 'package:flutter/material.dart';
import 'package:liturgia_app/core/widgets/dialog/confirm_dialog.dart';

Future<bool?> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String cancelText = 'Cancelar',
  String confirmText = 'Confirmar',
  bool isDanger = false,
  VoidCallback? onCofirm,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (_) => ConfirmDialog(
      title: title,
      message: message,
      isDanger: isDanger,
      onConfirm: onCofirm,
    ),
  );
}
