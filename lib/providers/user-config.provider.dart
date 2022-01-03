import 'package:fizjo/models/exercise.dart';
import 'package:fizjo/services/user_config_api.dart';
import 'package:flutter/widgets.dart';

class UserConfigProvider extends ChangeNotifier {
  dynamic userConfig;

  void _setUserConfig(dynamic value) {
    userConfig = value;
    notifyListeners();
  }

  Future<dynamic> fetchUserConfig() async {
    if (userConfig.isNotEmpty) {
      return Future.value(userConfig);
    }

    dynamic userConfigResponse = await UserConfigApi.fetchUserConfig('token 1x2c3v');
    _setUserConfig(userConfigResponse);
    return userConfigResponse;
  }
}