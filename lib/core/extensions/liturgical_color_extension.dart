import 'package:liturgia_app/data/models/liturgy_color.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';

extension LiturgicalColor on String {
  LiturgyColor toLiturgyColor() {
    switch (toLowerCase()) {
      case 'verde':
        return LiturgyColor(
          primary: AppColors.green,
          background: AppColors.greenBg,
        );
      case 'vermelho':
        return LiturgyColor(
          primary: AppColors.red,
          background: AppColors.redBg,
        );
      case 'roxo':
        return LiturgyColor(
          primary: AppColors.purple,
          background: AppColors.purpleBg,
        );
      case 'rosa':
        return LiturgyColor(
          primary: AppColors.pink,
          background: AppColors.pinkBg,
        );
      case 'branco':
        return LiturgyColor(
          primary: AppColors.white,
          background: AppColors.whiteBg,
        );
      default:
        return LiturgyColor(
          primary: AppColors.white,
          background: AppColors.whiteBg,
        );
    }
  }
}