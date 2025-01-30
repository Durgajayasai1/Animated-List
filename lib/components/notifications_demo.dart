import 'package:animated_list/components/animated_notification_list.dart';
import 'package:animated_list/components/notification_card.dart';
import 'package:animated_list/models/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationsDemo extends StatelessWidget {
  NotificationsDemo({Key? key}) : super(key: key);

  final List<NotificationItem> notifications = List.generate(
  9,
    (index) => [
      NotificationItem(
        name: "Payment received",
        description: "_insane.dev",
        time: "15m ago",
        icon: "💸",
        color: const Color(0xFF00C9A7),
      ),
      NotificationItem(
        name: "User signed up",
        description: "_insane.dev",
        time: "10m ago",
        icon: "👤",
        color: const Color(0xFFFFB800),
      ),
      NotificationItem(
        name: "New message",
        description: "_insane.dev",
        time: "5m ago",
        icon: "💬",
        color: const Color(0xFFFF3D71),
      ),
      NotificationItem(
        name: "New event",
        description: "_insane.dev",
        time: "2m ago",
        icon: "🗞️",
        color: const Color(0xFF1E86FF),
      ),
    ][index % 4],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedNotificationList(
        children:
            notifications.map((item) => NotificationCard(item: item)).toList(),
      ),
    );
  }
}
