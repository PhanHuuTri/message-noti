import 'package:flutter/material.dart';

// Màn hình dành riêng cho NPP (Nhà Phân Phối)
class CppScreen extends StatelessWidget {
  const CppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).shadowColor.withAlpha(20),
        title: Container(
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trang chủ NPP',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                'Chào mừng NPP Toàn Thắng!',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
                border: Border(
                  left: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 5,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.all(16.0),
              child: Text(
                '2 Giao dịch chờ xác nhận',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 8.0,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: HSLColor.fromColor(
                          Theme.of(context).colorScheme.primary,
                        ).withLightness(0.8).toColor(),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(
                              context,
                            ).shadowColor.withValues(alpha: .2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.add_box,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          "Giao dịch mới",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: HSLColor.fromColor(
                          Theme.of(context).colorScheme.primary,
                        ).withLightness(0.8).toColor(),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(
                              context,
                            ).shadowColor.withValues(alpha: .2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.history,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          "Lịch sử giao dịch",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Chờ xác nhận",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            _buildConfirmationCard(
              context,
              'Đại lý minh Anh',
              'Bếp gas NA-123 (x5), Van ngắt (x10)',
              '12/10/2025',
              () {},
            ),
            _buildConfirmationCard(
              context,
              'Cửa hàng 24h',
              'Bếp gas NA-456 (x2)',
              '11/10/2025',
              () {},
            ),
            _buildConfirmationCard(
              context,
              'Đại lý Hồng Hà',
              'Bếp gas NA-789 (x1), Van ngắt (x3), Ống dẫn gas (x4)',
              '10/10/2025',
              () {},
            ),
            _buildConfirmationCard(
              context,
              'Đại lý Minh Anh',
              'Bếp gas NA-123 (x5), Van ngắt (x10)',
              '12/10/2025',
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationCard(
    BuildContext context,
    String dealerName,
    String products,
    String date,
    VoidCallback onConfirm,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.foregroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Từ: ",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(dealerName, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Sản phẩm: ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  products,
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true,
                ),
              ),
            ],
          ),
          Text(
            'Ngày: $date',
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            onPressed: onConfirm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Xác nhận",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
