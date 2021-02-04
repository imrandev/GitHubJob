import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_job/blocs/base/base_event.dart';
import 'package:github_job/blocs/base/base_state.dart';
import 'package:github_job/data/model/github_job.dart';
import 'package:github_job/data/repository/job_repository.dart';
import 'package:github_job/utils/constant.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<BaseJobEvent, BaseJobState> {
  final JobRepository jobRepository;

  JobsBloc(this.jobRepository) : super(InitialState());

  @override
  Stream<BaseJobState> mapEventToState(BaseJobEvent event) async* {
    yield InitialState();
    try {
      if (event is FetchJobs) {
        final jobs =
            await jobRepository.fetchGitHubJobs(Constant.githubJobPositionsApi);
        yield JobLoaded(jobs: jobs);
      }
    } on Error {
      yield JobError("Something went wrong!");
    }
  }
}
