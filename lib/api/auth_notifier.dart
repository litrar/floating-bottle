// part of '../authentication.dart';



// class AuthNotifier extends ChangeNotifier{
//   final IdentityRepository _identity;
//   final AuthenticateApi _api;

//   bool _signed;

//   bool get signed => _signed;

//   AuthNotifier(this._api,this._identity) : _signed = _identity.userID != null;

//   void logOut() async {
//     await _identity.clear();
//     _signed = false;
//     notifyListeners();
//   }

//   Future<bool> signIn(String email,String password) async {
//     var res = await _api.signIn(email, password);
//     if(!res.isSuccess){
//       return false;
//     }
//     SignInData data = res.data!;
//     if (data.email != null && data.jwt != null && data.userId != null) {
//       await _identity.setEmail(data.email);
//       await _identity.setJwt(data.jwt);
//       await _identity.setUserID(data.userId);
//       _signed = true;
//       notifyListeners();
//       return true;
//     }
//     return false;
//   }
// }

// class AuthNotifierScope extends InheritedNotifier<AuthNotifier>{
//   AuthNotifierScope({required super.child,required super.notifier});
// static AuthNotifier of(BuildContext context) => context
//     .dependOnInheritedWidgetOfExactType<AuthNotifierScope>()!.notifier!;
// }