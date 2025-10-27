// ignore_for_file: dead_code

import 'package:flutter/material.dart';

import 'package:demo_noti/utils/context_extensions.dart';

class TransactionsThuCapScreen extends StatelessWidget {
  const TransactionsThuCapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final statusColors = context.statusColors;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Lịch sử giao dịch',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            margin: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      _buildFilterButton('Tất cả', context),
                      _buildFilterButton('Đã xác nhận', context),
                      _buildFilterButton('Chờ xử lý', context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16.0,
                  children: [
                    _buildTransactionCard(
                      context,
                      'Mua từ NPP Toàn Thắng',
                      'Ngày 20/10/2023',
                      'Bếp gas NA-123 (x5), Van ngắt (x10)',
                      'Đã xác nhận',
                      true ? statusColors.success : statusColors.warning,
                      true ? statusColors.onSuccess : statusColors.onWarning,
                    ),
                    _buildTransactionCard(
                      context,
                      'Mua từ NPP Toàn Thắng',
                      'Ngày 21/10/2023',
                      'Bếp gas NA-123 (x2), Van ngắt (x4)',
                      'Chờ xử lý',
                      false ? statusColors.success : statusColors.warning,
                      false ? statusColors.onSuccess : statusColors.onWarning,
                    ),
                    _buildTransactionCard(
                      context,
                      'Mua từ NPP Toàn Thắng',
                      'Ngày 22/10/2023',
                      'Bếp gas NA-123 (x1)',
                      'Đã xác nhận',
                      true ? statusColors.success : statusColors.warning,
                      true ? statusColors.onSuccess : statusColors.onWarning,
                    ),
                    _buildTransactionCard(
                      context,
                      'Mua từ NPP Toàn Thắng',
                      'Ngày 23/10/2023',
                      'Van ngắt (x3)',
                      'Chờ xử lý',
                      false ? statusColors.success : statusColors.warning,
                      false ? statusColors.onSuccess : statusColors.onWarning,
                    ),
                    _buildTransactionCard(
                      context,
                      'Mua từ NPP Toàn Thắng',
                      'Ngày 24/10/2023',
                      'Bếp gas NA-123 (x5)',
                      'Đã xác nhận',
                      true ? statusColors.success : statusColors.warning,
                      true ? statusColors.onSuccess : statusColors.onWarning,
                    ),
                    _buildTransactionCard(
                      context,
                      'Mua từ NPP Toàn Thắng',
                      'Ngày 25/10/2023',
                      'Bếp gas NA-123 (x2), Van ngắt (x1)',
                      'Chờ xử lý',
                      false ? statusColors.success : statusColors.warning,
                      false ? statusColors.onSuccess : statusColors.onWarning,
                    ),
                    _buildTransactionCard(
                      context,
                      'Mua từ NPP Toàn Thắng',
                      'Ngày 26/10/2023',
                      'Van ngắt (x6)',
                      'Đã xác nhận',
                      true ? statusColors.success : statusColors.warning,
                      true ? statusColors.onSuccess : statusColors.onWarning,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildFilterButton(String text, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    ),
  );
}

Widget _buildTransactionCard(
  BuildContext context,
  String title,
  String date,
  String items,
  String status,
  Color statusBgColor,
  Color statusTextColor,
) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      // color: Theme.of(context).colorScheme.primaryContainer,
      gradient: Gradient.lerp(
        const LinearGradient(colors: [Colors.white, Colors.white]),
        LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryContainer,
          Colors.white,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ), 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: statusBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          date,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        Text(items, style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}
