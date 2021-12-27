import 'dart:math';

int uid() {
  var random = Random();
  return random.nextInt((pow(2, 31) as int) - 1);
}