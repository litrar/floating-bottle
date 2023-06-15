class ApiEndPoints {
  static const String baseUrl = 'https://661b-2404-0-8028-a024-898e-ef78-f721-e5be.ngrok-free.app/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'UserIdentity/register';
  final String loginEmail = 'UserIdentity/Login';
  final String accountDetail = 'UserIdentity/AccountDetailInfo';
}
