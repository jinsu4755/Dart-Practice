enum GameState {
  restart(flag: 1),
  end(flag: 2);

  final int flag;

  const GameState({required this.flag});

  static GameState of(int flag) {
    return GameState.values.firstWhere((element) => element.flag == flag,
        orElse: () => (throw ArgumentError("Invalid flag: $flag")));
  }
}
