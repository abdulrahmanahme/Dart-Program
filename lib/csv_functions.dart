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

    /* create 'orderNum' map to deal with the keys as the product names
     and the values is the count of the orders of every product */
  for (List<dynamic> val in getCsvFile!) {
    String key = val[2];
    int value = val[3];
    if (orderNum.containsKey(key)) {
      orderNum[key] = value + orderNum[key]!;
    } else {
      orderNum[key] = value;
    }
  }

  return firstData;
}