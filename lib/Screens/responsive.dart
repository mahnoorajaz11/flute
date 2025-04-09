import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyResponsive extends StatelessWidget {
  const MyResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200.h,
            width: 150.w,
            color: Colors.blueAccent,),
          screen(0.0300, 0.0300,context),
          Container(
            height: 200.h,
            width: 150.w,
            color: Colors.blueAccent,),
        ],
      ),
    ));
  }
}

Widget screen(double height, double width,BuildContext context){
  return Container(
    height: MediaQuery.of(context).size.height*height,
    width: width,
    color: Colors.black,

  );
}
/*
class MyResponsive extends StatelessWidget {
  const MyResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth<600){
        return const MobileView();
      }
      else{
        return const WebView();
      }
    });
  }
}*/


// class MobileView extends StatelessWidget {
//   const MobileView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.tealAccent,
//       body: Center(child: Text("Mobile View",style: Theme.of(context).textTheme.displayMedium,),),
//     );
//   }
// }
//
// class WebView extends StatelessWidget {
//   const WebView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.cyanAccent,
//       body: Center(child: Text("Web View",style: Theme.of(context).textTheme.displayMedium,),),
//     );
//   }
// }
