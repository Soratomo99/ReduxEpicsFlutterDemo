// enum DoActions { DoIncrement, DoIncrementSuccess, DoFetch }

class DoIncrement {
  const DoIncrement();
}

class DoIncrementSuccess {
  final int value;
  final String status = "idle";
  const DoIncrementSuccess({required this.value});
}

class DoFetch {
  final int value;
  final String status = "loading";
  const DoFetch({required this.value});
}

class InstanceIncrement {
  const InstanceIncrement();
}
