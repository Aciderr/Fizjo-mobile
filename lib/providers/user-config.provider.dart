import 'package:fizjo/services/user_config_api.dart';
import 'package:flutter/widgets.dart';

class UserConfigProvider extends ChangeNotifier {
  // TODO add model class
  dynamic _userConfig;

  void setUserConfig(dynamic value) {
    _userConfig = value;
    notifyListeners();
  }

  Future<void> fetchUserConfig() async {
    if (_userConfig.isNotEmpty) {
      return Future.value(_userConfig);
    }

    dynamic userConfigResponse = await UserConfigApi.fetchUserConfig('token 1x2c3v');
    setUserConfig(userConfigResponse);
  }
}