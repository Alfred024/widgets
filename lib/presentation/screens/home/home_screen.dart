import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  //Route name
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _MenuListItem(menuItem: menuItem);
      },
    );
  }
}

class _MenuListItem extends StatelessWidget {
  final MenuItem menuItem;
  const _MenuListItem({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: Colors.lightBlue),
      trailing:
          const Icon(Icons.arrow_forward_ios_rounded, color: Colors.lightBlue),
      onTap: () {
        //GoRouter.of(context).go(menuItem.link);
        //context.go(menuItem.link);
        context.push(menuItem.link);
      },
    );
  }
}
