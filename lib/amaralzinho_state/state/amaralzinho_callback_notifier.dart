import 'package:amaralzinho_state_example/amaralzinho_state/interfaces/amaralzinho_callback_notifier_interface.dart';

class AmaralzinhoCallbackNotifier implements AmaralzinhoCallbackNotifierInterface {
  
  final List<void Function()> _callbacks = [];

  @override
  void addCallback(void Function() callback) {
    _callbacks.add(callback);
  }

  @override
  void notifyCallbacks() {
    for (var callback in _callbacks) {
      callback();
    }
  }

  @override
  void removeCallback(void Function() callback) {
    _callbacks.remove(callback);
  }
  
  @override
  void dispose() {
    _callbacks.clear();
  }
}
