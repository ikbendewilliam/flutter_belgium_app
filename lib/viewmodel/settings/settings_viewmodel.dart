import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/repo/login/login_repo.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class SettingsViewmodel extends ChangeNotifierEx {
  final MainNavigator _mainNavigator;
  final LoginRepository _loginRepo;

  SettingsViewmodel(
    this._mainNavigator,
    this._loginRepo,
  );

  Future<void> init() async {}

  Future<void> onDeleteAccountTapped() async {
    final result = await _mainNavigator.showDeleteAccountDialog();
    if (result != true) return;
    await _loginRepo.deleteUser();
    _mainNavigator.goToLoginScreen();
  }

  Future<void> onSignOutTapped() async {
    final result = await _mainNavigator.showLogoutDialog();
    if (result != true) return;
    await _loginRepo.logout();
    _mainNavigator.goToLoginScreen();
  }
}
