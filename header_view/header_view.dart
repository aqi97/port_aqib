import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'header_body_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (size.isMobile) {
          return HeaderMobileView();
        } else {
          return HeaderDesktopView();
        }
      },
    );
  }
}

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 950;
    final isImage = width * 0.3; 
    return Container(
      height: 450,
      width: 1000,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: HeaderBody(isMobile: true),
            ),
            Image.asset('assets/images/header.png', height: isSmall ? isImage : 500 ,),
          ],
        ),
      ),
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.9,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Image.asset('assets/images/header.png', scale: 10,),
          HeaderBody(isMobile: true),
        ],
      ),
    );
  }
}
