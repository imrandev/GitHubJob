part of 'job_bloc.dart';

@immutable
abstract class JobListEvent {
  const JobListEvent();
}

class FetchJobList extends JobListEvent {
  const FetchJobList();
}

class FetchSingleJob extends JobListEvent {
  final String id;
  const FetchSingleJob(this.id);
  List<Object> get props => [id];
}
