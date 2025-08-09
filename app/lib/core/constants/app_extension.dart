import 'package:app/core/constants/assets_manager.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:animate_do/animate_do.dart';

extension NavigationExtension on material.BuildContext {
  Future<T?> push<T>(material.Widget page) {
    return material.Navigator.push<T>(
      this,
      material.MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<T?> pushReplacement<T, TO>(material.Widget page) {
    return material.Navigator.pushReplacement<T, TO>(
      this,
      material.MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push and remove all previous routes using a Widget
  Future<T?> pushAndRemoveAll<T>(material.Widget page) {
    return material.Navigator.pushAndRemoveUntil<T>(
      this,
      material.MaterialPageRoute(builder: (_) => page),
      (_) => false,
    );
  }

  /// Pop current screen
  void pop<T extends Object?>([T? result]) {
    material.Navigator.pop(this, result);
  }

  /// Push a named route
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    return material.Navigator.pushNamed<T>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  /// Replace current route with named route
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return material.Navigator.pushReplacementNamed<T, TO>(
      this,
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  /// Push a named route and remove all previous routes
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    material.RoutePredicate predicate, {
    Object? arguments,
  }) {
    return material.Navigator.pushNamedAndRemoveUntil<T>(
      this,
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  Future<T?> pushWithAnimation<T>(
    material.Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    material.Curve curve = material.Curves.easeInOut,
  }) {
    return material.Navigator.push<T>(
      this,
      material.PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          final offsetAnimation = animation.drive(
            material.Tween(begin: const material.Offset(1.0, 0.0), end: material.Offset.zero).chain(material.CurveTween(curve: curve)),
          );
          return material.SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: duration,
      ),
    );
  }

  Future<T?> pushReplacementWithAnimation<T, TO>(
    material.Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    material.Curve curve = material.Curves.easeInOut,
  }) {
    return material.Navigator.pushReplacement<T, TO>(
      this,
      material.PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          final offsetAnimation = animation.drive(
            material.Tween(begin: const material.Offset(1.0, 0.0), end: material.Offset.zero).chain(material.CurveTween(curve: curve)),
          );
          return material.SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: duration,
      ),
    );
  }

  Future<T?> pushAndRemoveAllWithAnimation<T>(
    material.Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    material.Curve curve = material.Curves.easeInOut,
  }) {
    return material.Navigator.pushAndRemoveUntil<T>(
      this,
      material.PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          final offsetAnimation = animation.drive(
            material.Tween(begin: const material.Offset(1.0, 0.0), end: material.Offset.zero).chain(material.CurveTween(curve: curve)),
          );
          return material.SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: duration,
      ),
      (_) => false,
    );
  }
}

extension ShimmerExtension on Widget {
  Widget withShimmer({
    bool isShow = true,
    Color? color,
    Key? key,
  }) {
    return _ShimmerWrapper(
      key: key,
      isShow: isShow,
      color: color,
      child: this,
    );
  }
}

class _ShimmerWrapper extends StatelessWidget {
  final Widget child;
  final bool isShow;
  final Color? color;

  const _ShimmerWrapper({
    super.key,
    required this.child,
    required this.isShow,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (!isShow) return child;

    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.onSurface.withOpacity(.05),
      highlightColor: Theme.of(context).colorScheme.onSurface.withOpacity(.1),
      child: Container(
        color: color ?? Theme.of(context).colorScheme.surface,
        child: child,
      ),
    );
  }
}

extension PopupExtension on BuildContext {
  // Show an AlertDialog
  Future<void> showAlertDialog({
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: material.Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(height: 16),
              // Center(child: Image.asset(AssetsManager.marketiLogo, height: 64, fit: BoxFit.cover)),
              SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          content: Text(content, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            if (cancelText != null)
              TextButton(
                onPressed: () {
                  if (onCancel != null) onCancel();
                  Navigator.of(context).pop();
                },
                child: Text(cancelText),
              ),
            if (confirmText != null)
              TextButton(
                onPressed: () {
                  if (onConfirm != null) {
                    onConfirm();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(confirmText),
              ),
          ],
        );
      },
    );
  }

  // Show a BottomSheet
  Future<void> showCustomBottomSheet({
    required Widget child,
    bool isDismissible = true,
    ShapeBorder? shape,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<void>(
      context: this,
      isDismissible: isDismissible,
      shape: shape,
      backgroundColor: backgroundColor,
      builder: (BuildContext context) => child,
    );
  }

  // Show a SnackBar
  void showSnackBar({
    required String message,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message, style: Theme.of(this).textTheme.bodyMedium), action: action, duration: duration, behavior: SnackBarBehavior.floating),
    );
  }

  // Show a simple dialog
  Future<void> showSimpleDialog({
    required String title,
    required String content,
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    return showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: material.Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Center(child: Image.asset(AssetsManager.marketiLogo, height: 64, fit: BoxFit.cover)),
              Text(title),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(content),
            ),
            if (buttonText != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (onButtonPressed != null) onButtonPressed();
                    Navigator.of(context).pop();
                  },
                  child: Text(buttonText),
                ),
              ),
          ],
        );
      },
    );
  }

  // Show a loading dialog
  Future<void> showLoadingDialog({
    String message = 'Loading...',
  }) {
    return showDialog<void>(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              material.SizedBox(child: CircularProgressIndicator(color: AppColors.lightBlue100)),
              const SizedBox(width: 20),
              Text(message, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.darkBlue900)),
            ],
          ),
        );
      },
    );
  }

  // Show a confirmation dialog
  Future<bool> showConfirmationDialog({
    required String title,
    required String content,
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) {
    return showDialog<bool>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: material.Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Center(
                child: Image.asset(
                  AssetsManager.marketiLogo,
                  height: 64,
                  fit: BoxFit.contain,
                ),
              ),
              Text(title),
            ],
          ),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }
}

extension MediaQueryValues on BuildContext {
  /// Screen width
  double get width => MediaQuery.of(this).size.width;

  /// Screen height
  double get height => MediaQuery.of(this).size.height;

  /// Text scale factor from device settings
  double get textScale => MediaQuery.of(this).textScaleFactor;

  /// Safe area paddings (top, bottom, etc.)
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Height excluding safe area (status bar & nav bar)
  double get safeHeight => height - padding.top - padding.bottom;

  /// Reference design size
  static const double _designWidth = 375;
  static const double _designHeight = 812;

  /// Scale size horizontally based on design width
  double scaleWidth(double size) => (width / _designWidth) * size;

  /// Scale size vertically based on design height
  double scaleHeight(double size) => (height / _designHeight) * size;

  /// Scale font with respect to screen width and text scale
  double scaleFont(double size) {
    final scaledSize = (width / _designWidth) * size;
    return scaledSize * textScale;
  }

  /// Scale radius based on design width
  double scaleRadius(double size) => scaleWidth(size);

  /// Smart scale: uses the smaller ratio between width and height
  double scaleSmart(double size) {
    final widthRatio = width / _designWidth;
    final heightRatio = height / _designHeight;
    return size * (widthRatio < heightRatio ? widthRatio : heightRatio);
  }
}

extension AppDecorations on BoxDecoration {
  static BoxDecoration get bottomNavigationBar => BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xB2B2CCFF), // #B2CCFFB2
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x80B2CCFF), // #B2CCFF80
            offset: Offset(0, -1),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      );
}

extension AnimateDoExt2 on Widget {
  // Fades
  Widget fadeIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeIn(duration: duration, delay: delay, child: this);

  Widget fadeInDown({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeInDown(duration: duration, delay: delay, child: this);

  Widget fadeInUp({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeInUp(duration: duration, delay: delay, child: this);

  Widget fadeInLeft({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeInLeft(duration: duration, delay: delay, child: this);

  Widget fadeInRight({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeInRight(duration: duration, delay: delay, child: this);

  // Bounces
  Widget bounceIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceIn(duration: duration, delay: delay, child: this);

  Widget bounceInDown({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceInDown(duration: duration, delay: delay, child: this);

  Widget bounceInUp({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceInUp(duration: duration, delay: delay, child: this);

  Widget bounceInLeft({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceInLeft(duration: duration, delay: delay, child: this);

  Widget bounceInRight({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceInRight(duration: duration, delay: delay, child: this);

  // Slides
  Widget slideInUp({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      SlideInUp(duration: duration, delay: delay, child: this);

  Widget slideInDown({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      SlideInDown(duration: duration, delay: delay, child: this);

  Widget slideInLeft({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      SlideInLeft(duration: duration, delay: delay, child: this);

  Widget slideInRight({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      SlideInRight(duration: duration, delay: delay, child: this);

  // Zooms
  Widget zoomIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      ZoomIn(duration: duration, delay: delay, child: this);

  Widget zoomInDown({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      ZoomInDown(duration: duration, delay: delay, child: this);

  // Widget zoomInUp({
  //   Duration duration = const Duration(milliseconds: 600),
  //   Duration delay = Duration.zero,
  // }) =>
  //     ZoomInUp(duration: duration, delay: delay, child: this);

  // Widget zoomInLeft({
  //   Duration duration = const Duration(milliseconds: 600),
  //   Duration delay = Duration.zero,
  // }) =>
  //     ZoomInLeft(duration: duration, delay: delay, child: this);

  // Widget zoomInRight({
  //   Duration duration = const Duration(milliseconds: 600),
  //   Duration delay = Duration.zero,
  // }) =>
  //     ZoomInRight(duration: duration, delay: delay, child: this);

  // Special
  Widget elasticIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      ElasticIn(duration: duration, delay: delay, child: this);

  Widget jelloIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      JelloIn(duration: duration, delay: delay, child: this);

  Widget flash({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Flash(duration: duration, delay: delay, child: this);

  Widget pulse({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Pulse(duration: duration, delay: delay, child: this);

  Widget swing({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Swing(duration: duration, delay: delay, child: this);

  Widget tada({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Tada(duration: duration, delay: delay, child: this);

  Widget wobble({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Wobble(duration: duration, delay: delay, child: this);
}
