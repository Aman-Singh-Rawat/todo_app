import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/bottom_nav_pages/completed_page.dart';

import '../bottom_nav_pages/all_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  late final List<Widget> _pages;

  void navigateScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [const AllPage(), CompletedPage()];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 147, 149, 211),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "TODO APP",
            style: GoogleFonts.jost(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.02,),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
        body: _pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/ic_all.png"),
              label: "All",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/img_true.png"),
              label: "Completed",
            )
          ],
          selectedItemColor: const Color.fromARGB(255, 147, 149, 211),
          selectedFontSize: 16,
          currentIndex: selectedIndex,
          onTap: (value) => setState(() {
            selectedIndex = value;
          }),
        ),
      ),
    );
  }
}
