class ApiEndPoints {
  static const String baseUrl = 'https://f918-140-119-120-6.ngrok-free.app/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'UserIdentity/register';
  final String loginEmail = 'UserIdentity/Login';
  final String accountDetail = 'UserIdentity/AccountDetailInfo';
}
