import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Available extends StatelessWidget {
  const Available({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        "itemName": "Beef Stack",
        "availableQuantity": "100 kg",
        "updatedBy": "Rahul K.",
      },
      {
        "itemName": "Paneer Tikka",
        "availableQuantity": "--",
        "updatedBy": "Salman",
      },
      {
        "itemName": "Beef Steak",
        "availableQuantity": "100 kg",
        "updatedBy": "--",
      },
      {
        "itemName": "Paneer Tikka",
        "availableQuantity": "50 pieces",
        "updatedBy": "Salman",
      },
    ];

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
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: Color.fromARGB(255, 123, 124, 125),
                      ),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      "Available Quantity",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: Color.fromARGB(255, 123, 124, 125),
                      ),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      "Updated By",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: Color.fromARGB(255, 123, 124, 125),
                      ),
                    ),
                  ),
                ],

                rows: items.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          item["itemName"]!,
                          style: GoogleFonts.outfit(fontSize: 11),
                        ),
                      ),
                      DataCell(
                        Text(
                          item["availableQuantity"]!,
                          style: GoogleFonts.outfit(fontSize: 11),
                        ),
                      ),
                      DataCell(
                        Text(
                          item["updatedBy"]!,
                          style: GoogleFonts.outfit(fontSize: 11),
                        ),
                      ),
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
