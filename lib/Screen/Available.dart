import 'package:flutter/material.dart';

class Available extends StatefulWidget {
  const Available({super.key});

  @override
  State<Available> createState() => _AvailableState();
}

class _AvailableState extends State<Available> {
  final List<Map<String, String>> items = [
    {
      "itemId": "IN01",
      "itemName": "Tomato",
      "itemType": "Vegetable",
      "preservationmethod": "Refrigerator",
      "storagelocation": "Location 1",
      "totalquantity": "8 kg",
      "dayslefttoshellife": "2",
      "available": "2 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Cheese",
      "itemType": "Dairy",
      "preservationmethod": "Deep Freeze",
      "storagelocation": "Location 2",
      "totalquantity": "5 kg",
      "dayslefttoshellife": "3",
      "available": "3 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Rice",
      "itemType": "Grocery",
      "preservationmethod": "Dry",
      "storagelocation": "Location 1",
      "totalquantity": "20 kg",
      "dayslefttoshellife": "5",
      "available": "5 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Tomato",
      "itemType": "Vegetable",
      "preservationmethod": "Refrigerator",
      "storagelocation": "Location 2",
      "totalquantity": "8 kg",
      "dayslefttoshellife": "6",
      "available": "7 kg",
    },

    {
      "itemId": "IN01",
      "itemName": "Tomato",
      "itemType": "Vegetable",
      "preservationmethod": "Refrigerator",
      "storagelocation": "Location 2",
      "totalquantity": "8 kg",
      "dayslefttoshellife": "2",
      "available": "4 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Tomato",
      "itemType": "Vegetable",
      "preservationmethod": "Refrigerator",
      "storagelocation": "Location 1",
      "totalquantity": "8 kg",
      "dayslefttoshellife": "2",
      "available": "7 kg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: DataTable(
          border: TableBorder.all(color: Colors.black26, width: 1),

          columns: const [
            DataColumn(
              label: Text(
                "Item ID",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            DataColumn(
              label: Text(
                "Item Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            DataColumn(
              label: Text(
                "Item Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            DataColumn(
              label: Text(
                "Preservation Method",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            DataColumn(
              label: Text(
                "Storage Location",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                "Total Available Quantity",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                "Days Left to Shelf Life",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                "Available",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],

          rows: items.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item["itemId"]!)),
                DataCell(Text(item["itemName"]!)),
                DataCell(Text(item["itemType"]!)),
                DataCell(Text(item["preservation"]!)),
                DataCell(Text(item["location"]!)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
