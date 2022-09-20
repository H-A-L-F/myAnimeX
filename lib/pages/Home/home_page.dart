import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myanimex/main.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myanimex/pages/Home/components/carousel.dart';
import 'package:myanimex/pages/Home/components/real_home.dart';
import 'package:myanimex/pages/Items/items_page.dart';
import 'package:myanimex/pages/Profile/profile_page.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

class ItemModel {
  String title;
  IconData icon;
  Function() onTap;

  ItemModel(this.title, this.icon, this.onTap);
}

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> pages = [
    RealHome(),
    ItemsPage(),
    ProfilePage(),
  ];
  static const List<GButton> menus = [
    GButton(
      icon: LineIcons.home,
      text: 'Home',
    ),
    GButton(
      icon: LineIcons.bookOpen,
      text: 'Items~',
    ),
    GButton(
      icon: LineIcons.user,
      text: 'Profile',
    ),
  ];
  final CustomPopupMenuController _controller = CustomPopupMenuController();
  late List<ItemModel> menuItems;

  @override
  Widget build(BuildContext context) {
    menuItems = [
      ItemModel(
        'Switch theme',
        Icons.sunny,
        () {
          AdaptiveTheme.of(context).toggleThemeMode();
        },
      ),
      ItemModel(
        'Logout',
        Icons.logout,
        () {
          Navigator.of(context).pushNamed('/');
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text(widget.email),
        actions: <Widget>[
          CustomPopupMenu(
            menuBuilder: () => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: const Color(0xFF4C4C4C),
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: menuItems
                        .map(
                          (item) => GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              item.onTap();
                              _controller.hideMenu();
                            },
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    item.icon,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        item.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            pressType: PressType.singleClick,
            verticalMargin: -10,
            controller: _controller,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Icon(Icons.add_circle_outline, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: menus,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
