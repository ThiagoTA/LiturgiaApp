import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:liturgia_app/core/utils/app_info.dart';
import 'package:liturgia_app/core/utils/time_utils.dart';
import 'package:liturgia_app/core/widgets/badge/date_bagde.dart';
import 'package:liturgia_app/core/widgets/card/settings_card.dart';
import 'package:liturgia_app/core/widgets/dialog/dialogs.dart';
import 'package:liturgia_app/core/widgets/text/text_title_category.dart';
import 'package:liturgia_app/data/repositories/settings_repository.dart';
import 'package:liturgia_app/presentation/widgets/builder/settings_builder.dart';
import 'package:liturgia_app/presentation/widgets/scroll_safe_area.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final ScrollController _controller = ScrollController();
  String _appVersion = '';

  @override
  void initState() {
    super.initState();

    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final version = await AppInfo.version();
    if (!mounted) return;

    setState(() {
      _appVersion = version;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> buildSavedDaysChips({
    required int days,
    required bool isFuture,
  }) {
    final now = DateTime.now();

    return List.generate(days + 1, (index) {
      final date = isFuture
          ? now.add(Duration(days: index))
          : now.subtract(Duration(days: days - index));

      final isToday =
          date.day == now.day &&
          date.month == now.month &&
          date.year == now.year;

      final formatted =
          '${date.day.toString().padLeft(2, '0')}/'
          '${date.month.toString().padLeft(2, '0')}';

      return DateBagde(
        text: formatted,
        textColor: isToday
            ? AppColors.green
            : isFuture
            ? AppColors.pink
            : AppColors.purple,
        bg: isToday
            ? AppColors.greenBg
            : isFuture
            ? AppColors.pinkBg
            : AppColors.purpleBg,
      );
    });
  }

  Future<void> _pickNotificationTime(
    BuildContext context, {
    required int hour,
    required int minute,
  }) async {
    final repository = context.read<SettingsRepository>();

    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: hour, minute: minute),
    );

    if (picked == null) return;

    await repository.updateDailyNotificationTime(
      hour: picked.hour,
      minute: picked.minute,
    );
  }

  Widget buildSavedDaysWrap({required int days, required bool isFuture}) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 8,
        runSpacing: 6,
        children: buildSavedDaysChips(days: days, isFuture: isFuture),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBuilder(
      builder: (context, settings) {
        final repository = context.read<SettingsRepository>();

        return ScrollSafeArea(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitleCategory(text: 'Leitura'),

              SettingsCard(
                title: 'Tamanho da fonte',
                text:
                    'Ajuste o tamanho do texto das leituras, orações, antífonas e extras.',
                isStepper: true,
                value: settings.fontSize,
                onDecrease: repository.decreaseFontSize,
                onIncrease: repository.increaseFontSize,
              ),

              SettingsCard(
                title: 'Modo leitura contínua',
                text: 'Exibe leituras já expandidas ao abrir.',
                isSwitch: true,
                check: settings.continuousReading,
                onCheck: repository.updateContinuousReading,
              ),

              SettingsCard(
                title: 'Mostrar referência bíblica',
                text: 'Exibe capítulo e versículo em destaque.',
                isSwitch: true,
                check: settings.biblicalReference,
                onCheck: repository.updateBiblicalReference,
              ),

              TextTitleCategory(text: 'Cache das liturgias'),

              SettingsCard(
                title: 'Dias salvos anteriores',
                text: 'Liturgias passadas mantidas offline.',
                isStepper: true,
                value: settings.previousDays,
                onDecrease: repository.decreasePreviousDays,
                onIncrease: repository.increasePreviousDays,
                child: buildSavedDaysWrap(
                  days: settings.previousDays,
                  isFuture: false,
                ),
              ),

              SettingsCard(
                title: 'Dias salvos futuros',
                text: 'Liturgias futuras pré-carregadas offline.',
                isStepper: true,
                value: settings.futureDays,
                onDecrease: repository.decreaseFutureDays,
                onIncrease: repository.increaseFutureDays,
                child: buildSavedDaysWrap(
                  days: settings.futureDays,
                  isFuture: true,
                ),
              ),

              TextTitleCategory(text: 'Notificação'),

              SettingsCard(
                title: 'Lembrete diário',
                text: 'Receba uma notificação diária da liturgia',
                isSwitch: true,
                check: settings.dailyNotificationEnabled,
                onCheck: repository.updateDailyNotificationEnabled,
              ),

              SettingsCard(
                title: 'Horário do lembrete',
                text: 'Escolha o horário da notificação diária',
                isTimePicker: true,
                timeText: formatHourMinute(
                  settings.dailyNotificationHour,
                  settings.dailyNotificationMinute,
                ),
                onTap: () {
                  _pickNotificationTime(
                    context,
                    hour: settings.dailyNotificationHour,
                    minute: settings.dailyNotificationMinute,
                  );
                },
              ),

              TextTitleCategory(text: 'Dados'),

              SettingsCard(
                title: 'Limpar cache',
                text:
                    'Remove liturgias salvas offline. Serão rebaixadas ao abrir.',
                textColor: AppColors.textRed,
                bg: AppColors.bgRedCard,
                icon: FontAwesomeIcons.trashCan,
                onTap: () {
                  showConfirmDialog(
                    context,
                    title: 'Limpar cache?',
                    message:
                        'Todas as liturgias salvas offline serão removidas. Elas serão rebaixadas ao serem abertas novamente.',
                    confirmText: 'Limpar cache',
                    isDanger: true,
                    onCofirm: repository.clearLiturgy,
                  );
                },
              ),

              SettingsCard(
                title: 'Redefinir preferências',
                text: 'Restaura todas as configurações para o padrão.',
                textColor: AppColors.textRed,
                bg: AppColors.bgRedCard,
                icon: FontAwesomeIcons.rotate,
                onTap: () {
                  showConfirmDialog(
                    context,
                    title: 'Redefinir preferências?',
                    message:
                        'Todas as suas configurações serão restauradas para o padrão. Esta ação não pode ser desfeita.',
                    confirmText: 'Limpar cache',
                    isDanger: true,
                    onCofirm: repository.resetSettings,
                  );
                },
              ),

              TextTitleCategory(text: 'Sobre'),

              SettingsCard(title: 'Versão do app', text: 'Liturgia Diária', version: _appVersion),

              SettingsCard(title: 'Fonte dos dados', text: 'Liturgia Romana conforme Missal de Paulo VI'),
            ],
          ),
        );
      },
    );
  }
}
