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
  final GitHubJob job;
  const JobLoaded({this.jobs, this.job});
  List<Object> get props => [jobs, job];
}

class JobError extends JobState {
  final String msg;
  const JobError(this.msg);
  List<Object> get props => [msg];
}
