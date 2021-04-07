import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_tab_widget/tab_widget.dart' as tab_widget;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tab Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Tab Widget'),
    );
  }
}

class MyHomePage extends HookWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  static const String DEFAULT_TITLE = "";
  static const double DEFAULT_PADDING = 8.0;
  static const int totalTabs = 3;

  final String? title;
  final _tabWidgetPadding = const EdgeInsets.all(DEFAULT_PADDING);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title ?? DEFAULT_TITLE),
      ),
      body: Center(
        child: Padding(
          padding: _tabWidgetPadding,
          child: tab_widget.TabWidget(
            tabs: List<Widget>.generate(
                totalTabs, (index) => Tab(text: "Tab ${index + 1}")),
            tabWidgets: List<Widget>.generate(
                totalTabs, (index) => Center(child: Text("Tab ${index + 1}"))),
          ),
        ),
      ),
    );
  }
}
