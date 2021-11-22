class AppState {
  final int value;
  final String status;
  AppState({required this.value, this.status = "idle"});
  AppState.initialState()
      : value = 0,
        status = "idle";
  AppState copyWith({int? newValue, String? newStatus}) {
    return AppState(
        value: newValue ?? this.value, status: newStatus ?? this.status);
  }
}
