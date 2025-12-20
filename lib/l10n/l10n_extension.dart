import 'app_localizations.dart';
import '../services/data_service.dart';

extension DynamicLocalizations on AppLocalizations {
  String dynamicString(String key) {
    return DataService.getString(key);
  }
}