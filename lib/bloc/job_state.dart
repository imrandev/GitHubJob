part of 'job_bloc.dart';

@immutable
abstract class JobState {
  const JobState();
}

class InitialState extends JobState {
  const InitialState();
  List<Object> get props => [];
}

class JobLoaded extends JobState {
  final List<GitHubJob> jobs;
  const JobLoaded({this.jobs});
  List<Object> get props => [jobs];
}

class SingleJobLoaded extends JobState {
  final GitHubJob job;
  const SingleJobLoaded({this.job});
  List<Object> get props => [job];
}

class JobError extends JobState {
  final String msg;
  const JobError(this.msg);
  List<Object> get props => [msg];
}
