import 'package:flutter/material.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/tabs/ahadeth_tab.dart';
import 'package:islami_app/tabs/quran_tab.dart';
import 'package:islami_app/tabs/radio_tab.dart';
import 'package:islami_app/tabs/sebha_tab.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/background.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            'Islami',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          //shadow
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),
                  label: 'quran',
                  backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: 'radio',
                  backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: 'sebha',
                  backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/quran-quran-svgrepo-com.png')),
                  label: 'ahadeth',
                  backgroundColor: MyThemeData.primaryColor),
            ]),
        body: tabs[index],
      ),
    ]);
  }

  List<Widget> tabs = [QuranTab(), SebhaTab(), RadioTab(), AhadethTab()];
}
