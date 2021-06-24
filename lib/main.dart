import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ani/cards.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LiquidApp(
      materialApp: MaterialApp(
        title: 'Liquid Shrink SideMenu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Liquid Ui Shrink SideMenus'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  int _buttonId = 0;
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return SideMenu(
      key: _endSideMenuKey,
      inverse: true, // end side menu
      background: Colors.green[700],
      type: SideMenuType.shrinkNSlide,
      menu: buildMenu(),
      child: SideMenu(
        key: _sideMenuKey,
        menu: buildMenu(),
        type: SideMenuType.shrinkNSlide,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                final _state = _sideMenuKey.currentState;
                if (_state.isOpened)
                  _state.closeSideMenu();
                else
                  _state.openSideMenu();
              },
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    final _state = _endSideMenuKey.currentState;
                    if (_state.isOpened)
                      _state.closeSideMenu();
                    else
                      _state.openSideMenu();
                  })
            ],
            title: Text(widget.title),
          ),
          body: Container(
                color: const Color(0xFF192A56),
                child: ListView(
                //
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _buttonId = 1;
                        });
                        // The menu can be handled programatically using a key
                        if (fabKey.currentState.isOpen) {
                          fabKey.currentState.close();
                        } else {
                          fabKey.currentState.open();
                        }
                      },
                      color: Colors.white,
                      child: Text('menu 1',
                          style: TextStyle(color: primaryColor)),
                    ),
                    RaisedButton(
                      onPressed: () {
                        // The menu can be handled programatically using a key
                        setState(() {
                          _buttonId = 2;
                        });
                        if (fabKey.currentState.isOpen) {
                          fabKey.currentState.close();
                        } else {
                          fabKey.currentState.open();
                        }
                      },
                      color: Colors.white,
                      child: Text('menu 2',
                          style: TextStyle(color: primaryColor)),
                    ),
                    RaisedButton(
                      onPressed: () {
                        // The menu can be handled programatically using a key
                        setState(() {
                          _buttonId = 3;
                        });
                        if (fabKey.currentState.isOpen) {
                          fabKey.currentState.close();
                        } else {
                          fabKey.currentState.open();
                        }
                      },
                      color: Colors.white,
                      child: Text('menu 3',
                          style: TextStyle(color: primaryColor)),
                    ),
                    RaisedButton(
                      onPressed: () {
                        // The menu can be handled programatically using a key
                        setState(() {
                          _buttonId = 4;
                        });
                        if (fabKey.currentState.isOpen) {
                          fabKey.currentState.close();
                        } else {
                          fabKey.currentState.open();
                        }
                      },
                      color: Colors.white,
                      child: Text('menu 4',
                          style: TextStyle(color: primaryColor)),
                    ),
                    Cards(latitude: 27.568544, longitude: 78.1547893, speed: 85, location: "Jaipur"),
                    Cards(latitude: 27.568544, longitude: 78.1547893, speed: 85, location: "Mansarover"),
                    Cards(latitude: 27.568544, longitude: 78.1547893, speed: 85, location: "Vaishali Nagar"),
                    Cards(latitude: 27.568544, longitude: 78.1547893, speed: 85, location: "Chitrkoot"),
                    Cards(latitude: 27.568544, longitude: 78.1547893, speed: 85, location: "Kukas"),
                    Cards(latitude: 27.568544, longitude: 78.1547893, speed: 85, location: "Amer"),
                    Cards(latitude: 27.568544, longitude: 78.1547893, speed: 85, location: "Badi choppad"),

                  ],
                ),
          ),
          floatingActionButton: Builder(
            builder: (context) => FabCircularMenu(
              key: fabKey,
              // Cannot be `Alignment.center`
              alignment: Alignment.centerRight,
              ringColor: Colors.transparent,
              ringDiameter: 600.0,
              ringWidth: 10.0,
              fabSize: 0.0,
              fabElevation: 8.0,
              fabIconBorder: CircleBorder(),
              // Also can use specific color based on wether
              // the menu is open or not:
              // fabOpenColor: Colors.white
              // fabCloseColor: Colors.white
              // These properties take precedence over fabColor
              fabColor: Colors.white,
              fabOpenIcon: Icon(Icons.menu, color: Colors.white),
              fabCloseIcon: Icon(Icons.close, color: Colors.white),
              fabMargin: const EdgeInsets.all(16.0),
              animationDuration: const Duration(milliseconds: 800),
              animationCurve: Curves.easeInOutCirc,
              onDisplayChange: (isOpen) {
                _showSnackBar(
                    context,
                    "The menu is now,  ${isOpen ? "open" : "closed"}",
                    "${_buttonId}");
              },
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 310, right: 0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: (){
                      if (fabKey.currentState.isOpen) {
                        fabKey.currentState.close();
                      } else {
                        fabKey.currentState.open();
                      }
                    },
                    child: Image.asset('assets/dashboardIcon/notification.png', height: 120, width: 120),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 310, right: 0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: (){
                      if (fabKey.currentState.isOpen) {
                        fabKey.currentState.close();
                      } else {
                        fabKey.currentState.open();
                      }
                    },
                    child: Image.asset('assets/dashboardIcon/wallet.png', height: 100, width: 100),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 310, right: 0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: (){
                      if (fabKey.currentState.isOpen) {
                        fabKey.currentState.close();
                      } else {
                        fabKey.currentState.open();
                      }
                    },
                    child: Image.asset('assets/dashboardIcon/notification.png', height: 120, width: 120),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 310, right: 0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: (){
                      if (fabKey.currentState.isOpen) {
                        fabKey.currentState.close();
                      } else {
                        fabKey.currentState.open();
                      }
                    },
                    child: Image.asset('assets/dashboardIcon/wallet.png', height: 100, width: 100),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 310, right: 0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: (){
                      if (fabKey.currentState.isOpen) {
                        fabKey.currentState.close();
                      } else {
                        fabKey.currentState.open();
                      }
                    },
                    child: Image.asset('assets/dashboardIcon/notification.png', height: 120, width: 120),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 310, right: 0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: (){
                      if (fabKey.currentState.isOpen) {
                        fabKey.currentState.close();
                      } else {
                        fabKey.currentState.open();
                      }
                    },
                    child: Image.asset('assets/dashboardIcon/wallet.png', height: 100, width: 100),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: FFNavigationBar(
            theme: FFNavigationBarTheme(
              barBackgroundColor: Colors.white,
              selectedItemBorderColor: Colors.transparent,
              selectedItemBackgroundColor: Colors.green,
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.black,
              showSelectedItemShadow: false,
              barHeight: 70,
            ),
            selectedIndex: selectedIndex,
            onSelectTab: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              FFNavigationBarItem(
                iconData: Icons.calendar_today,
                label: 'Bar Theme',
              ),
              FFNavigationBarItem(
                iconData: Icons.people,
                label: 'Orange',
                selectedBackgroundColor: Colors.orange,
              ),
              FFNavigationBarItem(
                iconData: Icons.attach_money,
                label: 'Purple',
                selectedBackgroundColor: Colors.purple,
              ),
              FFNavigationBarItem(
                iconData: Icons.note,
                label: 'Blue',
                selectedBackgroundColor: Colors.blue,
              ),
              FFNavigationBarItem(
                iconData: Icons.settings,
                label: 'Red Item',
                selectedBackgroundColor: Colors.red,
              ),
            ],
          ),
        )));
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                LText(
                  "\l.lead{Hello},\n\l.lead.bold{Johnie}",
                  baseStyle: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.home, size: 20.0, color: Colors.white),
            title: Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.verified_user, size: 20.0, color: Colors.white),
            title: Text("Profile"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading:
            Icon(Icons.monetization_on, size: 20.0, color: Colors.white),
            title: Text("Wallet"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.shopping_cart, size: 20.0, color: Colors.white),
            title: Text("Cart"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: Text("Favorites"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: Text("Settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
  void _showSnackBar(BuildContext context, String message, String buttonId) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message + "  :  " + buttonId),
      duration: const Duration(milliseconds: 1000),
    ));
  }

}