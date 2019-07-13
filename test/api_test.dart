import 'package:flutter_test/flutter_test.dart';

import '../lib/api/user.dart';

void main() {
  test('api test', () {
    UserRequest.getUserProgress("1231").then((val) {
      print(val);
    });
  });
  
}
