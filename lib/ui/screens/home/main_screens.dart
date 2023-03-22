import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/home/history_screens.dart';
import 'package:aipay/ui/screens/home/home_screens.dart';
import 'package:aipay/ui/screens/home/inbox_screens.dart';
import 'package:aipay/ui/screens/home/profile_screens.dart';
import 'package:flutter/material.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: kBlueDarkColor,
        tooltip: 'Scan QR',
        onPressed: () {
          Navigator.pushNamed(context, '/qr-code');
        },
        child: Image.asset(
          'assets/icons/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: kWhiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 0,
        elevation: 0,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            // print(value);
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: kBlackSoftColor,
          selectedItemColor: kYellowDarkColor,
          unselectedItemColor: kWhiteColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_overview.png',
                width: 20,
                color: currentIndex == 0 ? kYellowColor : kWhiteColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              tooltip: "History",
              icon: Image.asset(
                'assets/icons/ic_history.png',
                width: 20,
                color: currentIndex == 1 ? kYellowColor : kWhiteColor,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_statistic.png',
                width: 20,
                color: currentIndex == 2 ? kYellowColor : kWhiteColor,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_profile.png',
                height: 20,
                color: currentIndex == 3 ? kYellowColor : kWhiteColor,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomeScreens();
      case 1:
        return const HistoryScreens();
      case 2:
        return const InboxScreens();
      case 3:
        return const ProfileScreens();
      default:
        return const HomeScreens();
    }
  }
}
