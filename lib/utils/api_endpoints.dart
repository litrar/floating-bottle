class ApiEndPoints {
  static const String baseUrl =
      'https://4f32-36-229-145-95.ngrok-free.app/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'UserIdentity/register';
  final String loginEmail = 'UserIdentity/Login';
  final String accountDetail = 'UserIdentity/AccountDetailInfo';
}
