import 'package:amaralzinho_state_example/amaralzinho_state/interfaces/amaralzinho_value_notifier_interface.dart';
import 'package:amaralzinho_state_example/amaralzinho_state/state/amaralzinho_callback_notifier.dart';

class AmaralzinhoValueNotifier<T> extends AmaralzinhoCallbackNotifier implements AmaralzinhoValueNotifierInterface {

  T _value;
  AmaralzinhoValueNotifier(this._value);

  @override
  T get value => _value;

  set(T newValue) {
    if (newValue == null) {
      return;
    }
    _value = newValue;
    notifyCallbacks();
  }
}
