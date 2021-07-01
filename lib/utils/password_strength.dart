

import 'bruteforce.dart';
import 'common.dart';

double estimatePasswordStrength(String password) {
  return estimateBruteforceStrength(password) *
      estimateCommonDictionaryStrength(password);
}