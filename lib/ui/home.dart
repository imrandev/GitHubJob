import 'package:flutter/material.dart';
import 'package:github_job/ui/widgets/job_list_view.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: JobListView(),
      ),
    );
  }
}
