import 'package:tut_app/app/constants.dart';

extension NonNullableString on String? {
  String? orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}
extension NonNullableInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}
