// import 'package:demo_gallery/all_file/all_file.dart';
//
// class InputStyleProps {
//   final bool? enable;
//
//   final String? helperText;
//   final String? hintText;
//   final String? labelText;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final double? suffixIconWidth;
//
//   final Widget? counter;
//
//   // Sty;e
//   final TextStyle? hintStyle;
//   final double? iconSize;
//   final EdgeInsets? contentPadding;
//
//   final Color? backgroundColor;
//
//   final bool showBorder;
//   final double borderWidth;
//   final Color? borderColor;
//   final double radius;
//
// //<editor-fold desc="Data Methods">
//
//   const InputStyleProps({
//     this.borderColor,
//     this.enable,
//     this.counter,
//     this.helperText,
//     this.hintText,
//     this.labelText,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.suffixIconWidth,
//     this.iconSize,
//     this.radius = AppTextField.defaultRadius,
//     this.borderWidth = AppTextField.defaultRadius,
//     this.contentPadding = AppTextField.defaultPadding,
//     this.backgroundColor,
//     this.hintStyle,
//     this.showBorder = true,
//   });
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is InputStyleProps &&
//           runtimeType == other.runtimeType &&
//           enable == other.enable &&
//           helperText == other.helperText &&
//           hintText == other.hintText &&
//           labelText == other.labelText &&
//           prefixIcon == other.prefixIcon &&
//           suffixIcon == other.suffixIcon &&
//           suffixIconWidth == other.suffixIconWidth &&
//           counter == other.counter &&
//           hintStyle == other.hintStyle &&
//           iconSize == other.iconSize &&
//           contentPadding == other.contentPadding &&
//           backgroundColor == other.backgroundColor &&
//           showBorder == other.showBorder &&
//           borderWidth == other.borderWidth &&
//           borderColor == other.borderColor &&
//           radius == other.radius);
//
//   @override
//   int get hashCode =>
//       enable.hashCode ^
//       helperText.hashCode ^
//       hintText.hashCode ^
//       labelText.hashCode ^
//       prefixIcon.hashCode ^
//       suffixIcon.hashCode ^
//       suffixIconWidth.hashCode ^
//       counter.hashCode ^
//       hintStyle.hashCode ^
//       iconSize.hashCode ^
//       contentPadding.hashCode ^
//       backgroundColor.hashCode ^
//       showBorder.hashCode ^
//       borderWidth.hashCode ^
//       borderColor.hashCode ^
//       radius.hashCode;
//
//   @override
//   String toString() {
//     return 'InputStyleProps{' +
//         ' enable: $enable,' +
//         ' helperText: $helperText,' +
//         ' hintText: $hintText,' +
//         ' labelText: $labelText,' +
//         ' prefixIcon: $prefixIcon,' +
//         ' suffixIcon: $suffixIcon,' +
//         ' suffixIconWidth: $suffixIconWidth,' +
//         ' counter: $counter,' +
//         ' hintStyle: $hintStyle,' +
//         ' iconSize: $iconSize,' +
//         ' contentPadding: $contentPadding,' +
//         ' backgroundColor: $backgroundColor,' +
//         ' showBorder: $showBorder,' +
//         ' borderWidth: $borderWidth,' +
//         ' borderColor: $borderColor,' +
//         ' radius: $radius,' +
//         '}';
//   }
//
//   InputStyleProps copyWith({
//     bool? enable,
//     String? helperText,
//     String? hintText,
//     String? labelText,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     double? suffixIconWidth,
//     Widget? counter,
//     TextStyle? hintStyle,
//     double? iconSize,
//     EdgeInsets? contentPadding,
//     Color? backgroundColor,
//     bool? showBorder,
//     double? borderWidth,
//     Color? borderColor,
//     double? radius,
//   }) {
//     return InputStyleProps(
//       enable: enable ?? this.enable,
//       helperText: helperText ?? this.helperText,
//       hintText: hintText ?? this.hintText,
//       labelText: labelText ?? this.labelText,
//       prefixIcon: prefixIcon ?? this.prefixIcon,
//       suffixIcon: suffixIcon ?? this.suffixIcon,
//       suffixIconWidth: suffixIconWidth ?? this.suffixIconWidth,
//       counter: counter ?? this.counter,
//       hintStyle: hintStyle ?? this.hintStyle,
//       iconSize: iconSize ?? this.iconSize,
//       contentPadding: contentPadding ?? this.contentPadding,
//       backgroundColor: backgroundColor ?? this.backgroundColor,
//       showBorder: showBorder ?? this.showBorder,
//       borderWidth: borderWidth ?? this.borderWidth,
//       borderColor: borderColor ?? this.borderColor,
//       radius: radius ?? this.radius,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'enable': this.enable,
//       'helperText': this.helperText,
//       'hintText': this.hintText,
//       'labelText': this.labelText,
//       'prefixIcon': this.prefixIcon,
//       'suffixIcon': this.suffixIcon,
//       'suffixIconWidth': this.suffixIconWidth,
//       'counter': this.counter,
//       'hintStyle': this.hintStyle,
//       'iconSize': this.iconSize,
//       'contentPadding': this.contentPadding,
//       'backgroundColor': this.backgroundColor,
//       'showBorder': this.showBorder,
//       'borderWidth': this.borderWidth,
//       'borderColor': this.borderColor,
//       'radius': this.radius,
//     };
//   }
//
//   factory InputStyleProps.fromMap(Map<String, dynamic> map) {
//     return InputStyleProps(
//       enable: map['enable'] as bool,
//       helperText: map['helperText'] as String,
//       hintText: map['hintText'] as String,
//       labelText: map['labelText'] as String,
//       prefixIcon: map['prefixIcon'] as Widget,
//       suffixIcon: map['suffixIcon'] as Widget,
//       suffixIconWidth: map['suffixIconWidth'] as double,
//       counter: map['counter'] as Widget,
//       hintStyle: map['hintStyle'] as TextStyle,
//       iconSize: map['iconSize'] as double,
//       contentPadding: map['contentPadding'] as EdgeInsets,
//       backgroundColor: map['backgroundColor'] as Color,
//       showBorder: map['showBorder'] as bool,
//       borderWidth: map['borderWidth'] as double,
//       borderColor: map['borderColor'] as Color,
//       radius: map['radius'] as double,
//     );
//   }
//
// //</editor-fold>
// }
//
// class AppTextField {
//   // Default Value
//   static const double defaultRadius = Dimens.rad;
//   static const double defaultBorderWidth = 2;
//   static const EdgeInsets defaultPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 10);
//   static const double defaultOpacity = 0.2;
//
//   static InputDecoration primaryStyle(BuildContext context, {InputStyleProps? inputStyleProps}) {
//     final props = inputStyleProps ?? const InputStyleProps();
//     final borderRadius = BorderRadius.circular(props.radius);
//
//     final outlineInputBorder = OutlineInputBorder(
//       borderRadius: borderRadius,
//       borderSide: BorderSide(
//         color: props.borderColor ?? context.themeColor.divider,
//       ),
//     );
//
//     final contentPadding = props.contentPadding?.copyWith(
//       left: (props.prefixIcon != null || (props.labelText != null && props.suffixIcon != null)) ? 0 : props.contentPadding?.left,
//     );
//     return InputDecoration(
//       enabled: props.enable ?? true,
//       helperText: props.helperText,
//       contentPadding: contentPadding,
//       isDense: contentPadding != null ? true : false,
//       counter: props.counter,
//
//       // Border
//       enabledBorder: outlineInputBorder,
//       focusedBorder: outlineInputBorder,
//       border: outlineInputBorder,
//
//       //
//       filled: true,
//       hintStyle: props.hintStyle ?? context.themeText.textHint,
//       // labelText: props.labelText,
//       fillColor: props.backgroundColor ?? Theme.of(context).canvasColor,
//       hintText: props.hintText,
//
//       // Icons
//       prefixIcon: _buildPrefix(context, props),
//       // prefixIconConstraints: const BoxConstraints(maxWidth: 62),
//       suffixIcon: props.suffixIcon,
//       suffixIconConstraints: BoxConstraints(maxWidth: props.suffixIconWidth ?? 62),
//     );
//   }
//
//   static Widget? _buildPrefix(BuildContext context, InputStyleProps props) {
//     if (props.prefixIcon == null && props.labelText == null) return null;
//
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         props.labelText?.text.colorHint(context).ellipsis.make().pOnly(
//                   left: 10,
//                   right: 8,
//                 ) ??
//             const SizedBox.shrink(),
//         props.prefixIcon ?? const SizedBox.shrink(),
//       ],
//     );
//   }
// }
