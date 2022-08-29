import 'package:event_bus/event_bus.dart';

class Utils {
  static var eventBus = EventBus();
  static fireEvent(dynamic model) => eventBus.fire(model);
}