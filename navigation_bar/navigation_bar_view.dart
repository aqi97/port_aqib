
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPressed = () => {};
    return ResponsiveBuilder(
      builder:(context, Size) {
        if (Size.isMobile) {
          return Container(
            height: 50,
            width: double.infinity ,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                SizedBox(width: 20),
                Image.asset('assets/images/logo1.png', scale: 10,),
                Spacer(),
                IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(Icons.menu),
                ),
              ],
            ),
          );
        }
        return Container(
            height: 100,
            width: 1507,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:  Row(
              children: [
                SizedBox(width: 20),
               Image.asset('assets/images/logo1.png', scale: 10,),
                Spacer(),
               for(final item in KnavigationItems)
                NavigationBarItem(
                  onPressed: onPressed,
                  text: item.text,
                ),
              ],
            ),
        );
      },
    );
      }
  }

class NavigtionItem {
  final String text;
 NavigtionItem(this.text);
}
final KnavigationItems = [
  NavigtionItem('About me'),
  NavigtionItem('My Work'),
  NavigtionItem('Contact'),
  NavigtionItem('Blog'),
];

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Map Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650; 
    return Container(
      padding: const EdgeInsets.only(left:50),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onPressed,
        child: Text(text,
         style: TextStyle(fontSize: isSmall ? 30: 15 )),
      ),
    );
  }
}
