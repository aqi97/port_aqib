
import 'package:flutter/material.dart';
import 'package:portfol_flutter_web/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SkilView extends StatelessWidget {
  const SkilView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, Size) {
      if (Size.isMobile) {
        return SkillMobileView();
      }
      return SkillDesktopView();
    });
  }
}
class SkillDesktopView extends StatelessWidget {
  const SkillDesktopView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: KInitWidth,
      height: 500,
      color: Colors.yellow,
      child: Column(
        children: [
          Text('My Skills', style: Theme.of(context).textTheme.headline2,),
          SizedBox(height: 20,),
          Row(
            
            children: [
              for(var index = 0; index < skills.length/2; index++)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                   border: Border.all(width:3, color:Colors.black),
                    color: Colors.green,
                  ),
                   child: Text(skills.elementAt(index), style: Theme.of(context).textTheme.headline2,),
                ),
              ),
            ],
          )
          
        ],
      ),
    );
  }
}
class SkillMobileView extends StatelessWidget {
  const SkillMobileView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: KInitWidth,
      height: 500,
      color: Colors.yellow,
      child: Column(
        children: [
          Text('My Skills',),
          SizedBox(height: 20,),
          
        ],
      ),
    );
  }
}
final skills = ['IOS','Flutter','Android','React Native','React','Node','MongoDB','Firebase','AWS'];