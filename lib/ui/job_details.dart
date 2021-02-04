import 'package:flutter/material.dart';
import 'package:github_job/ui/widgets/job_single_view.dart';

class JobDetails extends StatelessWidget {
  final String id;

  JobDetails(this.id);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text("Job Details"),
      ),
      body: Container(
        child: JobSingleView(id),
      ),
    );
  }
}
