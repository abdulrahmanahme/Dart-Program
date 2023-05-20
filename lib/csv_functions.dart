import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
List<List<dynamic>>? getCsvFile;
List<List<dynamic>>? firstFileData;
List<List<dynamic>>? secondFileData;

/// Add csv file  DATA to Console.
Future<List<List<dynamic>>> getcsv(BuildContext context) async {
  var result = await DefaultAssetBundle.of(context).loadString(
    "assets/test.csv",
  );
  print('the data in CSV file is: ');
  print(result);
  return const CsvToListConverter().convert(result);
}