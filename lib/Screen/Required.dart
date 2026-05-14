import 'package:flutter/material.dart';

class Required extends StatefulWidget {
  const Required({super.key});

  @override
  State<Required> createState() => _RequiredState();
}

class _RequiredState extends State<Required> {
  final List<Map<String, String>> items = [
    {
      "itemName": "Beef Stack",
      "requiredQuantity": "50 kg",
      "updatedBy": "Rahul K.",
    },
    {
      "itemName": "Paneer Tikka",
      "requiredQuantity": "50 pieces",
      "updatedBy": "Salman",
    },
    {"itemName": "Beef Steak", "requiredQuantity": "50 kg", "updatedBy": "--"},
    {
      "itemName": "Paneer Tikka",
      "requiredQuantity": "50 pieces",
      "updatedBy": "Salman",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),

      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),

              child: DataTable(
                border: TableBorder(
                  top: BorderSide(color: Colors.black26, width: 1),
                  bottom: BorderSide(color: Colors.black26, width: 1),
                  horizontalInside: BorderSide(color: Colors.black12, width: 1),
                ),

                columns: const [
                  DataColumn(
                    label: Text(
                      "Item Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 123, 124, 125),
                      ),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      "Required Quantity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 123, 124, 125),
                      ),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      "Updated By",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 123, 124, 125),
                      ),
                    ),
                  ),
                ],

                rows: items.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(Text(item["itemName"]!)),
                      DataCell(
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 4,
                          ),

                          child: TextField(
                            controller: TextEditingController(
                              text: item["requiredQuantity"],
                            ),

                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),

                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataCell(Text(item["updatedBy"]!)),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
