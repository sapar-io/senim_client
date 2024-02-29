import 'package:flutter/material.dart';

enum DashboardItemType { home, logistics, broker, certification, notification }

class DashboardItemModel {
  final DashboardItemType type;

  DashboardItemModel({required this.type});

  int get currentIndex {
    switch (type) {
      case DashboardItemType.home:
        return 0;
      case DashboardItemType.logistics:
        return 1;
      case DashboardItemType.broker:
        return 2;
      case DashboardItemType.certification:
        return 3;
      case DashboardItemType.notification:
        return 4;
    }
  }

  String get title {
    switch (type) {
      case DashboardItemType.home:
        return "Главная";
      case DashboardItemType.logistics:
        return "Логистика";
      case DashboardItemType.broker:
        return "Брокерство";
      case DashboardItemType.certification:
        return "Сертификация";
      case DashboardItemType.notification:
        return "Уведомление";
    }
  }

  IconData get iconData {
    switch (type) {
      case DashboardItemType.home:
        return Icons.home;
      case DashboardItemType.logistics:
        return Icons.local_shipping;
      case DashboardItemType.broker:
        return Icons.query_stats;
      case DashboardItemType.certification:
        return Icons.document_scanner_outlined;
      case DashboardItemType.notification:
        return Icons.notifications;
    }
  }

  static List<DashboardItemModel> menuItems = [
    DashboardItemModel(type: DashboardItemType.home),
    DashboardItemModel(type: DashboardItemType.logistics),
    DashboardItemModel(type: DashboardItemType.broker),
    DashboardItemModel(type: DashboardItemType.certification),
    DashboardItemModel(type: DashboardItemType.notification),
  ];
}