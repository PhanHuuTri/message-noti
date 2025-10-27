import 'package:demo_noti/data/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = Get.find<ThemeService>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.foregroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).appBarTheme.shadowColor!.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'GIAO DIỆN',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.blueGrey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        themeService.theme.value == ThemeMode.light
                            ? 'Light Mode'
                            : 'Dark Mode',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Switch(
                        value: Theme.of(context).brightness == Brightness.dark,
                        onChanged: (value) {
                          // Handle theme change
                          // Provider.of<ThemeManager>(
                          //   context,
                          //   listen: false,
                          // ).toggleTheme();
                          themeService.switchTheme();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.foregroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).appBarTheme.shadowColor!.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ACCOUNT',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.blueGrey),
                    ),
                  ),
                  ListTile(
                    // leading: Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
                    contentPadding: EdgeInsetsGeometry.symmetric(
                      horizontal: 20,
                    ),
                    title: Text(
                      'Thông tin cá nhân',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    // subtitle: Text(),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Handle email tap
                    },
                  ),
                  ListTile(
                    // leading: Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
                    contentPadding: EdgeInsetsGeometry.symmetric(
                      horizontal: 20,
                    ),
                    title: Text(
                      'Đổi mật khẩu',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    // subtitle: Text(),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Handle email tap
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
