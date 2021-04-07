library tab_widget;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabWidget extends HookWidget {
  TabWidget({
    Key? key,
    required this.tabs,
    required this.tabWidgets,
    this.containerHeight = TabWidget.DEFAULT_CONTAINER_HEIGHT,
  }) : super(key: key) {
    assert(this.tabs.length == this.tabWidgets.length);
  }

  final List<Widget> tabs;
  final List<Widget> tabWidgets;
  final double containerHeight;

  static const double DEFAULT_BORDER_RADIUS = 10.0;
  static const double DEFAULT_CONTAINER_HEIGHT = 45;
  static const DEFAULT_PADDING = const EdgeInsets.all(0.0);

  @override
  Widget build(BuildContext context) {
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
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
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
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: tabWidgets,
            ),
          ),
        ],
      ),
    );
  }
}
