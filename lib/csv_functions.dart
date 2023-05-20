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

/// Generate the second csv file that view in the first column
/// a list of name products and in the second column is
/// the most popular brand of the products.
Future<List<List<dynamic>>> secondFile() async {
  Map<String, List<String>> popularBrands = {};
  Map<String, String> popularVal = {};
  List<List<dynamic>> secondData = [];
  
  //create the popular brands map to collect the different brands for every product.
  for (List<dynamic> val in getCsvFile!) {
    String key = val[2];
    String value = val[4];
    if (popularBrands.containsKey(key)) {
      popularBrands[key]?.add(value);
    } else {
      popularBrands[key] = [value];
    }
  }
    List<String> keys = popularBrands.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    List<String>? value = popularBrands[key];

    // create map of strings as the product name and the values is the number
    // of duplication brands
    Map<String, int> brandsNum = {};
    for (String string in value!) {
      if (brandsNum.containsKey(string)) {
        brandsNum[string] = brandsNum[string]! + 1;
      } else {
        brandsNum[string] = 1;
      }
      
    }
    // found the most popular brand for every product name
    int? maxVal = 0;
    String newKey = '';
    for (String key in brandsNum.keys) {
      if (brandsNum[key]! > maxVal!) {
        newKey = key;
        maxVal = brandsNum[key];
      }
    }
    popularVal[key] = newKey;
  }
  

  // to convert the map to List<List<dynamic>>
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    String? value = popularVal[key];
    secondData.add([key, value]);
  }

  // Generate the second file
  String secondDataFile = const ListToCsvConverter().convert(secondData);
  print('The second file data: ');
  print(secondDataFile);
  return const CsvToListConverter().convert(secondDataFile, eol: "\n");
}