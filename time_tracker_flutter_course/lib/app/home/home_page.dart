import 'package:flutter/material.dart';
import 'cupertino_home_scaffold.dart';

import 'tab_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.jobs;

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
    );
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }
}
