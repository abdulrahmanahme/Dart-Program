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
/// Generate the first csv file that view in the first column
/// a list of name products and in the second column is
/// the average quantity of the product purchased per order.
Future<List<List<dynamic>>> firstFile() async {
  int? ordersNum = getCsvFile?.length;
  Map<String, int> orderNum = {};
  List<List<dynamic>> firstData = [];

  
// to convert the map to List<List<dynamic>> and calculate the average quantity
  List<String> keys = orderNum.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    int? value = orderNum[key];
    firstData.add([key, (value! / ordersNum!).toStringAsFixed(2)]);
  }

  // Generate the first file
  String firstDataFile = const ListToCsvConverter().convert(firstData);
  print('The first file data: ');
  print(firstDataFile);
  return const CsvToListConverter().convert(firstDataFile, eol: "\n");
}