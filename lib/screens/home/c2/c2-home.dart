import 'package:flutter/material.dart';

class C2HomeView extends StatelessWidget {
  const C2HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Trang chủ Đại lý'),
            Text(
              'Chào mừng Đại lý cấp 2 Toàn Thắng!',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 22,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Khai báo giao dịch',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Additional content can be added here
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Hoạt động gần đây',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '11/10/2025',
              'Chờ xử lý',
              Colors.orange,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '10/10/2025',
              'Đã xác nhận',
              Colors.green,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '09/10/2025',
              'Đã xác nhận',
              Colors.green,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '08/10/2025',
              'Chờ xử lý',
              Colors.orange,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '07/10/2025',
              'Đã xác nhận',
              Colors.green,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '11/10/2025',
              'Chờ xử lý',
              Colors.orange,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '10/10/2025',
              'Đã xác nhận',
              Colors.green,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '09/10/2025',
              'Đã xác nhận',
              Colors.green,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '08/10/2025',
              'Chờ xử lý',
              Colors.orange,
            ),
            _buildRecentActivityCard(
              context,
              'Đơn hàng từ NPP Toàn Thắng',
              '07/10/2025',
              'Đã xác nhận',
              Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildRecentActivityCard(
  context,
  String title,
  String date,
  String status,
  Color statusColor,
) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: ListTile(
            leading: Icon(Icons.check_circle, color: statusColor),
            title: Text(status, style: TextStyle(fontSize: 14)),
          ),
        ),
      ],
    ),
  );
}
