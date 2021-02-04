import 'dart:convert';

import 'package:github_job/data/model/github_job.dart';
import 'package:github_job/utils/constant.dart';

import 'package:http/http.dart' as http;

abstract class BaseJobRepository {
  Future<List<GitHubJob>> fetchGitHubJobs(String url);
  Future<GitHubJob> fetchSingleJob(String url);
}

class JobRepository implements BaseJobRepository {
  @override
  Future<List<GitHubJob>> fetchGitHubJobs(String url) async {
    var response = await http.get(url);
    if (response.statusCode == Constant.ok) {
      return parseListOfJobs(response.body);
    } else {
      throw Exception('Unable to fetch jobs from the API');
    }
  }

  @override
  Future<GitHubJob> fetchSingleJob(String url) async {
    var response = await http.get(url);
    if (response.statusCode == Constant.ok) {
      return parseSingleJob(response.body);
    } else {
      throw Exception('Unable to fetch job from the API');
    }
  }

  List<GitHubJob> parseListOfJobs(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<GitHubJob>((json) => GitHubJob.fromJson(json)).toList();
  }

  GitHubJob parseSingleJob(String responseBody) {
    print(responseBody);
    final parsed = json.decode(responseBody);
    return GitHubJob.fromJson(parsed);
  }
}
