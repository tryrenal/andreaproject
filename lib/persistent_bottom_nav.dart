import 'package:andreaproject/feed_page.dart';
import 'package:andreaproject/profile_page.dart';
import 'package:andreaproject/search_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PersistentBottomNav extends StatelessWidget {
  const PersistentBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: FeedPage(),
          item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
        ),
        PersistentTabConfig(
          screen: SearchPage(),
          item: ItemConfig(icon: Icon(Icons.search), title: "Search"),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(icon: Icon(Icons.person), title: "Profile"),
        ),
      ],
      // navBarBuilder: (navBarConfig) => Style2BottomNavBar(
      //   navBarConfig: navBarConfig,
      //   navBarDecoration: NavBarDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(10),
      //     boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10)],
      //   ),
      //   itemAnimationProperties: ItemAnimation(
      //     duration: Duration(milliseconds: 400),
      //     curve: Curves.easeOut,
      //   ),
      // ),
      navBarBuilder: (navBarConfig) => CustomNavBar(navBarConfig: navBarConfig),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final NavBarConfig navBarConfig;

  // You are free to omit this, but in combination with `DecoratedNavBar` it might make your start easier
  final NavBarDecoration navBarDecoration;

  const CustomNavBar({
    super.key,
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
  });

  Widget _buildItem(ItemConfig item, bool isSelected) {
    final title = item.title;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: IconTheme(
            data: IconThemeData(
              size: item.iconSize,
              color: isSelected
                  ? item.activeForegroundColor
                  : item.inactiveForegroundColor,
            ),
            child: isSelected ? item.icon : item.inactiveIcon,
          ),
        ),
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                child: Text(
                  title,
                  style: item.textStyle.apply(
                    color: isSelected
                        ? item.activeForegroundColor
                        : item.inactiveForegroundColor,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedNavBar(
      decoration: navBarDecoration,
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final (index, item) in navBarConfig.items.indexed)
            Expanded(
              child: InkWell(
                // This is the most important part. Without this, nothing would happen if you tap on an item.
                onTap: () => navBarConfig.onItemSelected(index),
                child: _buildItem(item, navBarConfig.selectedIndex == index),
              ),
            ),
        ],
      ),
    );
  }
}
