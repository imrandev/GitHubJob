part of 'single_job_bloc.dart';

class SingleJobLoaded extends BaseJobState {
  final GitHubJob job;
  const SingleJobLoaded({this.job});
  List<Object> get props => [job];
}
