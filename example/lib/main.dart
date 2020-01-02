/*
 * @Description: 
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-03 11:40:15
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-02 17:44:34
*/

import './common/common.dart';
import './config/index.dart';
import './splash_page.dart';
import './pages/user/user_login.dart';
import './pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff0f2f5),
      ),
      navigatorKey: LqrRouter.navKey,
      home: LqrBackDesktop(
        builder: (scaffoldCtx) {
          // [设置全局路由默认过度动画]
          LqrRouter.transition = LqrRouterTransition.cupertino;
          Lqr.ui = Lqr(designWidth: Config.screenWidth, designHeight: Config.screenHeight, scaffoldCtx: scaffoldCtx, primaryColor: LqrColor.red)..init(scaffoldCtx);
          LqrAppBarTheme.ui = LqrAppBarTheme(gradient: LqrGradient.linear45(LqrColor.redG), textColor: Colors.white);
          LqrButtonTheme.ui = LqrButtonTheme(type: LqrButtonType.redGradient);
          // return Store.value<IndexStore>(context).showSplash ? SplashPage() : Store.value<IndexStore>(context).token == '0' ? UserLogin() : HomePage();
          return HomePage();
        },
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    return LqrError();
  };

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  await SpUtil.getInstance();

  Provider.debugCheckInvalidValueType = null;
  final indexStore = IndexStore();
  indexStore.token = SpUtil.getString('token', defValue: '0');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: indexStore),
      ],
      child: MyApp(),
    ),
  );
}
