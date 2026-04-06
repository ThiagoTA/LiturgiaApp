import 'package:flutter/widgets.dart';
import 'package:liturgia_app/core/exceptions/app_exceptions.dart';
import 'package:liturgia_app/data/models/liturgy_model.dart';
import 'package:liturgia_app/data/repositories/liturgy_repository.dart';

class LiturgyViewModel extends ChangeNotifier {
  final LiturgyRepository repository;

  LiturgyViewModel(this.repository);

  LiturgyModel? liturgyModel;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadLiturgy({
    required int day,
    required int month,
    int? year,
  }) async {
    if (isLoading) return;

    isLoading = true;
    liturgyModel = null;
    errorMessage = null;
    notifyListeners();

    try {
      liturgyModel = await repository.getLiturgy(
        day: day,
        month: month,
        year: year,
      );
    } on AppException catch (e) {
      liturgyModel = null;
      errorMessage = e.message;
    } catch (_) {
      liturgyModel = null;
      errorMessage = 'Ocorreu um erro inesperado.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> preloadPeriod() async {
    try {
      await repository.getLiturgyForPeriod();
    } catch (e) {}
  }
}
