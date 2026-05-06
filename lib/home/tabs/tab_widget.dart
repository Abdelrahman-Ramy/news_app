import 'package:flutter/material.dart';
import 'package:news_app/home/tabs/tab_item.dart';
import 'package:news_app/model/source_response.dart';

class TabWidget extends StatefulWidget {
  final List<Source> sourceList;

  const TabWidget({required this.sourceList, super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: widget.sourceList
                .map(
                  (source) => TabItem(
                    isSelected:
                        selectedIndex == widget.sourceList.indexOf(source),
                    source: source,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
