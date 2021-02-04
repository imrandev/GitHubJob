import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_job/blocs/base/base_event.dart';
import 'package:github_job/blocs/base/base_state.dart';
import 'package:github_job/data/model/github_job.dart';
import 'package:github_job/data/repository/job_repository.dart';
import 'package:github_job/utils/constant.dart';

part 'single_job_event.dart';
part 'single_job_state.dart';

class SingleJobBloc extends Bloc<BaseJobEvent, BaseJobState> {

  final JobRepository jobRepository;

  SingleJobBloc(this.jobRepository) : super(InitialState());

  @override
  Stream<BaseJobState> mapEventToState(BaseJobEvent event) async* {
    yield InitialState();
    try {
      if (event is FetchSingleJob) {
        final url = Constant.baseUrl + "/positions/${event.id}.json";
        final job = await jobRepository.fetchSingleJob(url);
        print(job.id);
        yield SingleJobLoaded(job: job);
      }
    } on Error {
      yield JobError("Something went wrong!");
    }
  }
}
