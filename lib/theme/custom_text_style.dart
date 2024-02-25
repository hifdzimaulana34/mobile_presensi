import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumff0047ff => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF0047FF),
      );
  static get bodyMediumff0065fc => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF0065FC),
      );
  static get bodyMediumffffffff => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFFFFFFFF),
      );
  // Headline text style
  static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black900,
      );
  static get headlineSmallTajawal => theme.textTheme.headlineSmall!.tajawal;
  static get headlineSmallTajawalBlack900 =>
      theme.textTheme.headlineSmall!.tajawal.copyWith(
        color: appTheme.black900,
      );
  static get headlineSmallTajawalMedium =>
      theme.textTheme.headlineSmall!.tajawal.copyWith(
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeBlack900Black => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w900,
      );
  static get titleLargeBlack900_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );
  static get titleLargeGray50 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray50,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeInika => theme.textTheme.titleLarge!.inika.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeInikaBlack900 =>
      theme.textTheme.titleLarge!.inika.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeInknutAntiquaGray5001 =>
      theme.textTheme.titleLarge!.inknutAntiqua.copyWith(
        color: appTheme.gray5001,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleLargeff000000 => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
  static get titleLargeff000000Regular => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w400,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleSmallTajawalOnPrimaryContainer =>
      theme.textTheme.titleSmall!.tajawal.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallTajawalWhiteA700 =>
      theme.textTheme.titleSmall!.tajawal.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get inika {
    return copyWith(
      fontFamily: 'Inika',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get tajawal {
    return copyWith(
      fontFamily: 'Tajawal',
    );
  }

  TextStyle get inknutAntiqua {
    return copyWith(
      fontFamily: 'Inknut Antiqua',
    );
  }
}
