import 'package:path/path.dart' show dirname, join;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:csv_file/csv_functions.dart';
import 'package:csv/csv.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  // Load the csv file before running the tests
  setUp(() async {
    final path = join(dirname(Platform.script.toFilePath()), 'assets/test.csv');
    final content = await File(path).readAsString();
    getCsvFile = const CsvToListConverter().convert(content);
  });

  test('test the firstFile function', () async {
    // get the expected result
    final expected = [
    ['shoes', 2.0], 
    ['forks', 0.75]
     
    ];

    // call the function and get the result
    final result = await firstFile();

    // compare the result with the expected value
    expect(result, equals(expected));
  });

  test('test the secondFile function', () async {
    // get the expected result
    final expected = [
     ['shoes', 'Air\r'], ['forks', 'Pfitzcraft']
      
    ];

    // call the function and get the result
    final result = await secondFile() ;

    // compare the result with the expected value
    expect(result, equals(expected));
  });
}
