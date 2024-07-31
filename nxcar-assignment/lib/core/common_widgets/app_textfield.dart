import 'package:flutter/material.dart';
import 'package:nxcar/core/theme/app_colors.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.keyboardType,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        label: widget.label,
        filled: true,
        fillColor: _isFocused ? AppColors.colorCyanFA : AppColors.colorWhiteF8,
      ),
    );
  }
}
