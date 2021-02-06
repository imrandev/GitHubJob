import 'package:flutter/material.dart';
import 'package:github_job/data/model/github_job.dart';
import 'package:github_job/ui/widgets/item_job_view.dart';

class JobsView extends StatelessWidget {
  final List<GitHubJob> jobs;

  JobsView(this.jobs);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Jobs",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Titillium Web',
                    fontSize: 18,
                    color: Color(0xffF49679),
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: Color(0xffA84948),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              return ItemJobView(jobs[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return ItemJobView(jobs[index]);
            },
          ),
        ],
      ),
    );
  }
}
