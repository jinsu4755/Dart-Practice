extension StringListExtension on List<String> {
  List<int>? mapToIntOrNull() {
    List<int> convertedIntegers = [];
    for (String element in this) {
      final int? parsed = int.tryParse(element);
      if (parsed == null) return null;
      convertedIntegers.add(parsed);
    }
    return convertedIntegers.toList();
  }
}
