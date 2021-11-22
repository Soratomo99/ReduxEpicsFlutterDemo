import 'package:fetch_int_epic/store/action.dart';
import 'package:fetch_int_epic/store/model.dart';
import 'package:redux_epics/redux_epics.dart';

// Stream<dynamic> appEpic(
//   Stream<dynamic> actions,
//   EpicStore<AppState> store,
// ) async* {
//   await for (var action in actions) {
//     if (action == DoActions.DoIncrement) {
//       yield DoActions.DoFetch;
//       await Future.delayed(Duration(seconds: 2));
//       yield DoActions.DoIncrementSuccess;
//     }
//   }
// }

Stream<dynamic> appEpic(
  Stream<dynamic> actions,
  EpicStore<AppState> store,
) async* {
  await for (var action in actions) {
    if (action is DoIncrement) {
      final int newValue = store.state.value + 1;
      yield DoFetch(value: newValue);
      await Future.delayed(Duration(seconds: 2));
      yield DoIncrementSuccess(value: newValue);
    }
    if (action is InstanceIncrement) {
      yield DoIncrementSuccess(value: store.state.value + 1);
    }
  }
}
