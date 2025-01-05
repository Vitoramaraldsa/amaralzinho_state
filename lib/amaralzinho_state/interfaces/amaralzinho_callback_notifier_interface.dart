abstract class AmaralzinhoCallbackNotifierInterface {
 
  void addCallback(void Function() callback);
  void removeCallback(void Function() callback);
  void notifyCallbacks();
  void dispose();
}