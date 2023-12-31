import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int notificationsCount = 0;
  int cartCount = 0;
  int favoritesCount = 0;

  void increaseCount(int tab) {
    setState(() {
      if (tab == 0)
        notificationsCount++;
      else if (tab == 1)
        cartCount++;
      else if (tab == 2) favoritesCount++;
    });
  }

  void decreaseCount(int tab) {
    setState(() {
      if (tab == 0)
        notificationsCount--;
      else if (tab == 1)
        cartCount--;
      else if (tab == 2) favoritesCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarStyle: NavBarStyle.simple,
      controller: PersistentTabController(initialIndex: 0),
      screens: [
        // Screen 1: Notifications
        Scaffold(
          appBar: AppBar(title: Text('Notifications')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => increaseCount(0),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Increase', style: TextStyle(fontSize: 20),),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Decrease',style: TextStyle(fontSize: 20),),
                      onPressed: () => decreaseCount(0),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Screen 2: Cart
        Scaffold(
          appBar: AppBar(title: Text('Cart')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Increase',style: TextStyle(fontSize: 20),),
                      onPressed: () => increaseCount(1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Decrease',style: TextStyle(fontSize: 20),),
                      onPressed: () => decreaseCount(1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Screen 3: Favorites
        Scaffold(
          appBar: AppBar(title: Text('Favorites')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Increase',style: TextStyle(fontSize: 20),),
                      onPressed: () => increaseCount(2),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Decrease',style: TextStyle(fontSize: 20),),
                      onPressed: () => decreaseCount(2),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: badges.Badge(
            badgeContent: Container( height: 10,width: 14,
              child: Center(
                child: AutoSizeText(
                  notificationsCount.toString(), maxLines:1 ,minFontSize: 7,
                  style: TextStyle(fontSize: 8, color: Colors.white),
                ),
              ),
            ),
            badgeAnimation: const badges.BadgeAnimation.fade(
              animationDuration: Duration(microseconds: 100),
              colorChangeAnimationDuration: Duration(microseconds: 100),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            child: Icon(Icons.notifications),
          ),
          title: 'Notifications',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: badges.Badge(
            badgeContent: Container( height: 10,width: 14,
              child: Center(
                child: AutoSizeText(
                  cartCount.toString(), maxLines:1 ,minFontSize: 7,
                  style: TextStyle(fontSize: 8, color: Colors.white),
                ),
              ),
            ),
            badgeAnimation: const badges.BadgeAnimation.fade(
              animationDuration: Duration(microseconds: 100),
              colorChangeAnimationDuration: Duration(microseconds: 100),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            child: Icon(Icons.shopping_cart),
          ),
          title: 'Cart',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: badges.Badge(
            badgeContent: Container( height: 10,width: 14,
              child: Center(
                child: AutoSizeText(
                  favoritesCount.toString(), maxLines:1 ,minFontSize: 7,
                  style: TextStyle(fontSize: 8, color: Colors.white),
                ),
              ),
            ),
            badgeAnimation: const badges.BadgeAnimation.fade(
              animationDuration: Duration(microseconds: 100),
              colorChangeAnimationDuration: Duration(microseconds: 100),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            child: Icon(Icons.favorite),
          ),
          title: 'Favorites',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
    );
  }
}
