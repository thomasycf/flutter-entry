import 'package:flutter/material.dart';

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
  const NavTwo({Key? key}) : super(key: key);
  @override
  _NavTwoState createState() => _NavTwoState();
}

class _NavTwoState extends State<NavTwo> {

  final pages = [
    Page(

    ),

    MyPage(
      key: Key('/'),
      name: '/',
      builder: (context) => HomeScreen(),
    ),
    MyPage(
      key: Key('/category/5'),
      name: '/category/5',
      builder: (context) => CategoryScreen(id: 5),
    ),
    MyPage(
      key: Key('/item/15'),
      name: '/item/15',
      builder: (context) => ItemScreen(id: 15),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
