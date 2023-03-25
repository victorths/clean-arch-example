import '../../commons.dart';

enum CustomFilledButtomSize {
  small,
  large,
}

class CustomFilledButtom extends StatelessWidget {
  const CustomFilledButtom({
    super.key,
    required this.text,
    required this.onPressed,
    this.expanded = true,
    this.size = CustomFilledButtomSize.small,
  });

  final CustomFilledButtomSize size;
  final bool expanded;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      height: _getHeight,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: _getTextStyle,
        ),
      ),
    );
  }

  TextStyle? get _getTextStyle {
    switch (size) {
      case CustomFilledButtomSize.small:
        return null;
      case CustomFilledButtomSize.large:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        );
    }
  }

  double get _getHeight {
    switch (size) {
      case CustomFilledButtomSize.small:
        return 32.0;
      case CustomFilledButtomSize.large:
        return 48.0;
    }
  }
}
