import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/profile_screen.dart';
import '../constants.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/customfont.dart';
import '../screens/notification_screen.dart';
 
class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, this.username = 'User'});
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: FB_TEXT_COLOR_WHITE,
        elevation: 2,
        title: (_selectedIndex == 0)
            ? Customfont(
                text: 'HotDogs',
                fontSize: ScreenUtil().setSp(25),
                color: FB_PRIMARY,
                fontFamily: 'Klavika',
                fontWeight: FontWeight.bold,
              )
            : (_selectedIndex == 2)
                ? Customfont(
                    text: widget.username,
                    fontSize: ScreenUtil().setSp(25),
                    color: FB_PRIMARY,
                    fontFamily: 'Klavika',
                    fontWeight: FontWeight.bold,
                  )
                : Customfont(
                    text: 'Notification',
                    fontSize: ScreenUtil().setSp(25),
                    color: FB_PRIMARY,
                    fontFamily: 'Klavika',
                    fontWeight: FontWeight.bold,
                  ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: FB_LIGHT_PRIMARY),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          NewsFeedScreen(),
          NotificationScreen(),
          ProfileScreen(username: widget.username), // Fixed userName
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: FB_PRIMARY,
        currentIndex: _selectedIndex,
      ),
    );
  }
 
  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
 
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close the dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pushReplacementNamed(
                    context, '/login'); // Navigate to login
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
 