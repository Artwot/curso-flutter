import 'package:flutter/material.dart';
import '/app/home/account/account_page.dart';
import '/app/home/cupertino_home_scaffold.dart';
import 'jobs/jobs_page.dart';
import 'tab_item.dart';

/*
  - Almacena la pestaña actual
  - Sabe como construir el contenido de cada pestaña
*/

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.jobs;

// Declarar 'navigatorKeys' para acceder al estado del navigator
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.jobs: GlobalKey<NavigatorState>(),
    TabItem.entries: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>(),
  };

  // Declarar los widgets para cada pestaña del BottomNavigation
  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.jobs: (_) => JobsPage(),
      TabItem.entries: (_) => Container(),
      TabItem.account: (_) => AccountPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope controla el botón de 'atrás' en Android, es usado con global
    // keys para controlar cada pila de navegación
    return WillPopScope(
      onWillPop: () async => !await navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }
}
