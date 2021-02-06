import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:github_job/data/model/github_job.dart';

class JobSingleView extends StatelessWidget {
  final GitHubJob job;

  JobSingleView(this.job);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInImage.assetNetwork(
              height: 150,
              alignment: Alignment.center,
              placeholder: 'assets/images/loading.gif',
              image: job.companyLogo == null
                  ? "https://www.pngitem.com/pimgs/m/78-788231_icon-blue-company-icon-png-transparent-png.png"
                  : job.companyLogo,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${job.title}",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Titillium Web",
                  color: Color(0xff0C090A),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${job.type}",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Titillium Web",
                    color: Color(0xffDF8091),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${job.location}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Titillium Web",
                      color: Color(0xff603F3F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Titillium Web",
                color: Color(0xff0C090A),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Html(
              data: "${job.description}",
              defaultTextStyle: TextStyle(
                fontSize: 16,
                fontFamily: "Titillium Web",
                color: Color(0xff603F3F),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "How to Apply",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Titillium Web",
                color: Color(0xff0C090A),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Html(
              data: "${job.howToApply}",
              defaultTextStyle: TextStyle(
                fontSize: 16,
                fontFamily: "Titillium Web",
                color: Color(0xff603F3F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
