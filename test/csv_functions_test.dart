import 'package:flutter_test/flutter_test.dart';

void main() {
  // Arrange
  group('returnData', () {
    test('the  function should return the data', () async {
      // arrange
      var expectedData = [
        [
          'D1',
          'Minneapolis',
          'shoes',
          2,
          'Air',
        ],
        [
          'ID2',
          'Chicago',
          'shoes',
          1,
          'Air',
        ],
        [
          'D3',
          'Central Department Store',
          'shoes',
          5,
          'BonPied',
        ],
        [
          'ID4',
          'Quail Hollow',
          'forks',
          3,
          'Pfitzcraft',
        ],
      ];

      // assert
      expect(expectedData, equals(expectedData));
    });
  });
}
