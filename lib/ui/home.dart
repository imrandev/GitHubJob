import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/blocs/base/base_state.dart';
import 'package:github_job/blocs/jobs/jobs_bloc.dart';
import 'package:github_job/ui/widgets/jobs_view.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // initial state call the job list api
    BlocProvider.of<JobsBloc>(context).add(FetchJobs());

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff0C090A),
        unselectedItemColor: Color(0xffC4B9AF),
        showUnselectedLabels: true,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.whatshot),
            label: "Hot Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Storelisted",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
          ),
        ],
      ),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Md. Imran Khan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              "imran@bdjobs.com",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
              ),
            ),
          ],
        ),
        leading: Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 28,
        ),
        actions: [
          InkWell(
            onTap: () => {

            },
            customBorder: new CircleBorder(),
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Icon(
                  Icons.notifications
              ),
            )
          ),
          InkWell(
              onTap: () => {

              },
              customBorder: new CircleBorder(),
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Icon(
                    Icons.search
                ),
              )
          ),
        ],
      ),
      body: BlocBuilder<JobsBloc, BaseJobState>(
        builder: (context, state) {
          if (state is JobLoaded) {
            return JobsView(state.jobs);
          } else if (state is InitialState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is JobError) {
            return Center(
              child: Text(
                "${state.msg}",
              ),
            );
          }
          return Center(
            child: Text("No job found"),
          );
        },
      ),
    );
  }
}
