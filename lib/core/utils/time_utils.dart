import 'package:intl/intl.dart';
import 'package:liturgia_app/core/exceptions/app_exceptions.dart';

String formatHourMinute(int hour, int minute) {
  final h = hour.toString().padLeft(2, '0');
  final m = minute.toString().padLeft(2, '0');
  return '$h:$m';
}

String formatDate(DateTime date) {
  final formatted = DateFormat('d MMM y', 'pt_BR').format(date);
  return formatted[0].toUpperCase() + formatted.substring(1);
}

String weekDayName(DateTime date) {
  const names = {
    DateTime.sunday: 'Domingo',
    DateTime.monday: 'Segunda-Feira',
    DateTime.tuesday: 'Terça-Feira',
    DateTime.wednesday: 'Quarta-Feira',
    DateTime.thursday: 'Quinta-Feira',
    DateTime.friday: 'Sexta-Feira',
    DateTime.saturday: 'Sábado',
  };
  return names[date.weekday] ?? '';
}

String buildDateKey({required int day, required int month, int? year}) {
  final resolvedYear = year ?? DateTime.now().year;

  final dd = day.toString().padLeft(2, '0');
  final mm = month.toString().padLeft(2, '0');
  final yyyy = resolvedYear.toString();

  return '$yyyy-$mm-$dd';
}

String normalizeApiDate(String apiDate) {
  final parts = apiDate.split('/');

  if (parts.length != 3) {
    throw ParseException('Formato de data inválido: $apiDate');
  }

  final day = int.parse(parts[0]);
  final month = int.parse(parts[1]);
  final year = int.parse(parts[2]);

  return buildDateKey(day: day, month: month, year: year);
}