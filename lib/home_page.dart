import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: Colors.red,
        title: const Text('E-Park'),
        //centerTitle: true,
        leading: const Icon(Icons.local_parking_outlined),
      ),
      backgroundColor: Colors.red,
      routes: const [
        ParqueoRouter(),
        PostsRouter(),
        UsersRouter(),
        SettingsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.white,
              icon: const Icon(
                Icons.car_repair,
                size: 30,
              ),
              title: const Text('Parqueos'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.white,
              icon: const Icon(
                Icons.attach_money,
                size: 30,
              ),
              title: const Text('Pago'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.white,
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
              title: const Text('Usuario'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.white,
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
              title: const Text('Configuración'),
            )
          ],
        );
      },
    );
  }
}
