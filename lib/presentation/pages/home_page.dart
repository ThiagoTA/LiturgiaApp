import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:liturgia_app/core/utils/time_utils.dart';
import 'package:liturgia_app/core/widgets/text/text_empty.dart';
import 'package:liturgia_app/presentation/tabs/settings_tab.dart';
import 'package:liturgia_app/presentation/widgets/settings_app_bar.dart';
import 'package:provider/provider.dart';

import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:liturgia_app/presentation/tabs/antiphons_tab.dart';
import 'package:liturgia_app/presentation/tabs/extras_tab.dart';
import 'package:liturgia_app/presentation/tabs/prayers_tab.dart';
import 'package:liturgia_app/presentation/tabs/readings_tab.dart';
import 'package:liturgia_app/presentation/widgets/home_app_bar.dart';
import 'package:liturgia_app/presentation/widgets/home_bottom_nav.dart';
import 'package:liturgia_app/presentation/viewmodels/liturgy_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  DateTime now = DateTime.now();
  bool get _dependsOnLiturgy => currentIndex != 4;
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _loadLiturgy();

      if (mounted) {
        await context.read<LiturgyViewModel>().preloadPeriod();
      }

      _subscription = Connectivity().onConnectivityChanged.listen((result) {
        final hasConnection = !result.contains(ConnectivityResult.none);

        if (hasConnection) {
          _reloadIfNeeded();
        }
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _reloadIfNeeded() async {
    final viewModel = context.read<LiturgyViewModel>();

    if (viewModel.errorMessage != null) {
      await _loadLiturgy();
      await viewModel.preloadPeriod();
    }
  }

  Future<void> _loadLiturgy() async {
    await context.read<LiturgyViewModel>().loadLiturgy(
      day: now.day,
      month: now.month,
      year: now.year,
    );
  }

  Future<void> _changeDay(int days) async {
    setState(() {
      now = now.add(Duration(days: days));
    });
    await _loadLiturgy();
  }

  List<Widget> _buildPages(LiturgyViewModel viewModel) {
    return [
      const ReadingsTab(),
      const PrayersTab(),
      const AntiphonsTab(),
      const ExtrasTab(),
      const SettingsTab(),
    ];
  }

  Widget _buildBody(LiturgyViewModel viewModel) {
    final pages = _buildPages(viewModel);

    if (_dependsOnLiturgy && viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.textSecondary),
      );
    }

    if (_dependsOnLiturgy && viewModel.errorMessage != null) {
      return TextEmpty(text: viewModel.errorMessage ?? 'Error Desconhecido');
    }

    return pages[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LiturgyViewModel>();

    return Scaffold(
      extendBody: true,
      appBar: currentIndex != 4
          ? HomeAppBar(
              weekDay: weekDayName(now),
              date: formatDate(now),
              description: viewModel.liturgyModel?.liturgia ?? '',
              onLeftPressed: () => _changeDay(-1),
              onLeftHold: () => _changeDay(-30),
              onRightPressed: () => _changeDay(1),
              onRightHold: () => _changeDay(30),
            )
          : SettingsAppBar(),
      body: _buildBody(viewModel),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
