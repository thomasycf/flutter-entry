
import 'package:flutter/material.dart';
import 'ui_pages.dart';

class DelegateParser extends RouteInformationParser<PageConfiguration> {
  final String tag = '/router/delegate_parser/---';


  @override
  Future<PageConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    print('$tag parseRouteInformation called... routeInformation = ${routeInformation.location}');
    final uri = Uri.parse(routeInformation.location!);
    print('$tag parseRouteInformation called... uri = ${uri.toString()}');
    if (uri.pathSegments.isEmpty) {
      print('$tag parseRouteInformation called... path is empty');
      return MainLayoutPageConfig;
    //  return FrontPageConfig;
    }

    final path = uri.pathSegments[0];
    print('$tag parseRouteInformation called... path = $path');

    switch (path) {
      case "hello_flutter":
        print("hello flutter uri called");
        return MainLayoutPageConfig;
      // case MainLayoutPath:
      //   return MainLayoutPageConfig;
      case "msgPage":
        return MsgPageConfig;
      case EditVideoPath:
        return EditVideoPageConfig;
      case ChatPath:
        return ChatPageConfig;
      // case LoginPath:
      //   return LoginPageConfig;
      // case CreateAccountPath:
      //   return CreateAccountPageConfig;
      // case ListItemsPath:
      //   return ListItemsPageConfig;
      // case DetailsPath:
      //   return DetailsPageConfig;
      // case CartPath:
      //   return CartPageConfig;
      // case CheckoutPath:
      //   return CheckoutPageConfig;
      // case SettingsPath:
      //   return SettingsPageConfig;
      // case InnerPath:
      //   return InnerPageConfig;
      default:
        return MainLayoutPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.MainLayout:
        return const RouteInformation(location: MainLayoutPath);
      case Pages.EditVideo:
        return const RouteInformation(location: EditVideoPath);
      case Pages.Chat:
        return const RouteInformation(location: ChatPath);
      // case Pages.Login:
      //   return const RouteInformation(location: LoginPath);
      // case Pages.CreateAccount:
      //   return const RouteInformation(location: CreateAccountPath);
      // case Pages.List:
      //   return const RouteInformation(location: ListItemsPath);
      // case Pages.Details:
      //   return const RouteInformation(location: DetailsPath);
      // case Pages.Cart:
      //   return const RouteInformation(location: CartPath);
      // case Pages.Checkout:
      //   return const RouteInformation(location: CheckoutPath);
      // case Pages.Settings:
      //   return const RouteInformation(location: SettingsPath);
      // case Pages.Inner:
      //   return const RouteInformation(location: InnerPath);
      default: return const RouteInformation(location: MainLayoutPath);

    }
  }
}