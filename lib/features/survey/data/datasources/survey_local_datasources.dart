import 'package:ristu_intern_challenge/core/shared/constant/prefs_key.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';

abstract class SurveyLocalDataSource {
  Future<void> messagesData(String msg);
}

class SurveyLocalDataSourceImpl implements SurveyLocalDataSource {
  SurveyLocalDataSourceImpl(this.prefs);

  final SharedPrefs prefs;

  @override
  @override
  Future<void> messagesData(String msg) async {
    await prefs.putString(PrefsKey.surveyMsg, msg);
  }
}
