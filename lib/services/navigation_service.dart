import 'package:flutter/material.dart';
import 'package:stay_updated/ui/screens/home/home_view.dart';

class NavigationService{
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.pushNamed(routeName);
    }else{
      return Future.value();
    }

  }
  Future<dynamic> pushToDashBoard(){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> const HomeView()),(route)=>false);
    }else{
      return Future.value();
    }

  }

  Future<dynamic> push(Widget routeWidget){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.push(MaterialPageRoute(builder: (_) => routeWidget));
    }else{
      return Future.value();
    }
  }
  void pop(){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.pop();
    }else{
      // return Future.value();
    }
  }

  Future<dynamic> replace(Widget routeWidget){
    if(navigatorKey.currentState!=null){
      return navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => routeWidget));
    }else{
      return Future.value();
    }

  }

// Future<dynamic> showDialogWidget(DialogType type,{String? title,String? subtitle,void Function()? onTap1,void Function()? onTap2,}){
//   if(navigatorKey.currentState!=null){
//     return showDialog(context: navigatorKey.currentState!.context, builder: (context) => WillPopScope (
//       onWillPop: () async{
//         // _dialogService.dialogComplete();
//         return true;
//       },
//       child: _dialogToReturn(type,title: title,subtitle: subtitle,onTap1: onTap1,onTap2: onTap2),
//     ),
//     );
//   }else{
//     return Future.value();
//   }
// }


}