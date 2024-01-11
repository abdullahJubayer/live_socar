import 'package:flutter/material.dart';
import 'package:live_score/utils/theme/custom_themes.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown(
      {Key? key,
      this.hint,
      this.value,
      this.items,
      this.onChanged,
      this.validator,
      this.contentPadding,
      this.disableDropdown = false,
      this.isDense = true,
      double? borderRadius})
      : borderRadius = borderRadius ?? 30,
        super(key: key);
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final String? hint;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final bool disableDropdown;
  final bool isDense;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return DropdownButtonFormField<T>(
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          fillColor: Colors.transparent,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: theme.colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: theme.colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: theme.colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          filled: true,
        ),
        value: widget.value,
        hint: Text(widget.hint ?? ''),
        icon: const Icon(Icons.keyboard_arrow_down),
        // isDense: widget.isDense,
        isExpanded: true,
        items: widget.items,
        onChanged: widget.disableDropdown ? null : widget.onChanged);
  }
}
