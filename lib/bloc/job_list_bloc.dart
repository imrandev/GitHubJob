import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_job/data/model/github_job.dart';
import 'package:github_job/data/repository/job_repository.dart';
import 'package:github_job/utils/constant.dart';
import 'package:meta/meta.dart';

part 'job_list_event.dart';

part 'job_list_state.dart';

class JobListBloc extends Bloc<JobListEvent, JobListState> {
  final JobRepository jobRepository;

  JobListBloc(this.jobRepository) : super(JobListInitial());

  @override
  Stream<JobListState> mapEventToState(JobListEvent event) async* {
    yield JobListInitial();
    try {
      if (event is FetchJobList) {
        final jobs =
            await jobRepository.fetchGitHubJobs(Constant.githubJobPositionsApi);
        yield JobListLoaded(jobs: jobs);
      } else if (event is FetchSingleJob) {
        final url = Constant.baseUrl + "/positions/${event.id}.json";
        print("$url");
        final job = await jobRepository.fetchSingleJob(url);
        print(job.id);
        yield JobListLoaded(job: job);
      }
    } on Error {
      yield JobListError("Something went wrong!");
    }
  }
}
