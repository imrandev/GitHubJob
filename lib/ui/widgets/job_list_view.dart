import 'package:flutter/material.dart';
import 'package:github_job/data/model/github_job.dart';
import 'package:github_job/utils/path_arguments.dart';
import 'package:github_job/utils/route_path.dart';

class JobListView extends StatelessWidget {

  final List<GitHubJob> jobs;

  JobListView(this.jobs);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => {
            Navigator.pushNamed(
              context,
              RoutePath.singleJob,
              arguments: PathArguments(
                jobs[index].id,
              ),
            ),
          },
          leading: SizedBox(
            width: 100,
            child: Image.network(
              jobs[index].companyLogo == null
                  ? "https://www.pngitem.com/pimgs/m/78-788231_icon-blue-company-icon-png-transparent-png.png"
                  : jobs[index].companyLogo,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          title: Text(
            "${jobs[index].title}",
          ),
        );
      },
    );
  }
}
