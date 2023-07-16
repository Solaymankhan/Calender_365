import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class notification_service {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/notification_icon',
      [
        NotificationChannel(
          channelGroupKey: 'calendar_365_channel',
          channelKey: 'calendar_365_channel',
          channelName: 'calendar 365',
          defaultColor: orangeColor,
          channelDescription: 'calendar 365',
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          soundSource: 'resource://raw/notification_tone_2',
          criticalAlerts: true,
        )
      ],
    );


    await AwesomeNotifications().isNotificationAllowed().then(
          (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  /// Use this method to detect when a new notification or a schedule is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  /// Use this method to detect every time that a new notification is displayed
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  /// Use this method to detect if the user dismissed a notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  /// Use this method to detect when the user taps on a notification or action button
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onActionReceivedMethod');
    final payload = receivedAction.payload ?? {};
    if (payload["navigate"] == "true") {
      print("Solayman");
    }
  }

  static Future<void> showNotification({
    required final int id,
    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool scheduled = true,
    final int? year,
    final int? month,
    final int? day,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'calendar_365_channel',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: category,
        payload: payload,
        largeIcon: bigPicture,
        bigPicture: bigPicture,
      ),
      actionButtons: actionButtons,
      schedule:NotificationCalendar(
        year: year,
        month: month,
        day: day,
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        allowWhileIdle: true,
      )
    );
  }

  static Future<void> cancelNotificationMethod(int id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }

}