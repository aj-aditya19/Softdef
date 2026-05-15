import 'package:flutter/material.dart';

class MealBlock {
  final String title;
  final String? prepLabel;
  final String? prepTime;
  final String? serveLabel;
  final String? serveTime;
  final String? menuLabel;
  final String? counterLabel;
  final double startHour;
  final double endHour;

  const MealBlock({
    required this.title,
    this.prepLabel,
    this.prepTime,
    this.serveLabel,
    this.serveTime,
    this.menuLabel,
    this.counterLabel,
    required this.startHour,
    required this.endHour,
  });
}

class StaffShift {
  final String duration;
  final String name;
  final String role;
  final double startHour;
  final double endHour;

  const StaffShift({
    required this.duration,
    required this.name,
    required this.role,
    required this.startHour,
    required this.endHour,
  });
}

class ScheduleViewModel extends ChangeNotifier {
  // Expose mock data used by Schedule screen
  final List<MealBlock> guestMeals = const [
    MealBlock(
      title: 'Break Fast',
      prepLabel: 'Preparation Time',
      prepTime: '6:00 AM – 8:30 AM',
      serveLabel: 'Serve Time',
      serveTime: '8:30 AM – 11:00 AM',
      menuLabel: 'Menu',
      counterLabel: 'Live Counter',
      startHour: 0,
      endHour: 5,
    ),
    MealBlock(
      title: 'Lunch',
      prepLabel: 'Preparation Time',
      prepTime: '11:00 AM – 12:30 PM',
      serveLabel: 'Serve Time',
      serveTime: '12:30 PM – 03:00 PM',
      menuLabel: 'Menu',
      counterLabel: 'Live Counter',
      startHour: 5,
      endHour: 10,
    ),
    MealBlock(
      title: 'Dinner',
      prepLabel: 'Preparation Time',
      prepTime: '05:00 PM – 07:30 PM',
      serveLabel: 'Serve Time',
      serveTime: '07:30 PM – 10:00 PM',
      menuLabel: 'Menu',
      counterLabel: 'Live Counter',
      startHour: 10,
      endHour: 15,
    ),
  ];

  final List<MealBlock> eventMeals = const [
    MealBlock(
      title: 'Lunch',
      prepLabel: 'Event Name 1',
      prepTime: 'Preparation Time\n10:00 AM – 12:00 PM',
      serveLabel: 'Event Name 1',
      serveTime: 'Serve Time\n12:00 PM – 2:30 PM',
      menuLabel: 'Menu',
      counterLabel: 'Live Counter',
      startHour: 5,
      endHour: 10,
    ),
    MealBlock(
      title: 'Dinner',
      prepLabel: 'Event Name 2',
      prepTime: 'Preparation Time\n5:00 PM – 7:00 PM',
      serveLabel: 'Event Name 2',
      serveTime: 'Serve Time\n7:00 PM – 9:30 PM',
      menuLabel: 'Menu',
      counterLabel: 'Live Counter',
      startHour: 10,
      endHour: 15,
    ),
  ];

  final List<List<StaffShift>> shiftRows = const [
    [
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 0,
        endHour: 4,
      ),
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 6,
        endHour: 10,
      ),
    ],
    [
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 1,
        endHour: 6,
      ),
    ],
    [
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 3,
        endHour: 8,
      ),
    ],
    [
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 1,
        endHour: 7,
      ),
    ],
    [
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 0,
        endHour: 4,
      ),
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 6,
        endHour: 10,
      ),
    ],
    [
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 0,
        endHour: 5,
      ),
    ],
    [
      StaffShift(
        duration: '3:45/8hour',
        name: 'Rajeev Singh',
        role: 'Head Chef',
        startHour: 3,
        endHour: 8,
      ),
    ],
  ];
}
