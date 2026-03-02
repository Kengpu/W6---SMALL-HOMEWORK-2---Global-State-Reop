import 'package:homework2/data/repositories/app_setting/app_settings_repository.dart';
import 'package:homework2/model/settings/app_settings.dart';

class MockAppSettingsRepository implements AppSettingsRepository {
  AppSettings _settings = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _settings;
  }

  @override
  Future<void> save(AppSettings settings) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _settings = settings;
  }
}