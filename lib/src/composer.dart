abstract class ZplComposer {
  /// Builds this ZPL composer instance
  ZplComposer build();

  /// Builds this ZPL from a string
  ZplComposer fromString(String zplString);

  /// Convert this ZPL instance to a string
  String toString();
}
