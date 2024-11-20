part of './../export_manager/export_manager.dart';

extension AlignedText on Widget {
  alignAtStart() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: this,
    );
  }

  alignAtEnd() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: this,
    );
  }
}
