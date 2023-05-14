import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'gender.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);


  @override
  State<Information> createState() => _InformationState();
}
class _InformationState extends State<Information> {
  late DateTime selectedDateTime;
  var imgUrl = "https://images.app.goo.gl/xE38wS6pmvP5RZwRA";


  Widget build(BuildContext context){
    return Scaffold(
        body: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assetsfolder/information_background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 15,left: 310,bottom: 20),
                      child: TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Gender();
                            },
                          ),
                        );
                      },
                        child: Text("Skip",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),),
                      )
                  ),
                  _picture(),
                  _schoolField(),
                  _cityField(),
                  _birthField(),
                  _continueButton(),
                ],
              )
            ]
        )
    );
  }
  Widget _picture(){
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 100.w, right: 100.w),
        width: 150.w,
        height: 150.h,
        child: InkWell(
          onTap: () async {
            final ImagePicker _picker = ImagePicker();
            final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
            if (image == null) return;
            // var res =
            // await buildContext.read<UserApi>().editAvatar(image.path);
            // if (res.isSuccess) {
            //   await DialogService.show(CustomDialog(title: "更換頭貼成功"));
            // } else
            //   await DialogService.show(
            //       CustomDialog(title: "更換頭貼失敗", content: res.message));
            //rebuild
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Stack(
                children: [
                  Image.asset("assetsfolder/avatar.jpg"),
                  // userInfo.avatar == null
                  //     ? Image.asset("assetfolder/Gray.jpg")
                  //     : Image(
                  //     image: CachedNetworkImageProvider(
                  //         userInfo.avatar!)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 20.h,
                      width: double.maxFinite,
                      color: Colors.black,
                      child: Icon(Icons.photo_camera_outlined,
                          size: 18.sp, color: Colors.blue),
                    ),
                  )
                ],
              )),
        ));
  }
  Widget _schoolField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 100),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.school,size: 30,),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " School",
          hintStyle: TextStyle(fontSize: 22,color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 25),
        ),
        style: TextStyle(
            fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500
        ),
        cursorWidth: 3,
      ),
    );
  }
  Widget _cityField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 20),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 2.3,
            child: Icon(Icons.location_city,size: 30,),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " City",
          hintStyle: TextStyle(fontSize: 22,color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 25),
        ),
        style: TextStyle(
            fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500
        ),
        cursorWidth: 3,
      ),
    );
  }
  Widget _birthField(){
    return Container(
      margin: EdgeInsets.only(left: 25,right: 25,top: 20),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          prefixIcon:
          Align(
            widthFactor: 1.5,
            child: IconButton(
                onPressed: () async {
                  var result = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1923, 01),
                      lastDate: DateTime(2023, 12)
                  );
                  if (result != null) {
                    setState(() {
                      selectedDateTime = result;
                    });
                  };
                },
                icon: Icon(Icons.calendar_month,size: 30,)),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),
          hintText: " Date of birth",
          hintStyle: TextStyle(fontSize: 22,color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.white,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 25),
        ),
        style: TextStyle(
            fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500
        ),
        cursorWidth: 3,
      ),
    );
  }
  Widget _continueButton(){
    return Container(
      margin: EdgeInsets.only(left: 35,right: 35,top: 40,bottom: 40),
      width: 350,
      height: 70,
      child: ElevatedButton(
        child: Text("Continue",style: TextStyle(
            fontSize: 20,color: Colors.white
        ),),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
            )
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Gender();
              },
            ),
          );
        },
      ),
    );
  }
}