abstract class ZplComposer {
  /// Builds this ZPL composer instance
  /// [ZplComposer parent] represents the parent
  /// component that requested this instance to build
  ZplComposer build(ZplComposer parent);

  /// Makes a new instance based on [zplString]
  ///
  /// [zplString] the String that will be used
  /// to build this instance
  ZplComposer fromString(String zplString);

  /// Gets the ZPL code as String
  String toString();
}
