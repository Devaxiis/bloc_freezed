
import 'package:bloc_freezed/app.dart';
import 'package:bloc_freezed/src/network/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void main() {
   final dio = Dio(); // Provide a dio instance
  dio.options.headers['Demo-Header'] = 'demo header'; // config your dio headers globally
  final client = RestClient(dio);


  client.getTasks().then((it) => logger.i(it));
  runApp(const MyApp());
}


