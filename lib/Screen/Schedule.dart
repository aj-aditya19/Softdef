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

const double _kColWidth = 60.0;
const double _kRowLabelWidth = 70.0;
const double _kHeaderHeight = 30.0;
const double _kMealRowHeight = 110.0;
const double _kShiftRowHeight = 44.0;

const List<String> _hours = [
  '6am',
  '7am',
  '8am',
  '9am',
  '10am',
  '11am',
  '12pm',
  '1pm',
  '2pm',
  '3pm',
  '4pm',
  '5pm',
  '6pm',
  '7pm',
  '8pm',
  '9pm',
  '10pm',
];

final List<MealBlock> _guestMeals = [
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

final List<MealBlock> _eventMeals = [
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

final List<List<StaffShift>> _shiftRows = [
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
  [
    StaffShift(
      duration: '3:45/8hour',
      name: 'Rajeev Singh',
      role: 'Head Chef',
      startHour: 1,
      endHour: 7,
    ),
  ],
];

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final _horizScroll = ScrollController();
  final _vertScroll = ScrollController();

  double _hourToX(double hour) => hour * _kColWidth;
  double _hourToWidth(double start, double end) => (end - start) * _kColWidth;
  double _gridWidth() => _hours.length * _kColWidth;
  double _totalWidth() => _kRowLabelWidth + _gridWidth();

  @override
  void dispose() {
    _horizScroll.dispose();
    _vertScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _vertScroll,
          child: SingleChildScrollView(
            controller: _horizScroll,
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: _totalWidth(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTimeHeader(),
                  _buildMealRow('Guest\nBuffet', _guestMeals),
                  _buildMealRow('Event\nBuffet\nOrders', _eventMeals),
                  ..._shiftRows.asMap().entries.map(
                    (entry) => _buildShiftRow(entry.value, entry.key),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeHeader() {
    return SizedBox(
      height: _kHeaderHeight * 2,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: _kRowLabelWidth,
                  height: _kHeaderHeight,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,

                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1.2),
                      right: BorderSide(color: Colors.grey, width: 1.2),
                    ),
                  ),
                ),
                ..._hours.map(
                  (h) => SizedBox(
                    width: _kColWidth,
                    height: _kHeaderHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          h,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF444444),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: _kRowLabelWidth,
                  height: _kHeaderHeight,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,

                    border: Border(
                      right: BorderSide(color: Colors.grey, width: 1.2),
                    ),
                  ),
                ),
                ..._hours.asMap().entries.map((entry) {
                  final index = entry.key;
                  final h = entry.value;

                  final bool isCurrent = index == 0;

                  return SizedBox(
                    width: _kColWidth,
                    height: _kHeaderHeight,
                    child: Container(
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: isCurrent ? Colors.black : Colors.white,

                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                          right: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),

                      child: Text(
                        isCurrent ? '6:35 AM' : "",

                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isCurrent
                              ? Colors.white
                              : const Color(0xFF444444),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealRow(String label, List<MealBlock> blocks) {
    final List<Map<String, dynamic>> mealSlots = [
      {"title": "Break Fast", "start": 0.0, "end": 5.0},
      {"title": "Lunch", "start": 5.0, "end": 10.0},
      {"title": "Dinner", "start": 10.0, "end": 15.0},
    ];

    return SizedBox(
      height: _kMealRowHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: _kRowLabelWidth,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey.shade400, width: 1.2),
                bottom: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
          ),

          SizedBox(
            width: _gridWidth(),
            child: Stack(
              children: mealSlots.map((slot) {
                final MealBlock? meal = blocks.cast<MealBlock?>().firstWhere(
                  (b) => b?.title == slot["title"],
                  orElse: () => null,
                );

                if (meal != null) {
                  return _buildMealBlock(meal);
                }

                return Positioned(
                  left: _hourToX(slot["start"]),
                  top: 0,
                  width: _hourToWidth(slot["start"], slot["end"]),
                  height: _kMealRowHeight,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                        right: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: const Text(
                      'N/A',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF999999),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealBlock(MealBlock b) {
    final left = _hourToX(b.startHour);
    final width = _hourToWidth(b.startHour, b.endHour);

    return Positioned(
      left: left,
      top: 0,
      width: width,
      height: _kMealRowHeight,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
            right: BorderSide(color: Colors.grey.shade300),
          ),
        ),

        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Text(
                b.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF222222),
                ),
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  if (b.prepLabel != null)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              b.prepLabel!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Flexible(
                              child: Text(
                                b.prepTime!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),

                            if (b.menuLabel != null) ...[
                              const SizedBox(height: 2),

                              Text(
                                b.counterLabel!,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 64, 210, 64),

                                  decoration: TextDecoration.underline,
                                  decorationColor: Color.fromARGB(
                                    255,
                                    64,
                                    210,
                                    64,
                                  ),
                                  decorationThickness: 1.5,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),

                  if (b.serveLabel != null)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              b.serveLabel!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Flexible(
                              child: Text(
                                b.serveTime!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),

                            if (b.counterLabel != null) ...[
                              const SizedBox(height: 2),

                              Text(
                                b.counterLabel!,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 64, 210, 64),

                                  decoration: TextDecoration.underline,
                                  decorationColor: Color.fromARGB(
                                    255,
                                    64,
                                    210,
                                    64,
                                  ),
                                  decorationThickness: 1.5,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftRow(List<StaffShift> shifts, int rowIndex) {
    final bool isYellowRow = rowIndex == 1 || rowIndex == 5;

    return SizedBox(
      height: _kShiftRowHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _kRowLabelWidth,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
            ),
          ),

          SizedBox(
            width: _gridWidth(),
            child: Stack(
              children: shifts.map((shift) {
                return _buildShiftBar(shift, isYellowRow);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftBar(StaffShift s, bool isYellow) {
    final left = _hourToX(s.startHour);
    final width = _hourToWidth(s.startHour, s.endHour);

    final bgColor = isYellow
        ? const Color(0xFFFFF3CD)
        : const Color(0xFFD4F4E8);

    final textColor = isYellow
        ? const Color(0xFFB78103)
        : const Color(0xFF2D7D57);

    return Positioned(
      left: left,
      top: 6,
      width: width,
      height: _kShiftRowHeight - 12,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
        ),

        padding: const EdgeInsets.symmetric(horizontal: 8),

        child: Row(
          children: [
            Text(
              s.duration,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),

            const Spacer(),

            Text(
              s.name,
              style: const TextStyle(fontSize: 12, color: Color(0xFF333333)),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 1,
              height: 14,
              color: Colors.grey.shade400,
            ),

            Text(
              s.role,
              style: const TextStyle(fontSize: 12, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
    );
  }
}
