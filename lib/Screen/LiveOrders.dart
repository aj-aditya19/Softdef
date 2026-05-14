import 'package:flutter/material.dart';

class Liveorders extends StatefulWidget {
  const Liveorders({super.key});

  @override
  State<Liveorders> createState() => _LiveordersState();
}

class _LiveordersState extends State<Liveorders> {
  int selectedIndex = 0;

  final List<String> menuItems = ["Running Orders", "Ala Carte Menu"];

  final List<Map<String, dynamic>> items = [
    {
      "orderID": "10098",
      "room": "A-101",
      "status": "Preparing",
      "timer": "29:38",

      "details": [
        {
          "itemName": "Chicken Biryani",
          "quantity": "2",
          "assigned": "Rahul",
          "itemStatus": "Cooking",
        },

        {
          "itemName": "Paneer Tikka",
          "quantity": "1",
          "assigned": "Salman",
          "itemStatus": "Ready",
        },
      ],
    },

    {
      "orderID": "10099",
      "room": "B-202",
      "status": "Ready",
      "timer": "15:10",

      "details": [
        {
          "itemName": "Veg Burger",
          "quantity": "3",
          "assigned": "Aman",
          "itemStatus": "Preparing",
        },

        {
          "itemName": "French Fries",
          "quantity": "2",
          "assigned": "Kunal",
          "itemStatus": "Ready",
        },
      ],
    },

    {
      "orderID": "10100",
      "room": "C-303",
      "status": "Cooking",
      "timer": "08:45",

      "details": [
        {
          "itemName": "Pizza",
          "quantity": "1",
          "assigned": "Rohit",
          "itemStatus": "Baking",
        },

        {
          "itemName": "Cold Coffee",
          "quantity": "2",
          "assigned": "Aditya",
          "itemStatus": "Completed",
        },
      ],
    },
  ];

  Widget buildTopData(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),

        const SizedBox(height: 4),

        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget buildDetailData(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),

        const SizedBox(height: 6),

        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }

  Widget divider() {
    return Container(height: 40, width: 1, color: Colors.grey.shade300);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const SizedBox(height: 10),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: List.generate(menuItems.length, (index) {
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },

                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),

                            child: Text(
                              menuItems[index],

                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,

                                fontSize: 16,
                              ),
                            ),
                          ),

                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),

                            height: 3,
                            width: isSelected ? 120 : 0,

                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: items.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20, left: 10, right: 10),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),

                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),

                      childrenPadding: EdgeInsets.zero,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      trailing: Container(
                        height: 28,
                        width: 28,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade400),
                        ),

                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),

                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          buildTopData("Order Id", item["orderID"]),
                          divider(),

                          buildTopData("Room", item["room"]),
                          divider(),

                          buildTopData("Order Status", item["status"]),
                          divider(),

                          buildTopData("Timer", item["timer"]),
                        ],
                      ),

                      children: [
                        Divider(color: Colors.grey.shade300),

                        Column(
                          children: List.generate(item["details"].length, (
                            index,
                          ) {
                            final detail = item["details"][index];

                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),

                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  buildDetailData(
                                    "Item Name",
                                    detail["itemName"],
                                  ),

                                  buildDetailData(
                                    "Quantity",
                                    detail["quantity"],
                                  ),

                                  buildDetailData(
                                    "Assigned",
                                    detail["assigned"],
                                  ),

                                  buildDetailData(
                                    "Status",
                                    detail["itemStatus"],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),

                        Align(
                          alignment: Alignment.centerLeft,

                          child: Container(
                            margin: const EdgeInsets.all(16),

                            child: OutlinedButton(
                              onPressed: () {},

                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 14,
                                ),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),

                              child: const Text(
                                "Cancel Order",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
