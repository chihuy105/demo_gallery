import 'package:app_ui/src/layout/dimens.dart';
import 'package:app_ui/src/typography/app_text_theme.dart';
import 'package:flutter/material.dart';

class InputStyleProps {
  const InputStyleProps({
    this.inputDecoration,
    this.enable,
    this.showBorder = true,
    this.suffixIconWidth,
    this.iconSize,
    this.backgroundColor,
    this.borderWidth,
    this.borderColor,
    this.radius,
  });

  final InputDecoration? inputDecoration;

  final bool? enable;

  final double? suffixIconWidth;
  final double? iconSize;
  final Color? backgroundColor;

  final bool showBorder;
  final double? borderWidth;
  final Color? borderColor;
  final double? radius;

  InputStyleProps copyWith({
    InputDecoration? inputDecoration,
    bool? enable,
    double? suffixIconWidth,
    double? iconSize,
    Color? backgroundColor,
    bool? showBorder,
    double? borderWidth,
    Color? borderColor,
    double? radius,
  }) {
    return InputStyleProps(
      inputDecoration: inputDecoration ?? this.inputDecoration,
      enable: enable ?? this.enable,
      suffixIconWidth: suffixIconWidth ?? this.suffixIconWidth,
      iconSize: iconSize ?? this.iconSize,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      showBorder: showBorder ?? this.showBorder,
      borderWidth: borderWidth ?? this.borderWidth,
      borderColor: borderColor ?? this.borderColor,
      radius: radius ?? this.radius,
    );
  }

}

class AppTextField {
  static const double defaultRadius = Dimens.rad;
  static const double defaultBorderWidth = 2;
  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 10);
  static const double defaultOpacity = 0.2;

  static InputDecoration primaryStyle(
    BuildContext context, {
    InputStyleProps? inputStyleProps,
  }) {
    final props = inputStyleProps ?? const InputStyleProps();
    final borderRadius = BorderRadius.circular(defaultRadius);

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: props.borderColor ?? Theme.of(context).dividerColor,
      ),
    );

    final contentPadding = props.inputDecoration?.contentPadding;
    return InputDecoration(
      enabled: props.enable ?? true,
      helperText: props.inputDecoration?.helperText,
      contentPadding: contentPadding,
      isDense: contentPadding != null,
      counter: props.inputDecoration?.counter,

      // Border
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,

      //
      filled: true,
      hintStyle: props.inputDecoration?.hintStyle ?? context.themeText.textHint,
      // labelText: props.labelText,
      fillColor: props.backgroundColor ?? Theme.of(context).canvasColor,
      hintText: props.inputDecoration?.hintText,

      // Icons
      prefixIcon: _buildPrefix(context, props),
      // prefixIconConstraints: const BoxConstraints(maxWidth: 62),
      suffixIcon: props.inputDecoration?.suffixIcon,
      suffixIconConstraints: BoxConstraints(maxWidth: props.suffixIconWidth ?? 62),
    );
  }

  static Widget? _buildPrefix(
    BuildContext context,
    InputStyleProps props,
  ) {
    if (props.inputDecoration?.prefixIcon == null && props.inputDecoration?.labelText == null) return null;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (props.inputDecoration?.labelText?.isNotEmpty == true)
          Text(
            props.inputDecoration?.labelText ?? '',
            style: TextStyle(color: Theme.of(context).hintColor),
            overflow: TextOverflow.ellipsis,
          ),
        props.inputDecoration?.prefixIcon ?? const SizedBox.shrink(),
      ],
    );
  }
}
