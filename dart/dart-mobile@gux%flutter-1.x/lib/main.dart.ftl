<#if license??>
${dart.license(license)}
</#if>
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

<#list model.objects as obj>
import '/provider/${obj.name}_provider.dart';
</#list>
import '/design/styles.dart' as styles;

import '/page/${app.name}/home.dart';
import '/page/personal/profile_settings.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(${dart.nameType(app.name)}()));
}

class ${dart.nameType(app.name)} extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ${dart.nameType(app.name)}State();

}

class ${dart.nameType(app.name)}State extends State<${dart.nameType(app.name)}> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  @override
  Widget build(BuildContext context) {
    styles.init(context);
    return MultiProvider(
      providers: [
<#list model.objects as obj>      
        ChangeNotifierProvider(create: (_) => ${dart.nameType(obj.name)}Provider()),
</#list>        
      ],
      child: MaterialApp(
        navigatorObservers: [],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        routes: {
//          '/': (conetxt) => WelcomePage(),
          '/': (context) => MainPage(),
        },
        supportedLocales: const [
          Locale('zh', 'CN'), // 中文
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        builder: EasyLoading.init(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {

  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: false,
        appBar: null,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          indicatorColor: styles.colorPrimary,
          selectedIndex: _currentPageIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home, color: styles.colorTextInverse),
              icon: Icon(Icons.home_outlined, color: styles.colorTextPrimary,),
              label: '首页',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.touch_app, color: styles.colorTextInverse),
              icon: Icon(Icons.touch_app_outlined, color: styles.colorTextPrimary),
              label: '应用',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person, color: styles.colorTextInverse),
              icon: Icon(Icons.person_outlined, color: styles.colorTextPrimary),
              label: '用户',
            ),
          ],
        ),
        body: [Home(), Container(), ProfileSettings()][_currentPageIndex],
      ),
    );
  }

}
