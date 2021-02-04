import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_job/data/model/github_job.dart';
import 'package:github_job/data/repository/job_repository.dart';
import 'package:github_job/utils/constant.dart';
import 'package:meta/meta.dart';

part 'job_event.dart';

part 'job_state.dart';

class JobListBloc extends Bloc<JobListEvent, JobState> {
  final JobRepository jobRepository;

  JobListBloc(this.jobRepository) : super(InitialState());

  @override
  Stream<JobState> mapEventToState(JobListEvent event) async* {
    yield InitialState();
    try {
      if (event is FetchJobList) {
        final jobs =
            await jobRepository.fetchGitHubJobs(Constant.githubJobPositionsApi);
        yield JobLoaded(jobs: jobs);
      } else if (event is FetchSingleJob) {
        final url = Constant.baseUrl + "/positions/${event.id}.json";
        print("$url");
        final job = await jobRepository.fetchSingleJob(url);
        print(job.id);
        yield JobLoaded(job: job);
      }
    } on Error {
      yield JobError("Something went wrong!");
    }
  }
}
