import 'package:fetch_int_epic/store/model.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final int value;
  final String status;
  ViewModel({required this.value, required this.status});
  factory ViewModel.create(Store<AppState> store) {
    return ViewModel(value: store.state.value, status: store.state.status);
  }
}
