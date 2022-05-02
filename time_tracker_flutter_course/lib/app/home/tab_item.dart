import 'package:flutter/material.dart';

enum TabItem { jobs, entries, account }

class TabItemData {
  // 'const' define una constante en el tiempo de compilación y es optimizado por el compilador
  const TabItemData({required this.title, required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.jobs: TabItemData(title: 'Jobs', icon: Icons.work),
    TabItem.entries: TabItemData(title: 'Entries', icon: Icons.view_headline),
    TabItem.account: TabItemData(title: 'Account', icon: Icons.person),
  };
}
