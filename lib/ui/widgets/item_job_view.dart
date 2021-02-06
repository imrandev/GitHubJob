import 'package:flutter/material.dart';
import 'package:github_job/data/model/github_job.dart';
import 'package:github_job/ui/widgets/circle_image_view.dart';
import 'package:github_job/utils/path_arguments.dart';
import 'package:github_job/utils/route_path.dart';

class ItemJobView extends StatelessWidget {
  final GitHubJob job;

  ItemJobView(this.job);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: InkWell(
        onTap: () => {
          Navigator.pushNamed(
            context,
            RoutePath.singleJob,
            arguments: PathArguments(
              id: job.id,
              name: job.title
            ),
          ),
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${job.title}",
                style: TextStyle(
                  fontFamily: "Titillium Web",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time,
                    size: 12,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${job.createdAt}",
                    style: TextStyle(
                      fontFamily: "Titillium Web",
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffABB0CC),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city,
                    size: 12,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${job.location}",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Titillium Web",
                      color: Color(0xffABB0CC),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${job.type}",
                    style: TextStyle(
                      fontFamily: "Titillium Web",
                      fontSize: 16,
                      color: Color(0xffE64E31),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          "${job.company}",
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Titillium Web",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FadeInImage.assetNetwork(
                        height: 30,
                        width: 80,
                        alignment: Alignment.center,
                        placeholder: 'assets/images/loading.gif',
                        image: job.companyLogo == null
                            ? "https://www.pngitem.com/pimgs/m/78-788231_icon-blue-company-icon-png-transparent-png.png"
                            : job.companyLogo,
                      ),
                      /*CircleImageView(
                        onTap: () => {},
                        imgUrl: job.companyLogo == null
                            ? "https://www.pngitem.com/pimgs/m/78-788231_icon-blue-company-icon-png-transparent-png.png"
                            : job.companyLogo,
                      ),*/
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
