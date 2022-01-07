import 'package:fizjo/services/user_config_api.dart';
import 'package:flutter/widgets.dart';

class UserConfigProvider extends ChangeNotifier {
  // TODO add model class
  dynamic userConfig;

  void setUserConfig(dynamic value) {
    userConfig = value;
    notifyListeners();
  }

  Future<void> fetchUserConfig() async {
    if (userConfig.isNotEmpty) {
      return Future.value(userConfig);
    }

    dynamic userConfigResponse = await UserConfigApi.fetchUserConfig('token 1x2c3v');
    setUserConfig(userConfigResponse);
  }
}