import 'dart:io';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  if (args.isEmpty) {
    print('');
    print('╔══════════════════════════════════════════╗');
    print('║      flutter_file_struct  v1.0.0         ║');
    print('║   Auto Flutter Project Structure Setup   ║');
    print('╚══════════════════════════════════════════╝');
    print('');
    print('Usage:');
    print('  dart run flutter_file_struct <project_name>');
    print('');
    print('Example:');
    print('  dart run flutter_file_struct myapp');
    print('');
    return;
  }

  final projectName = args[0];
  final base = Directory.current.path;
  final projectPath = p.join(base, projectName);

  print('');
  print('╔══════════════════════════════════════════╗');
  print('║      flutter_file_struct  v1.0.0         ║');
  print('╚══════════════════════════════════════════╝');
  print('');
  print('🚀 Setting up Flutter structure for: $projectName');
  print('📁 Location: $projectPath');
  print('');

  // ─── 1. Create all folders ───────────────────────────────────────
  final folders = [
    'lib/core/constants',
    'lib/core/errors',
    'lib/core/extensions',
    'lib/core/theme',
    'lib/core/utils',
    'lib/data/models',
    'lib/data/repositories',
    'lib/data/services',
    'lib/presentation/screens',
    'lib/presentation/widgets',
    'lib/presentation/routes',
    'assets/images',
    'assets/icons',
    'assets/fonts',
    'assets/animations',
  ];

  print('📂 Creating folder structure...');
  for (final folder in folders) {
    final dir = Directory(p.join(projectPath, folder));
    dir.createSync(recursive: true);
    print('   ✅ $folder/');
  }
  print('');

  // ─── 2. Create lib files ─────────────────────────────────────────
  print('📝 Creating lib files...');

  _writeFile(projectPath, 'lib/main.dart', _mainDart(projectName));
  _writeFile(projectPath, 'lib/core/constants/app_constants.dart', _appConstants(projectName));
  _writeFile(projectPath, 'lib/core/constants/app_colors.dart', _appColors());
  _writeFile(projectPath, 'lib/core/constants/app_text_styles.dart', _appTextStyles());
  _writeFile(projectPath, 'lib/core/errors/app_exception.dart', _appException());
  _writeFile(projectPath, 'lib/core/extensions/string_extension.dart', _stringExtension());
  _writeFile(projectPath, 'lib/core/extensions/context_extension.dart', _contextExtension());
  _writeFile(projectPath, 'lib/core/theme/app_theme.dart', _appTheme());
  _writeFile(projectPath, 'lib/core/utils/logger.dart', _logger());
  _writeFile(projectPath, 'lib/core/utils/helpers.dart', _helpers());
  _writeFile(projectPath, 'lib/data/models/base_model.dart', _baseModel());
  _writeFile(projectPath, 'lib/data/repositories/base_repository.dart', _baseRepository());
  _writeFile(projectPath, 'lib/data/services/api_service.dart', _apiService());
  _writeFile(projectPath, 'lib/presentation/routes/app_routes.dart', _appRoutes());
  _writeFile(projectPath, 'lib/presentation/screens/home_screen.dart', _homeScreen(projectName));
  _writeFile(projectPath, 'lib/presentation/widgets/common_button.dart', _commonButton());
  print('');

  // ─── 3. Assets placeholder files ─────────────────────────────────
  print('🖼️  Creating assets placeholders...');
  _writeFile(projectPath, 'assets/images/.gitkeep', '');
  _writeFile(projectPath, 'assets/icons/.gitkeep', '');
  _writeFile(projectPath, 'assets/fonts/.gitkeep', '');
  _writeFile(projectPath, 'assets/animations/.gitkeep', '');
  print('');

  // ─── 4. pubspec.yaml ─────────────────────────────────────────────
  print('📦 Setting up pubspec.yaml...');
  _writeFile(projectPath, 'pubspec.yaml', _pubspecYaml(projectName));
  print('');

  // ─── 5. analysis_options.yaml ────────────────────────────────────
  _writeFile(projectPath, 'analysis_options.yaml', _analysisOptions());
  print('');

  // ─── Done ─────────────────────────────────────────────────────────
  print('╔══════════════════════════════════════════════════╗');
  print('║  ✅  Setup complete! Next steps:                 ║');
  print('╠══════════════════════════════════════════════════╣');
  print('║  1.  cd $projectName                             ');
  print('║  2.  flutter pub get                             ║');
  print('║  3.  flutter run                                 ║');
  print('╚══════════════════════════════════════════════════╝');
  print('');
}

// ─── Helper ──────────────────────────────────────────────────────────────────
void _writeFile(String base, String relative, String content) {
  final file = File(p.join(base, relative));
  file.writeAsStringSync(content);
  print('   ✅ $relative');
}

// ═════════════════════════════ FILE TEMPLATES ════════════════════════════════

String _mainDart(String name) => """
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$name',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
""";

String _appConstants(String name) => """
class AppConstants {
  AppConstants._();

  static const String appName = '$name';
  static const String appVersion = '1.0.0';
  static const String baseUrl = 'https://api.example.com';
  static const Duration timeoutDuration = Duration(seconds: 30);
}
""";

String _appColors() => """
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary        = Color(0xFF6200EE);
  static const Color primaryVariant = Color(0xFF3700B3);
  static const Color secondary      = Color(0xFF03DAC6);

  static const Color background     = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surface        = Color(0xFFFFFFFF);
  static const Color surfaceDark    = Color(0xFF1E1E1E);

  static const Color textPrimary    = Color(0xFF212121);
  static const Color textSecondary  = Color(0xFF757575);
  static const Color textLight      = Color(0xFFFFFFFF);

  static const Color error          = Color(0xFFB00020);
  static const Color success        = Color(0xFF4CAF50);
  static const Color warning        = Color(0xFFFFC107);
  static const Color info           = Color(0xFF2196F3);
}
""";

String _appTextStyles() => """
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading1 = TextStyle(
    fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimary);

  static const TextStyle heading2 = TextStyle(
    fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.textPrimary);

  static const TextStyle heading3 = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.textPrimary);

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.textPrimary);

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.textSecondary);

  static const TextStyle caption = TextStyle(
    fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.textSecondary);
}
""";

String _appException() => """
class AppException implements Exception {
  final String message;
  final int? statusCode;
  const AppException({required this.message, this.statusCode});

  @override
  String toString() => 'AppException: \$message (code: \$statusCode)';
}

class NetworkException extends AppException {
  const NetworkException({required super.message, super.statusCode});
}

class CacheException extends AppException {
  const CacheException({required super.message});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException()
      : super(message: 'Unauthorized', statusCode: 401);
}
""";

String _stringExtension() => r"""
extension StringExtension on String {
  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  bool get isValidEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get isValidPhone =>
      RegExp(r'^(\+880|880|0)?1[3-9]\d{8}$').hasMatch(this);

  String get clean => trim().replaceAll(RegExp(r'\s+'), ' ');

  bool get toBool => toLowerCase() == 'true' || this == '1';
}
""";

String _contextExtension() => """
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenWidth  => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  ThemeData   get theme       => Theme.of(this);
  TextTheme   get textTheme   => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void pop([dynamic result]) => Navigator.of(this).pop(result);

  Future<T?> push<T>(Widget page) => Navigator.of(this).push<T>(
        MaterialPageRoute(builder: (_) => page),
      );

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }
}
""";

String _appTheme() => """
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
          error: AppColors.error,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textLight,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textLight,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surfaceDark,
          error: AppColors.error,
        ),
        scaffoldBackgroundColor: AppColors.backgroundDark,
      );
}
""";

String _logger() => """
import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static void info(String msg)    { if (kDebugMode) print('ℹ️  [INFO] \$msg'); }
  static void success(String msg) { if (kDebugMode) print('✅ [SUCCESS] \$msg'); }
  static void warning(String msg) { if (kDebugMode) print('⚠️  [WARN] \$msg'); }

  static void error(String msg, [Object? err, StackTrace? stack]) {
    if (kDebugMode) {
      print('❌ [ERROR] \$msg');
      if (err != null)   print('   Error: \$err');
      if (stack != null) print('   Stack: \$stack');
    }
  }
}
""";

String _helpers() => """
import 'package:flutter/material.dart';

class AppHelpers {
  AppHelpers._();

  static String formatDate(DateTime date) =>
      '\${date.day.toString().padLeft(2, '0')}/'
      '\${date.month.toString().padLeft(2, '0')}/'
      '\${date.year}';

  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  static void hideLoading(BuildContext context) => Navigator.of(context).pop();
}
""";

String _baseModel() => """
abstract class BaseModel {
  Map<String, dynamic> toJson();

  @override
  String toString() => toJson().toString();
}
""";

String _baseRepository() => """
import '../../../core/errors/app_exception.dart';

abstract class BaseRepository {
  Future<T> safeCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
""";

String _apiService() => """
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/app_constants.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/logger.dart';

class ApiService {
  final String baseUrl;
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept':        'application/json',
  };

  ApiService({this.baseUrl = AppConstants.baseUrl});

  void setAuthToken(String token) =>
      _headers['Authorization'] = 'Bearer \$token';

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      AppLogger.info('GET \$baseUrl\$endpoint');
      final res = await http
          .get(Uri.parse('\$baseUrl\$endpoint'), headers: _headers)
          .timeout(AppConstants.timeoutDuration);
      return _handle(res);
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    try {
      AppLogger.info('POST \$baseUrl\$endpoint');
      final res = await http
          .post(Uri.parse('\$baseUrl\$endpoint'),
              headers: _headers, body: jsonEncode(body))
          .timeout(AppConstants.timeoutDuration);
      return _handle(res);
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }

  Map<String, dynamic> _handle(http.Response res) {
    final data = jsonDecode(res.body) as Map<String, dynamic>;
    if (res.statusCode >= 200 && res.statusCode < 300) return data;
    throw AppException(
        message: data['message'] ?? 'Unknown error',
        statusCode: res.statusCode);
  }
}
""";

String _appRoutes() => """
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const HomeScreen(),
      };
}
""";

String _homeScreen(String name) => """
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$name')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 80),
            SizedBox(height: 16),
            Text(
              'Welcome to $name!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Your project is ready 🚀'),
          ],
        ),
      ),
    );
  }
}
""";

String _commonButton() => """
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final double? width;

  const CommonButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? const SizedBox(
            height: 20, width: 20,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
          )
        : Text(label);

    return SizedBox(
      width: width ?? double.infinity,
      height: 48,
      child: isOutlined
          ? OutlinedButton(onPressed: onPressed, child: child)
          : ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}
""";

String _pubspecYaml(String name) => """
name: $name
description: A Flutter application.
version: 1.0.0+1

environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter

  # UI
  cupertino_icons: ^1.0.8

  # State Management
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5

  # Navigation
  go_router: ^14.2.0

  # Networking
  http: ^1.2.2
  dio: ^5.6.0

  # Local Storage
  shared_preferences: ^2.3.2
  hive_flutter: ^1.1.0

  # Utilities
  get_it: ^8.0.0
  intl: ^0.19.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  build_runner: ^2.4.11

flutter:
  uses-material-design: true

  assets:
    - assets/images/
    - assets/icons/
    - assets/animations/

  # fonts:
  #   - family: YourFont
  #     fonts:
  #       - asset: assets/fonts/YourFont-Regular.ttf
  #       - asset: assets/fonts/YourFont-Bold.ttf
  #         weight: 700
""";

String _analysisOptions() => """
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    - prefer_const_constructors
    - prefer_const_widgets
    - avoid_print
    - use_key_in_widget_constructors
    - prefer_single_quotes

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
""";
