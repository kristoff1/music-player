import 'dart:async';

class LogicHelper {
  void debounce(
      {required Timer? actionTimer,
      required Function() actionAfterDelay,
      int delay = 500}) {
    actionTimer?.cancel();
    actionTimer = Timer(Duration(milliseconds: delay), actionAfterDelay);
  }
}
