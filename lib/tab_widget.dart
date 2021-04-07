library tab_widget;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabWidget extends HookWidget {
  static const double DEFAULT_BORDER_RADIUS = 10.0;
  static const DEFAULT_PADDING = const EdgeInsets.all(0.0);
  static const double DEFAULT_CONTAINER_HEIGHT = 45;

  @override
  Widget build(BuildContext context) {
    final tabs = useMemoized(() => [
          Tab(text: "Tab 1"),
          Tab(text: "Tab 2"),
          Tab(text: "Tab 3"),
        ]);

    final ticker = useSingleTickerProvider();
    final tabController =
        useMemoized(() => TabController(length: tabs.length, vsync: ticker));
    final defaultBorderRadius =
        useMemoized(() => BorderRadius.circular(DEFAULT_BORDER_RADIUS));

    useEffect(() {
      return tabController.dispose;
    }, const []);

    return Padding(
      padding: DEFAULT_PADDING,
      child: Column(
        children: [
          Container(
            height: DEFAULT_CONTAINER_HEIGHT,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: defaultBorderRadius,
            ),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                color: Colors.green,
                borderRadius: defaultBorderRadius,
              ),
              tabs: tabs,
            ),
          ),
        ],
      ),
    );
  }
}
