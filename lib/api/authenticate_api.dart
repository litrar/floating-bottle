
// part of '../authentication.dart';


// abstract class AuthenticateApi{

//   Future<HttpRes> register(RegisterData data);

//   Future<HttpRes<SignInData>> signIn(String email,String password);

//   factory AuthenticateApi(Dio httpClient) =>  _AuthenticateApi(httpClient);

// }


// class RegisterData {
//   // required
//   final String email;
//   final String password;
//   final String accountName;
//   final DateTime birthDay;
//   final Gender gender;
//   final String department;
//   final String college;

//   // optional
//   String? phone;
//  // String realName = "";
//   String? avatar;
//   String? realName;

//   RegisterData(
//       this.email,
//       this.password,
//       this.accountName,
//       this.birthDay,
//       this.gender,
//       this.college,
//       this.department,
//   {
//    this.phone,this.avatar,this.realName
//   });


//   FormData toFormData(){
//     return FormData.fromMap({
//       "NccuEmail": email,
//       "Password": password,
//       "AccountName": accountName,
//       "Birthday": birthDay.toIso8601String(),
//       "Gender": gender.id,
//       "College": college,
//       "Department": department,
//       "Phone": phone,
//       "RealName": realName,
//       "Avatar": avatar
//     });
//   }


//   @override
//   String toString() {
//     return json.encode({
//       "NccuEmail": email,
//       "Password": password,
//       "AccountName": accountName,
//       "Birthday": birthDay.toIso8601String(),
//       "Gender": gender.id,
//       "College": college,
//       "Department": department,
//       "Phone": phone,
//       "RealName": realName,
//       "Avatar": avatar
//     });
//   }

// }


// class SignInData {

//   String? email,userId,role;
//   JWT? jwt;

//   SignInData(Map<String,dynamic> jsonMap):
//         email = jsonMap["email"],
//         userId = jsonMap["userId"],
//         role = jsonMap["role"],
//         jwt =  JWT.fromJson( jsonMap);

//   static SignInData fromJson(Map<String,dynamic> jsonMap){
//     return SignInData(jsonMap);
//   }

// }