
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const String MainLayoutPath = '/mainLayout';
const String UploadPath = '/upload';
const String ChatPath = '/chat';
const String MsgPath = '/msg';
const String MapPath = '/map';
const String EditVideoPath = '/editVideo';
const String MyVideosPath = '/myVideos';
const String FrontPagePath = '/frontPage';
const String SearchPagePath = '/searchPage';
const String SendToPath = '/sendTo';
const String LogonPath = '/logon';
const String ShareImgPagePath = '/shareImgPage';

const String MsgPagePath = '/msgPage';
const String TracePagePath = '/tracePage';
const String TopicPagePath = '/topicPage';
const String TopicMsgPagePath = '/topicMsgPage';
const String MyVideoInfoPath = '/myVideoInfo';

// const String CartPath = '/cart';
// const String CheckoutPath = '/checkout';
// const String SettingsPath = '/settings';
// const String InnerPath = '/inner';
// const String InnerFirstPath = '/innerFirst';

enum Pages {
  MainLayout,
  Upload,
  Chat,
  Msg,
  Map,
  MyVideos,
  EditVideo,
  FrontPage,
  MsgPage,
  TopicPage,
  TopicMsgPage,
  MyVideoInfo,
  SendTo,
  Logon,
  ShareImgPage,

  // pages under mainContainer
  Home,
  Profile,
  Library,
  Inbox,
  SearchPage,
  TracePage,
  FromRoot,

  // Cart,
  // Checkout,
  // Settings,
  // NewDialog,
  // Inner,
  // InnerFirst,
}
extension PagesEx on Pages {
  String get inString => describeEnum(this);
}

const String MainLayoutKey = 'MainLayout';
const String UploadKey = 'Upload';
const String ChatKey = 'Chat';
const String MsgKey = 'Msg';
const String MapKey = 'Map';
const String EditVideoKey = 'EditVideo';
const String FrontPageKey = 'FrontPage';
const String SendToKey = 'SendTo';
const String LogonKey = 'Logon';
const String ShareImgPageKey = 'ShareImgPage';

const String TracePageKey = 'TracePage';
const String MsgPageKey = 'MsgPage';
const String TopicPageKey = 'TopicPage';
const String TopicMsgPageKey = 'TopicMsgPage';
const String MyVideoInfoKey = 'MyVideoInfo';



class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;

  const PageConfiguration(
      {required this.key, required this.path, required this.uiPage});
}

const PageConfiguration MainLayoutPageConfig = PageConfiguration(key: MainLayoutKey , path: MainLayoutPath, uiPage: Pages.MainLayout);
const PageConfiguration UploadPageConfig = PageConfiguration(key: UploadKey, path: UploadPath, uiPage: Pages.Upload);
const PageConfiguration ChatPageConfig = PageConfiguration(key: ChatKey, path: ChatPath, uiPage: Pages.Chat);
const PageConfiguration MsgPageConfig = PageConfiguration(key: MsgKey, path: MsgPath, uiPage: Pages.Msg);
const PageConfiguration MapPageConfig = PageConfiguration(key: MapKey, path: MapPath, uiPage: Pages.Map);
const PageConfiguration EditVideoPageConfig = PageConfiguration(key: EditVideoKey, path: EditVideoPath, uiPage: Pages.EditVideo);
const PageConfiguration FrontPageConfig = PageConfiguration(key: FrontPageKey, path: FrontPagePath, uiPage: Pages.FrontPage);
const PageConfiguration SendToConfig = PageConfiguration(key: SendToKey, path: SendToPath, uiPage: Pages.SendTo);
const PageConfiguration LogonConfig = PageConfiguration(key: LogonKey, path: LogonPath, uiPage: Pages.Logon);

const PageConfiguration TracePageConfig = PageConfiguration(key: TracePageKey, path: TracePagePath, uiPage: Pages.TracePage);
const PageConfiguration TopicPageConfig = PageConfiguration(key: TopicPageKey, path: TopicPagePath, uiPage: Pages.TopicPage);
const PageConfiguration TopicMsgPageConfig = PageConfiguration(key: TopicMsgPageKey, path: TopicMsgPagePath, uiPage: Pages.TopicMsgPage);
const PageConfiguration MyVideoInfoPageConfig = PageConfiguration(key: MyVideoInfoKey, path: MyVideoInfoPath, uiPage: Pages.MyVideoInfo);
const PageConfiguration ShareImgPageConfig = PageConfiguration(key: ShareImgPageKey, path: ShareImgPagePath, uiPage: Pages.ShareImgPage);
// const PageConfiguration CheckoutPageConfig = PageConfiguration(
//     key: 'Checkout', path: CheckoutPath, uiPage: Pages.Checkout);
// const PageConfiguration SettingsPageConfig = PageConfiguration(
//     key: 'Settings', path: SettingsPath, uiPage: Pages.Settings);
// const PageConfiguration InnerPageConfig =
// PageConfiguration(key: 'Inner', path: InnerPath, uiPage: Pages.Inner);
// const PageConfiguration InnerFirstConfig =
// PageConfiguration(key: 'InnerFirst', path: InnerFirstPath, uiPage: Pages.InnerFirst);