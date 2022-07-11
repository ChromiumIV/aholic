import 'package:aholic/presentation/page_fragments/space_page_fragment.dart';
import 'package:aholic/presentation/page_fragments/timeline_page_fragment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/ahl_bottom_navigation_bar.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [],
          ),
          Expanded(
            child: IndexedStack(
              index: _index,
              children: const [
                TimelinePageFragment(),
                SpacePageFragment(),
              ],
            ),
          ),
          AhlBottomNavigationBar(
            icons: const [
              Icons.view_agenda,
              Icons.space_dashboard,
            ],
            onTabSelected: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
