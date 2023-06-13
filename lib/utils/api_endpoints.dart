class ApiEndPoints {
  static const String baseUrl = 'https://8a53-36-228-224-90.ngrok-free.app/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'UserIdentity/register';
  final String loginEmail = 'UserIdentity/Login';
  final String accountDetail = 'UserIdentity/AccountDetailInfo';
}
