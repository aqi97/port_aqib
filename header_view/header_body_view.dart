import 'package:flutter/material.dart';
import 'package:portfol_flutter_web/constant.dart';
import 'package:portfol_flutter_web/utils/hover_extention.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;

  const HeaderBody({
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 350: 200,
      width: KInitWidth,
      
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('I am a',
              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat')),
          Text(
            'Developer < / >',
            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
          ),
          SizedBox(height: isMobile ? 20 : 40),
          Text(
            "I am practicing flutter",
            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
          ),
          SizedBox(height: isMobile ? 20 : 40),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 8 : 17,
                vertical: isMobile ? 10 : 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Explore',
              style: TextStyle(fontSize: isMobile ? 20 : 24, color: Colors.black),
            ),
          ).showCursorOnHover,
        ],
      ),
    );
  }
}

class HearMobileView extends StatelessWidget {
  const HearMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: height * 0.3),
          HeaderBody(isMobile: true),
        ],
      ),
    );
  }
}
