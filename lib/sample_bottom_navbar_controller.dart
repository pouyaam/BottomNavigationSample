import 'package:bottom_nav_bar_sample/bottom_nav_bar_item_data.dart';
import 'package:bottom_nav_bar_sample/const.dart';
import 'package:bottom_nav_bar_sample/counter_page.dart';
import 'package:flutter/material.dart';

class SampleBottomNavBarController extends StatefulWidget {
  final PageStorageBucket pageStorageBucket = PageStorageBucket();

  final List<BottomNavBarItemData> screens = [
    BottomNavBarItemData(
      FIRST_PAGE,
      Icon(Icons.cake),
      CounterPage(
        FIRST_PAGE,
        key: PageStorageKey(FIRST_PAGE),
      ),
    ),
    BottomNavBarItemData(
      SECOND_PAGE,
      Icon(Icons.calendar_today),
      CounterPage(
        SECOND_PAGE,
        key: PageStorageKey(SECOND_PAGE),
      ),
    ),
    BottomNavBarItemData(
      THIRD_PAGE,
      Icon(Icons.card_travel),
      CounterPage(
        THIRD_PAGE,
        key: PageStorageKey(THIRD_PAGE),
      ),
    ),
  ];

  @override
  _SampleBottomNavBarControllerState createState() =>
      _SampleBottomNavBarControllerState();
}

class _SampleBottomNavBarControllerState
    extends State<SampleBottomNavBarController> {
  int _selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _createBottomNavigationBar(),
      body: _createPageStorage(),
    );
  }
  
  BottomNavigationBar _createBottomNavigationBar() => BottomNavigationBar(
        currentIndex: _selectedIdx,
        items: widget.screens
            .map(
              (e) => _createBottomNavigationBarItem(e),
            )
            .toList(),
        onTap: (int idx) => setState(
          () => _selectedIdx = idx,
        ),
      );

  PageStorage _createPageStorage() => PageStorage(
        bucket: widget.pageStorageBucket,
        child: widget.screens[_selectedIdx].screen,
      );

  BottomNavigationBarItem _createBottomNavigationBarItem(
          BottomNavBarItemData barItemData) =>
      BottomNavigationBarItem(
        icon: barItemData.icon,
        title: Text(barItemData.label),
      );
}
