import 'package:fetch_int_epic/store/action.dart';
import 'package:fetch_int_epic/store/epic.dart';
import 'package:fetch_int_epic/store/model.dart';
import 'package:fetch_int_epic/store/reducer.dart';
import 'package:fetch_int_epic/store/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initialState(),
    middleware: [EpicMiddleware(appEpic)],
  );
  runApp(TheApp(
    store: store,
  ));
}

class TheApp extends StatelessWidget {
  final Store<AppState> store;
  const TheApp({required this.store, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: StoreConnector<AppState, ViewModel>(
          distinct: true,
          onInitialBuild: (viewModel) {},
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (context, viewModel) {
            final String status = viewModel.status;
            if (status == "idle")
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  // onPressed: () => store.dispatch(DoIncrement()),
                  onPressed: () => store.dispatch(InstanceIncrement()),
                  child: Text("+"),
                ),
                body: Center(
                  child: Text(
                    viewModel.value.toString(),
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              );
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
