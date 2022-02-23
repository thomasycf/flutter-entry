import 'package:flutter/material.dart';
import 'package:my_flutter/router/delegate_parser.dart';
import 'package:my_flutter/router/root_router_delegate.dart';

class MyPage extends Page {
  final String title;
  MyPage({
    required this.title,
  }) : super(key: ValueKey(title));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return  Scaffold(appBar: AppBar(title: Text(title),),);
      },
    );
  }
}

class BackBtnHandler extends BackButtonDispatcher{

  @override
  Future<bool> invokeCallback(Future<bool> defaultValue) {
    print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
return Future.value(true);
  }

  @override
  void takePriority() {
    print("CCCCCCCCCCCCCCCCCCCCCCCCCC");
  }


}

class NavTwo extends StatefulWidget {
  //const NavTwo({Key? key}) : super(key: key);
  @override
  _NavTwoState createState() => _NavTwoState();
}



class _NavTwoState extends State<NavTwo> {
  final delegate = RootRouterDelegate();
  final parser = DelegateParser();
  final handler = BackBtnHandler();

  Future<bool>  cb(){
    print("CBCBCBCBCBCBCBCBCB");
    return Future.value(true);
  }

  @override
  void initState() {
    handler.addCallback(cb);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        backButtonDispatcher: handler,
        debugShowCheckedModeBanner: false,
       // theme: basicTheme(),
        routeInformationParser: parser,
        routerDelegate: delegate
    );
  }
}
