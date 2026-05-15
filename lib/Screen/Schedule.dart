// import 'package:flutter/material.dart';

// class Schedule extends StatefulWidget {
//   const Schedule({super.key});

//   @override
//   State<Schedule> createState() => _ScheduleState();
// }

// class _ScheduleState extends State<Schedule> {
//   final List<String> hours = [
//     "6am",
//     "7am",
//     "8am",
//     "9am",
//     "10am",
//     "11am",
//     "12pm",
//     "1pm",
//     "2pm",
//     "3pm",
//     "4pm",
//     "5pm",
//     "6pm",
//     "7pm",
//     "8pm",
//     "9pm",
//     "10pm",
//   ];

//   final List<String> times = ["06:43"];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     width: 50,
//                     height: 25,
//                     decoration: BoxDecoration(
//                       border: Border(
//                         right: BorderSide(color: Colors.grey.shade300),
//                         top: BorderSide(color: Colors.grey.shade300),
//                       ),
//                     ),
//                   ),

//                   ...hours.map(
//                     (hour) => Container(
//                       width: 50,
//                       height: 25,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         border: Border(
//                           right: BorderSide(color: Colors.grey.shade300),
//                           bottom: BorderSide(color: Colors.grey.shade300),
//                         ),
//                       ),
//                       child: Text(
//                         hour,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     width: 50,
//                     height: 25,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                     ),
//                   ),

//                   ...List.generate(
//                     hours.length,
//                     (index) => Container(
//                       width: 50,
//                       height: 25,
//                       decoration: BoxDecoration(
//                         border: Border(
//                           right: BorderSide(color: Colors.grey.shade300),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(children: [

//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
    endHour: 9,
  ),
  MealBlock(
    title: 'Dinner',
    prepLabel: 'Preparation Time',
    prepTime: '05:00 PM – 07:30 PM',
    serveLabel: 'Serve Time',
    serveTime: '07:30 PM – 10:00 PM',
    menuLabel: 'Menu',
    counterLabel: 'Live Counter',
    startHour: 11,
    endHour: 16,
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
    startHour: 4,
    endHour: 8.5,
  ),
  MealBlock(
    title: 'Dinner',
    prepLabel: 'Event Name 2',
    prepTime: 'Preparation Time\n5:00 PM – 7:00 PM',
    serveLabel: 'Event Name 2',
    serveTime: 'Serve Time\n7:00 PM – 9:30 PM',
    menuLabel: 'Menu',
    counterLabel: 'Live Counter',
    startHour: 11,
    endHour: 15.5,
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
                  _buildMealRow(
                    'Event\nBuffet\nOrders',
                    _eventMeals,
                    hasNA: true,
                  ),
                  ..._shiftRows.map((row) => _buildShiftRow(row)),
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
                ..._hours.map(
                  (h) => SizedBox(
                    width: _kColWidth,
                    height: _kHeaderHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealRow(
    String label,
    List<MealBlock> blocks, {
    bool hasNA = false,
  }) {
    return SizedBox(
      height: _kMealRowHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: Color(0xFF333333),
              ),
            ),
          ),
          SizedBox(
            width: _gridWidth(),
            child: Stack(
              children: [
                if (hasNA)
                  Positioned(
                    left: 8,
                    top: (_kMealRowHeight - 14) / 2,
                    child: const Text(
                      'N/A',
                      style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                    ),
                  ),
                ...blocks.map(_buildMealBlock),
              ],
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
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
        ),

        child: Column(
          children: [
            // ================= TITLE =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Text(
                b.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222222),
                ),
              ),
            ),

            // ================= BODY =================
            Expanded(
              child: Row(
                children: [
                  // ================= PREP =================
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
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Flexible(
                              child: Text(
                                b.prepTime!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),

                            if (b.menuLabel != null) ...[
                              const SizedBox(height: 2),

                              Text(
                                b.menuLabel!,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),

                  // ================= SERVE =================
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
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Flexible(
                              child: Text(
                                b.serveTime!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 9,
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
                                  fontSize: 9,
                                  color: Colors.grey,
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

  Widget _mealSubBlock(String label, String time, String? link) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 9, color: Color(0xFF555555)),
          ),
          const SizedBox(height: 2),
          Text(
            time,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 8.5, color: Color(0xFF777777)),
          ),
          if (link != null) ...[
            const SizedBox(height: 3),
            Text(
              link,
              style: const TextStyle(
                fontSize: 9,
                color: Color(0xFF4CAF82),
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildShiftRow(List<StaffShift> shifts) {
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
            child: Stack(children: shifts.map(_buildShiftBar).toList()),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftBar(StaffShift s) {
    final left = _hourToX(s.startHour);
    final width = _hourToWidth(s.startHour, s.endHour);

    return Positioned(
      left: left,
      top: 6,
      width: width,
      height: _kShiftRowHeight - 12,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD4F4E8),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Text(
              s.duration,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D7D57),
              ),
            ),
            const Spacer(),
            Text(
              s.name,
              style: const TextStyle(fontSize: 10, color: Color(0xFF333333)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 1,
              height: 14,
              color: Colors.grey.shade400,
            ),
            Text(
              s.role,
              style: const TextStyle(fontSize: 10, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
    );
  }
}
