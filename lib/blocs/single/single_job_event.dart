part of 'single_job_bloc.dart';

class FetchSingleJob extends BaseJobEvent {
  final String id;
  const FetchSingleJob(this.id);
  List<Object> get props => [id];
}