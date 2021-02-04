part of 'job_list_bloc.dart';

@immutable
abstract class JobListState {
  const JobListState();
}

class JobListInitial extends JobListState {
  const JobListInitial();
  List<Object> get props => [];
}

class JobListLoaded extends JobListState {
  final List<GitHubJob> jobs;
  final GitHubJob job;
  const JobListLoaded({this.jobs, this.job});
  List<Object> get props => [jobs, job];
}

class JobListError extends JobListState {
  final String msg;
  const JobListError(this.msg);
  List<Object> get props => [msg];
}
