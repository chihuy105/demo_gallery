import 'package:app_ui/src/layout/dimens.dart';
import 'package:flutter/material.dart';

class AppButton {
  AppButton._();

  static const double defaultRadius = Dimens.rad;
  static const double defaultElevation = Dimens.elevation_zero;
  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(horizontal: Dimens.pad_XL, vertical: Dimens.pad_XS);
  static const double defaultOpacity = 0.2;
  static const double defaultBorderWidth = 1;

  static ButtonStyle primaryStyle(BuildContext context, {BtnStyleProps? props}) {
    return ElevatedButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).primaryColor,
      padding: defaultPadding,
      elevation: defaultElevation,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
      ),
      shadowColor: Colors.transparent,
    ).merge(props);
  }

  static ButtonStyle ghostStyle(BuildContext context, {BtnStyleProps? props}) {
    final styleFrom = ElevatedButton.styleFrom(
      foregroundColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      padding: defaultPadding,
      elevation: defaultElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: defaultBorderWidth,
        ),
      ),
      shadowColor: Colors.transparent,
    );
    return styleFrom
        .copyWith(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              side: BorderSide(
                color: states.contains(MaterialState.disabled) ? Theme.of(context).disabledColor : Theme.of(context).primaryColor,
                width: defaultBorderWidth,
              ),
            ),
          ),
        )
        .merge(props);
  }
}

class BtnStyleProps extends ButtonStyle {
  const BtnStyleProps({
    super.foregroundColor,
    super.padding,
    super.elevation,
  });

  static BtnStyleProps create({
    Color? foregroundColor,
  }) {
    return BtnStyleProps(
      foregroundColor: MaterialStateProperty.resolveWith((states) => foregroundColor),
    );
  }
}
