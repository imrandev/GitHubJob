import 'package:flutter/material.dart';
import 'package:github_job/data/model/github_job.dart';

class JobSingleView extends StatelessWidget {
  final GitHubJob job;

  JobSingleView(this.job);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${job.title}"),
    );
  }
}
