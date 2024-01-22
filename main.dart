import 'package:flutter/material.dart';
import 'package:portfol_flutter_web/header_view/header_view.dart';
import 'package:portfol_flutter_web/navigation_bar/navigation_bar_view.dart';
import 'package:portfol_flutter_web/project/project_view.dart';
import 'package:portfol_flutter_web/skils/skils_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aqib Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme( headline2: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 30, fontWeight: FontWeight.bold)
            ),
        useMaterial3: true,
      ),
      home: PortfolioView(),
    );
  }
}

class PortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final ScrollController scrollController = ScrollController(initialScrollOffset: 1750);
    return Scaffold(
      endDrawer: DrawerView(),
      body: SingleChildScrollView(
        child: Column(
          children: [
           NavigationBarView(),
           HeaderView(),
           ProjectView(),
           SkilView(),
           Container(
            height: height,
            width: width,
            color: Colors.blue,
          ),
        ]),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
   DrawerView({super.key, });

  @override
  Widget build(BuildContext context) {
    return  ResponsiveBuilder(
      builder:(_, Size) {
        if(!Size.isMobile) return Container(
        );
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children:<Widget> [
               DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow,
                      Colors.blue,
                    ],tileMode: TileMode.repeated,
                  ),
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Business'),
                // selected: _selectedIndex == 1,
                onTap: () {

                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('School'),
                // selected: _selectedIndex == 2,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
