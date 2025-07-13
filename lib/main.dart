import 'package:flutter/material.dart';
import 'models/job.dart';
import 'screens/job_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Finder',
      home: const JobListScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  final List<Job> jobs = const [
    Job(
      title: "Flutter Developer",
      company: "TechVision Pvt Ltd",
      location: "Remote",
      description: "We are looking for a Flutter Developer to join our team remotely.",
    ),
    Job(
      title: "Android Developer",
      company: "CodeCraft Inc",
      location: "Bangalore",
      description: "An Android Developer is needed with experience in Kotlin.",
    ),
    Job(
      title: "UI/UX Designer",
      company: "Pixel Agency",
      location: "Hyderabad",
      description: "Creative UI/UX Designer with 2+ years of experience.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Finder")),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(job.title),
              subtitle: Text("${job.company} • ${job.location}"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => JobDetailScreen(job: job)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
