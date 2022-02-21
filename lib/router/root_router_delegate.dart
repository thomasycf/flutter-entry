import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/router/ui_pages.dart';


class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  @override
  void initState() {
   print("main layout initState called");
    super.initState();
  }

  _getRouter( BuildContext cxt){
     RootRouterDelegate router = RootRouterDelegate.of(cxt);
    print("nav router tag = ${router.tag}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("this is scaffold page"),),
      body: Column(
      children: [
        Text("this is scaffold body"),
        TextButton(onPressed: ()=>_getRouter(context), child: Text("get Nav2.0 router"))
      ],
      ),
    );
  }
}


class RootRouterDelegate extends RouterDelegate<PageConfiguration>
with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration>{

  static RootRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is RootRouterDelegate, 'Delegate type must match');
    return delegate as RootRouterDelegate;
  }

  final List<Page> _pages = [];
  final String tag = '/lib/router/root_router_delegate/---';
  final  GlobalKey<NavigatorState> _rootNavKey =  GlobalKey<NavigatorState>();
  List<MaterialPage> get pages => List.unmodifiable(_pages);


  @override
  Widget build(BuildContext context) {
    print("Flutter router build called");
    return Navigator(
    //  key: _rootNavKey,//navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState> get navigatorKey => _rootNavKey;

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    print('$tag setNewRoutePath called...');
    _pages.clear();
    addPage(configuration);
    return SynchronousFuture(null);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    print('$tag _onPopPage...');
    print('$tag _onPopPage route = $route');

    print('$tag _onPopPage _pages = $_pages');
    if(_pages.length > 1){
      if(_pages.last.arguments == MainLayoutPageConfig){
        print('$tag _pages stack len > 1 and the current upper page is MainLayout, just swap back and return');
        _pages.insert(_pages.length-1, _pages.removeAt(0));
        print('$tag  _pages after swap = $_pages');
        notifyListeners();
        return false;
      }
    }

    /***
     *  calling --  route.didPop(result) would cause flashing (like  a transit to pop and then undo pop)
     *   seems route.didPop would pop the stack and return true if possible
     *   so put route.didPop after checking last == MainLayout
     */
    final didPop = route.didPop(result);
    print('$tag _onPopPage didPop = $didPop');
    print('$tag _onPopPage page settings = ${route.settings}');
    if (!didPop) {
      return false;
    }

    _pages.remove(route.settings);
    print('$tag _onPopPage _pages after remove = $_pages');
    notifyListeners();
    //return false; // not pop, stop the back button action
    return true; // still pop although not alter _pages[] but cannot see the change until it pop to the bottom to close the app
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
    //    key: Key(pageConfig.key),
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
    print('$tag pages after adding = $_pages');
  }

  void addPage(PageConfiguration pageConfig) {
    print('$tag add page()...pageConfig path= ${pageConfig.path}');
    print('$tag add page()..._pages = $_pages');
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;
    print('$tag add page()...shouldAddPage = $shouldAddPage');
    if(_pages.length>0){
      print('$tag (_pages.last.arguments as PageConfiguration).uiPage = ${(_pages.last.arguments as PageConfiguration).uiPage}');
      print('$tag add page()...pageConfig uiPage= ${pageConfig.uiPage}');
    }

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
         case Pages.MainLayout:
           _addPageData(MainLayout(), MainLayoutPageConfig);
           break;
       //  case Pages.EditVideo:
       //    _addPageData(MyVideosPage(), EditVideoPageConfig);
       //    break;
       //  case Pages.Chat:
       // //    _addPageData(ChatMainPage(), ChatPageConfig);
       //  _addPageData(MainChatPage(), ChatPageConfig);
       //    break;
       //  case Pages.FrontPage:
       //    _addPageData(FrontPage(), pageConfig);
       //        break;


        // case Pages.Upload:
        //   _addPageData(Upload(), LoginPageConfig);
        //   break;
        // case Pages.Chat:
        //   _addPageData(CreateAccount(), CreateAccountPageConfig);
        //   break;
        // case Pages.List:
        //   _addPageData(ListItems(), ListItemsPageConfig);
        //   break;
        // case Pages.Cart:
        //   _addPageData(Cart(), CartPageConfig);
        //   break;
        // case Pages.Checkout:
        //   _addPageData(Checkout(), CheckoutPageConfig);
        //   break;
        // case Pages.Settings:
        //   _addPageData(Settings(), SettingsPageConfig);
        //   break;
        // case Pages.Inner:
        //   _addPageData(Inner(), InnerPageConfig);
        //   break;
        default:
          break;
      }
      notifyListeners();
    }
  }

  void push(PageConfiguration newRoute) {
    print('$tag push()....');
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    print('$tag pushWidget()...');
    _addPageData(child, newRoute);
    print('$tag pushWidget()... pages after push = $_pages');
    notifyListeners();
  }

  void parseRoute(Uri uri) {
    print('$tag parseRoute ... uri = ${uri.toString()}');
    print('$tag parseRoute pages stack = $_pages');
    print('$tag last index arguments= ${_pages.last.arguments}');


    if (uri.pathSegments.isEmpty) {
      setNewRoutePath(FrontPageConfig);
      return;
    }
    print('$tag uri.pathSegments.length = ${uri.pathSegments.length}');
    print('$tag    uri.pathSegments[0] = ${uri.pathSegments[0]}');


    // Handle navapp://deeplinks/details/#
    if (uri.pathSegments.length == 2) {
      print('$tag deeplink segment == 2 ...');
      if (uri.pathSegments[0] == 'details') {
       // pushWidget(Details(int.parse(uri.pathSegments[1])), DetailsPageConfig);
      }
      // Handle navapp://deeplinks/cart
      // switch(uri.pathSegments[0]){
      //   case 'video':
      //     print('$tag this is heading for video post...postId = ${uri.pathSegments[1]}');
      //     final String  _postId = uri.pathSegments[1];
      //     _suggestBloc.add(SuggestShowVideoIntentEvent(_postId));
      //     break;
      // }
    } else if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      print('$tag path = $path');
      switch (path) {
        case 'inbox':
          print('$tag this deeplink heading for Inbox page....');
          print('$tag deeplink parser... pages = $_pages');

          // if(_pages.last.arguments == MainLayoutPageConfig){
          //   print('$tag last.arguments == MainLayoutPageConfig = true');
          //   _mainRouteManager.push(Pages.Inbox);
          // }else{
          //   print('$tag last.arguments == MainLayoutPageConfig = false, so swap the stack...');
          //    _pages.insert(_pages.length-1, _pages.removeAt(0));
          //   _mainRouteManager.pushFromRoot(Pages.Inbox);
          // }



          // print('$tag mainLayout index = ${_pages.indexOf(Pages.MainLayout)}')
          // _pages.insert(_pages.length-1, _pages.removeAt(0));
          // print('$tag deeplink parser... pages after swap = $_pages');

          break;
        case 'chat':
          addPage(ChatPageConfig);
          break;
        case 'splash':
          // replaceAll(SplashPageConfig);
          break;
        case 'login':
          // replaceAll(LoginPageConfig);
          break;
        case 'listItems':
          // replaceAll(ListItemsPageConfig);
          break;
      }
    }
  }

  dispose(){
 //   _mainRouteManager.dispose() ;
  }


}