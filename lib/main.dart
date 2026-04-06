import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:liturgia_app/core/database/app_database.dart';
import 'package:liturgia_app/core/theme/app_colors.dart';
import 'package:liturgia_app/data/daos/liturgy_dao.dart';
import 'package:liturgia_app/data/daos/settings_dao.dart';
import 'package:liturgia_app/data/repositories/liturgy_repository.dart';
import 'package:liturgia_app/data/repositories/notification_repository.dart';
import 'package:liturgia_app/data/repositories/settings_repository.dart';
import 'package:liturgia_app/data/service/remote/liturgy_service.dart';
import 'package:liturgia_app/core/network/api_client.dart';
import 'package:liturgia_app/core/router/app_router.dart';
import 'package:liturgia_app/presentation/viewmodels/liturgy_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => AppDatabase(),
          dispose: (_, value) => value.close(),
        ),
        Provider(create: (context) => LiturgyDao(context.read<AppDatabase>())),
        Provider(create: (context) => SettingsDao(context.read<AppDatabase>())),
        Provider(create: (_) => ApiClient(http.Client())),
        Provider(
          create: (context) => LiturgyService(context.read<ApiClient>()),
        ),
        Provider(
          create: (_) {
            final repo = NotificationRepository();
            repo.init();
            repo.requestPermission();
            return repo;
          },
        ),
        Provider(
          create: (context) => SettingsRepository(
            context.read<SettingsDao>(),
            context.read<LiturgyDao>(),
            context.read<NotificationRepository>()
          ),
        ),
        Provider(
          create: (context) => LiturgyRepository(
            context.read<LiturgyService>(),
            context.read<LiturgyDao>(),
            context.read<SettingsRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              LiturgyViewModel(context.read<LiturgyRepository>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Times New Roman',
          scaffoldBackgroundColor: AppColors.bgBase,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.bgBase,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
