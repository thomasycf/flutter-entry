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


class NavTwo extends StatefulWidget {
  //const NavTwo({Key? key}) : super(key: key);
  @override
  _NavTwoState createState() => _NavTwoState();
}

class _NavTwoState extends State<NavTwo> {
  final delegate = RootRouterDelegate();
  final parser = DelegateParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
       // theme: basicTheme(),
        routeInformationParser: parser,
        routerDelegate: delegate
    );
  }
}
