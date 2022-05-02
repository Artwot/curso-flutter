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
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }
}
