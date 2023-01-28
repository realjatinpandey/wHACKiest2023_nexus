import 'package:flutter/material.dart';
import 'package:nexus_alpha/screens/discover_screen.dart';
import 'package:nexus_alpha/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // Color homeIconColor = Colors.black;
  // Color allIconColor = Colors.grey;
  bool onDiscover = true;
  @override
  Widget build(BuildContext context) {
    int newIndex = widget.index;

    return BottomNavigationBar(
      onTap: (indexB) {
        if (newIndex != indexB && indexB == 0) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else if (newIndex != indexB && indexB == 1) {
          Navigator.pushReplacementNamed(context, DiscoverScreen.routeName);
        }
        setState(() {
          newIndex = indexB;
        });
      },
      currentIndex: newIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.home,
              // color: allIconColor,
            ),
          ),
          // icon: Container(
          // margin: const EdgeInsets.only(left: 50),
          // child: IconButton(
          //   onPressed: () {
          //     // if (!onDiscover) {
          //     //   setState(() {

          //     //     onDiscover = true;
          //     //   });
          //     // setState(() {
          //     //   allIconColor = Colors.black;
          //     //   homeIconColor = Colors.grey;
          //     // });

          //     // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          //     // }
          //   },
          //   icon: Icon(
          //     Icons.home,
          //     // color: allIconColor,
          //   ),
          // ),
          // ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.newspaper,
              // color: allIconColor,
            ),
          ),
          // icon: IconButton(
          //   onPressed: () {
          //     // setState(() {
          //     //   allIconColor = Colors.black;
          //     //   homeIconColor = Colors.grey;
          //     // });
          //     // if (onDiscover) {
          //     //   setState(() {
          //     //     onDiscover = false;
          //     //   });
          //     // Navigator.pushReplacementNamed(context, DiscoverScreen.routeName);
          //     // }
          //   },
          //   icon: Icon(
          //     Icons.newspaper,
          //     // color: allIconColor,
          //   ),
          // ),
          label: 'All',
        ),
        // BottomNavigationBarItem(
        //   icon: Container(
        //     margin: const EdgeInsets.only(right: 50),
        //     child: IconButton(
        //       onPressed: () {
        //         print('No profile screen yet');
        //       },
        //       icon: const Icon(Icons.person),
        //     ),
        //   ),
        //   label: 'Profile',
        // ),
      ],
    );
  }
}
