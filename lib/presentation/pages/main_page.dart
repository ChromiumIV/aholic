import 'package:aholic/presentation/drawers/ahl_drawer.dart';
import 'package:aholic/presentation/page_fragments/space_page_fragment.dart';
import 'package:aholic/presentation/page_fragments/timeline_page_fragment.dart';
import 'package:aholic/presentation/router/app_router.dart';
import 'package:aholic/providers.dart';
import 'package:aholic/widgets/ahl_icon_button.dart';
import 'package:aholic/widgets/ahl_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/ahl_colors.dart';
import '../../widgets/ahl_bottom_navigation_bar.dart';
import '../bottom_sheets/ahl_create_item_bottom_sheet.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return AhlScaffold(
      scaffoldKey: _scaffoldKey,
      drawer: const AhlDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  AhlIconButton(
                    icon: Icons.menu,
                    fillColor: Colors.white,
                    iconColor: AhlColors.primary,
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  Spacer(),
                  AhlIconButton(
                    icon: Icons.mail,
                    fillColor: Colors.white,
                    iconColor: AhlColors.primary,
                  ),
                ],
              ),
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
              onFabPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => AhlCreateItemBottomSheet(
                    onItemSelected: (index) {
                      switch (index) {
                        case 0:
                          ref
                              .read(appRouterProvider)
                              .push(const CreateEventRoute());
                      }
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
