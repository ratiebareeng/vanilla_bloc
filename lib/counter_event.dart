/// General class for all counter BLoC events
abstract class CounterEvent {}

/// Increment current counter value by 1
class IncrementEvent extends CounterEvent {}

/// Decrement current counter value by 1
class DecrementEvent extends CounterEvent {}
