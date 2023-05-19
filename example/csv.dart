import 'package:csv_dart/csv_dart.dart';

import 'dart:io';
import 'dart:convert';

import 'package:csv/csv.dart';

void main() {
  print('please inter name file');
// Read input file name from stdin
var inputFileName = stdin.readLineSync();

// Open input file
var inputFile = File(inputFileName!);

// Create output files
var outputFile0 = File('0_$inputFileName');
var outputFile1 = File('1_$inputFileName');

// Read and parse CSV data
var csvData = inputFile.readAsLinesSync().map((e) => e.split(',')).toList();

// Find distinct products and their total quantity and brand popularity
var productData = <String, List<Map<String, dynamic>>>{};
for (var row in csvData) {
var productName = row[2];
if (!productData.containsKey(productName)) {
productData[productName] = [];
}
var brand = row[4];
var quantity = int.parse(row[3]);
productData[productName]!.add({'brand': brand, 'quantity': quantity});
}

// Calculate average quantity and most popular brand for each product
var outputData0 = <List>[];
var outputData1 = <List>[];
for (var productName in productData.keys) {
var totalQuantity = productData[productName]!.fold(0, (acc, e) => acc +e['quantity'] as int);
var averageQuantity = (totalQuantity / productData[productName]!.length).toStringAsFixed(2);
outputData0.add([productName, averageQuantity]);


var brandCounts = <String, int>{};
for (var item in productData[productName]!) {
  if (!brandCounts.containsKey(item['brand'])) {
    brandCounts[item['brand']] = 0;
  }
  brandCounts[item['brand']++]!;
}
var mostPopularBrand = brandCounts.keys.reduce((a, b) => brandCounts[a] !>= brandCounts[b] !? a : b);
outputData1.add([productName, mostPopularBrand]);
// Write output files
var encoder =  CsvCodec();
outputFile0.writeAsStringSync(encoder.encoder.convert(outputData0));
outputFile1.writeAsStringSync(encoder.encoder.convert(outputData0) );
}


}