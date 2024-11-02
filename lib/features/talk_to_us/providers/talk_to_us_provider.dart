import 'package:miles/core/exports.dart';

class TalkToUsProvider with ChangeNotifier {
  bool _showThankYouMessage = false;

  bool get showThankYouMessage => _showThankYouMessage;

  void toggleThankYouMessage() {
    _showThankYouMessage = !_showThankYouMessage;
    notifyListeners();
  }

  void resetThankYouMessage() {
    _showThankYouMessage = false;
    notifyListeners();
  }
}
