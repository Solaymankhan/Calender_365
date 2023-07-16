import 'package:calendar_365/viewModels/notifications/notification_services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

save_note_notification_calendar(
    DateTime date, String title, String body,int id) async {
  await notification_service.showNotification(
      id: id,
      title: title,
      body: body,
      notificationLayout: NotificationLayout.Inbox,
      year: date.year,
      month: date.month,
      day: date.day);
}

save_holiday_notification_calendar(
    int id, String body,String picture,int year,int month,int day) async {
  await notification_service.showNotification(
      notificationLayout: NotificationLayout.BigPicture,
      id: id,
      title: "Holiday",
      body: body,
      bigPicture:picture,
      year: year,
      month: month,
      day:day);
}
