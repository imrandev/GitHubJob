
import 'package:flutter/material.dart';

@immutable
abstract class BaseJobState {
  const BaseJobState();
}

class InitialState extends BaseJobState {
  const InitialState();
  List<Object> get props => [];
}

class JobError extends BaseJobState {
  final String msg;
  const JobError(this.msg);
  List<Object> get props => [msg];
}