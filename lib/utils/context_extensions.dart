import 'package:demo_noti/utils/status-color.dart';
import 'package:flutter/material.dart';

/// Cung cấp các phương thức truy cập nhanh đến các thuộc tính theme tùy chỉnh.
extension CustomThemeExtension on BuildContext {
  /// Truy cập nhanh đến các màu trạng thái (success, warning) đã được định nghĩa
  /// trong ThemeExtension.
  ///
  /// Thay vì viết: Theme.of(this).extension<AppStatusColors>()!,
  /// bạn chỉ cần viết: this.statusColors
  AppStatusColors get statusColors =>
      Theme.of(this).extension<AppStatusColors>()!;
}
