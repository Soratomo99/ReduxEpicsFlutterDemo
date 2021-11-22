import 'package:fetch_int_epic/store/action.dart';
import 'package:fetch_int_epic/store/model.dart';

AppState appStateReducer(AppState state, action) {
  if (action is DoFetch) {
    return state.copyWith(newValue: null, newStatus: "loading");
  }
  if (action is DoIncrementSuccess) {
    return state.copyWith(newValue: action.value, newStatus: "idle");
  }
  return state;
}
