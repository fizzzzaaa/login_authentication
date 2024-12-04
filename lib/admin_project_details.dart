import 'package:flutter/material.dart';
import 'home_admin.dart';

class ProjectDetails extends StatelessWidget {
  final Project project;

  ProjectDetails({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${project.description}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Languages Used:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...project.languages.map((lang) => Text('- $lang')),
            SizedBox(height: 10),
            Text('Images:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...project.images.map((img) => Image.asset(img)), // Use Image.network() if images are from URLs.
            SizedBox(height: 10),
            Text('Videos:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...project.videos.map((video) => Text(video)), // Replace with video player widget if needed.
          ],
        ),
      ),
    );
  }
}
