import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final List<String> hours = [
    "6am",
    "7am",
    "8am",
    "9am",
    "10am",
    "11am",
    "12pm",
    "1pm",
    "2pm",
    "3pm",
    "4pm",
    "5pm",
    "6pm",
    "7pm",
    "8pm",
    "9pm",
    "10pm",
  ];

  final List<Map<String, dynamic>> chefSchedules = [
    {"start": 0.2, "width": 4.5, "color": const Color(0xffD9F5EA)},
    {"start": 8.0, "width": 4.5, "color": const Color(0xffD9F5EA)},
    {"start": 0.2, "width": 7.0, "color": const Color(0xffF8F4DF)},
    {"start": 4.5, "width": 10.0, "color": const Color(0xffD9F5EA)},
    {"start": 1.2, "width": 14.0, "color": const Color(0xffD9F5EA)},
    {"start": 0.2, "width": 6.0, "color": const Color(0xffD9F5EA)},
    {"start": 8.0, "width": 6.0, "color": const Color(0xffD9F5EA)},
    {"start": 0.2, "width": 7.0, "color": const Color(0xffF8F4DF)},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth < 1024;

    // Calculate responsive width and ensure it is at least as wide as the
    // schedule content (left label + hourly columns) so the top Row won't
    // overflow. This allows horizontal scrolling when content is wider.
    final double hourWidth = isMobile ? 55.0 : (isTablet ? 70.0 : 85.0);
    final double leftLabelWidth = isMobile ? 70.0 : 90.0;
    final double contentWidth = leftLabelWidth + hours.length * hourWidth;

    // Base container width (keeps previous desktop/tablet behavior)
    double baseContainerWidth = isMobile
        ? screenWidth
        : (isTablet ? screenWidth * 0.9 : 1400.0);

    // Use the larger of baseContainerWidth and contentWidth to avoid overflow
    double containerWidth = baseContainerWidth < contentWidth
        ? contentWidth
        : baseContainerWidth;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: containerWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTopHours(isMobile, isTablet),
                buildMealSection(isMobile, isTablet),
                SizedBox(height: isMobile ? 20 : 30),
                ...List.generate(
                  chefSchedules.length,
                  (index) =>
                      buildChefBar(chefSchedules[index], isMobile, isTablet),
                ),
                SizedBox(height: isMobile ? 20 : 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTopHours(bool isMobile, bool isTablet) {
    double hourWidth = isMobile ? 55 : (isTablet ? 70 : 85);
    double leftWidth = isMobile ? 70 : 90;

    double headerHeight = isMobile ? 35 : 40;
    double bodyHeight = isMobile ? 35 : 45;

    double fontSize = isMobile ? 9 : 12;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          // TOP ROW
          Row(
            children: [
              Container(
                width: leftWidth,
                height: headerHeight,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              ...hours.map(
                (hour) => Container(
                  width: hourWidth,
                  height: headerHeight,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Text(
                    hour,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // SECOND ROW
          Row(
            children: [
              // LEFT SIDE EMPTY
              Container(
                width: leftWidth,
                height: bodyHeight,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              // EMPTY TIME CELLS
              ...List.generate(
                hours.length,
                (index) => Container(
                  width: hourWidth,
                  height: bodyHeight,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMealSection(bool isMobile, bool isTablet) {
    final mealHeight = isMobile ? 100 : 200;

    return Container(
      height: mealHeight * 2.0,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                buildLeftLabel("Guest\nBuffet", isMobile, isTablet),
                Expanded(
                  child: Row(
                    children: [
                      buildMealCard(
                        "Break Fast",
                        "Preparation Time\n6:00 AM - 8:30 AM",
                        "Serve Time\n8:30 AM - 11:00 AM",
                        isMobile,
                        isTablet,
                      ),
                      buildMealCard(
                        "Lunch",
                        "Preparation Time\n11:00 AM - 12:30 PM",
                        "Serve Time\n12:30 PM - 03:00 PM",
                        isMobile,
                        isTablet,
                      ),
                      buildMealCard(
                        "Dinner",
                        "Preparation Time\n05:00 PM - 07:30 PM",
                        "Serve Time\n07:30 PM - 10:00 PM",
                        isMobile,
                        isTablet,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildLeftLabel("Event\nBuffet", isMobile, isTablet),
                Expanded(
                  child: Row(
                    children: [
                      buildMealCard("N/A", "", "", isMobile, isTablet),
                      buildMealCard(
                        "Lunch",
                        "Event Name 1\nPreparation Time\n10:00 AM - 12:00 PM",
                        "Serve Time\n12:00 PM - 2:30 PM",
                        isMobile,
                        isTablet,
                      ),
                      buildMealCard(
                        "Dinner",
                        "Event Name 2\nPreparation Time\n5:00 PM - 7:00 PM",
                        "Serve Time\n7:00 PM - 9:30 PM",
                        isMobile,
                        isTablet,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLeftLabel(String text, bool isMobile, bool isTablet) {
    double labelWidth = isMobile ? 70 : 90;
    double fontSize = isMobile ? 10.0 : 12.0;

    return Container(
      width: labelWidth,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey.shade700, fontSize: fontSize),
      ),
    );
  }

  Widget buildMealCard(
    String title,
    String prep,
    String serve,
    bool isMobile,
    bool isTablet,
  ) {
    final titleFontSize = isMobile ? 11.0 : 14.0;
    final textFontSize = isMobile ? 7.0 : 9.0;
    final padding = isMobile ? 6.0 : 8.0;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: titleFontSize,
              ),
            ),
            if (prep.isNotEmpty) ...[
              SizedBox(height: isMobile ? 4 : 8),
              Text(
                prep,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: textFontSize),
              ),
            ],
            if (serve.isNotEmpty) ...[
              SizedBox(height: isMobile ? 3 : 6),
              Text(
                serve,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: textFontSize, color: Colors.teal),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildChefBar(Map<String, dynamic> data, bool isMobile, bool isTablet) {
    final hourWidth = isMobile ? 50.0 : (isTablet ? 65.0 : 75.0);
    final barHeight = isMobile ? 40.0 : 55.0;
    final barInnerHeight = isMobile ? 22.0 : 30.0;
    final fontSize = isMobile ? 9.0 : 12.0;

    final startValue = (data["start"] as num).toDouble();
    final widthValue = (data["width"] as num).toDouble();
    final leftPosition = startValue * hourWidth;
    final containerWidth = widthValue * hourWidth;

    return SizedBox(
      height: barHeight,
      child: Stack(
        children: [
          Positioned(
            left: leftPosition,
            child: Container(
              width: containerWidth,
              height: barInnerHeight,
              decoration: BoxDecoration(
                color: data["color"] as Color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "3:45/8hour",
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                    Container(width: 1, height: 15, color: Colors.green),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Rajeev Singh",
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                    Container(width: 1, height: 15, color: Colors.green),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Head Chef",
                        style: TextStyle(fontSize: fontSize),
                      ),
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
