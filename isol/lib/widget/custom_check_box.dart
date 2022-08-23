import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedFillColor;
  final Color uncheckedFillColor;
  final double? borderWidth;
  final double? checkBoxSize;
  final bool shouldShowBorder;
  final Color? borderColor;
  final double? borderRadius;

  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkedFillColor = Colors.teal,
    this.uncheckedFillColor = Colors.white,
    this.borderWidth,
    this.checkBoxSize,
    this.shouldShowBorder = false,
    this.borderColor,
    this.borderRadius,

  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildInContainer() {
    late Color fillColor;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 6)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!_checked),
      child: Container(
        width: widget.checkBoxSize,
        height: widget.checkBoxSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 6)),
          border: Border.all(
            color: widget.shouldShowBorder ? (widget.borderColor ?? Colors.teal.withOpacity(0.6)) : (!widget.value ? (widget.borderColor ?? Colors.teal.withOpacity(0.6)) : Colors.transparent),
            width: widget.shouldShowBorder ? widget.borderWidth ?? 2.0 : 1.0,
          ),
        ),
        child: _buildInContainer(),
      ),
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
