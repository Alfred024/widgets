import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> asideMenuKey;
  const SideMenu({super.key, required this.asideMenuKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int drawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    double notch = MediaQuery.of(context).viewPadding.top;

    return NavigationDrawer(
      selectedIndex: drawerIndex,
      onDestinationSelected: (indexTapped) {
        setState(() {
          drawerIndex = indexTapped;
          final menuItemSelected = appMenuItems[drawerIndex];
          context.push(menuItemSelected.link);
          widget.asideMenuKey.currentState?.closeDrawer();
        });
      },
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(28, notch + 15, 28, 10),
            child: const Text('Menu')),
        ...appMenuItems
            .sublist(0, 3)
            .map((menuItem) => (NavigationDrawerDestination(
                  icon: Icon(menuItem.icon),
                  label: Text(menuItem.title),
                ))),
        const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 28, 10), child: Divider()),
        const Padding(
            padding: EdgeInsets.fromLTRB(28, 15, 28, 10),
            child: Text('More options')),
        ...appMenuItems
            .sublist(3)
            .map((menuItem) => (NavigationDrawerDestination(
                  icon: Icon(menuItem.icon),
                  label: Text(menuItem.title),
                ))),
      ],
    );
  }
}
