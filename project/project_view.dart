import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:portfol_flutter_web/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectItem {
  final String title;
  final String description;
  final String image;
  final List<String> technologies;

  ProjectItem({
    required this.title,
    required this.description,
    required this.image,
    required this.technologies,
  });
}

final KprojectItems = [
  ProjectItem(
    title: 'flutter',
    description: 'This project is about flutter web and mobile app',
    image: 'assets/images/1.png',
    technologies: ['Flutter', 'Dart', 'IOS'],
  ),
  ProjectItem(
    title: 'IOS',
    description: 'This project is about flutter web and mobile app',
    image: 'assets/images/2.png',
    technologies: ['Flutter', 'Dart', 'IOS'],
  ),
  ProjectItem(
    title: 'IOS',
    description: 'This project is about flutter web and mobile app',
    image: 'assets/images/2.png',
    technologies: ['Flutter', 'Dart', 'IOS'],
  )
];

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, Size) {
      if (Size.isMobile) {
        return ProjectMobileView();
      }
      return ProjectDesktopView();
    });
  }
}

class ProjectMobileView extends StatelessWidget {
  const ProjectMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: KInitWidth,
      child: Column(
        children:[
         Divider(thickness: 2, color: Colors.black),
        Text("Project", style: TextStyle(fontSize: 30, color: Colors.black, fontFamily: 'Montserrat')),
        SizedBox(height: 5),
        for (final item in KprojectItems)
           ProjectItemBody(item: item),
      ]),
    );
  }
}

class ProjectDesktopView extends StatelessWidget {
  const ProjectDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 650,
      width: KInitWidth,
      color: Colors.white,
      child: Column(children: [
        Text(
          "Project",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontFamily: 'Montserrat'),
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in KprojectItems)
              Expanded(child: ProjectItemBody(item: item))
          ],
        ),
      ]),
    );
  }
}

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({
    super.key,
    required this.item,
  });

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return 
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.image),
          SizedBox(height: 10),
          Text(item.title, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(item.description, style: TextStyle(fontSize: 15)),
          SizedBox(height: 20),
          Row(
            children: [
              for (final tech in item.technologies)
                Chip(label: Text(tech)),
            ],
          ),
          SizedBox(height: 30)
        ],
      );
  }
}
