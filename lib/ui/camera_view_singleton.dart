import 'dart:ui';

/// Singleton to record size related data
class CameraViewSingleton {
  double? ratio;
  Size? screenSize;
  Size? inputImageSize;
  Size get actualPreviewSize => Size(300, 400 * 1);
}
