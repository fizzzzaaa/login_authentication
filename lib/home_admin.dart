import 'package:flutter/material.dart';
import 'admin_project_details.dart';
import 'auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  final List<Project> projects = [
    Project('Project 1', 'Description for Project 1', ['Dart', 'Flutter'], ['image1.png'], ['video1.mp4']),
    Project('Project 2', 'Description for Project 2', ['JavaScript', 'React'], ['image2.png'], ['video2.mp4']),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: projects.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Portfolio'),
          bottom: TabBar(
            isScrollable: true,
            tabs: projects.map((project) => Tab(text: project.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: projects.map((project) {
            return ProjectTile(project: project);
          }).toList(),
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final Project project;

  ProjectTile({required this.project});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetails(project: project),
            ),
          );
        },
        child: Text('View ${project.name} Details'),
      ),
    );
  }
}

class Project {
  final String name;
  final String description;
  final List<String> languages;
  final List<String> images;
  final List<String> videos;

  Project(this.name, this.description, this.languages, this.images, this.videos);
}
