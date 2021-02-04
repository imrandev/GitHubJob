part of 'jobs_bloc.dart';

class JobLoaded extends BaseJobState {
  final List<GitHubJob> jobs;
  const JobLoaded({this.jobs});
  List<Object> get props => [jobs];
}
