import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shelflifeitems extends StatefulWidget {
  const Shelflifeitems({super.key});

  @override
  State<Shelflifeitems> createState() => _ShelflifeitemsState();
}

class _ShelflifeitemsState extends State<Shelflifeitems> {
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
          border: TableBorder(
            top: BorderSide(color: Colors.black26, width: 1),

            bottom: BorderSide(color: Colors.black26, width: 1),

            horizontalInside: BorderSide(color: Colors.black12, width: 1),
          ),

          columns: const [
            DataColumn(
              label: Text(
                "Item ID",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ),
            ),

            DataColumn(
              label: Text(
                "Item Name",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ),
            ),

            DataColumn(
              label: Text(
                "Item Type",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ),
            ),

            DataColumn(
              label: Text(
                "Preservation Method",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ),
            ),

            DataColumn(
              label: Text(
                "Storage Location",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ),
            ),
            DataColumn(
              label: Text(
                "Total Available Quantity",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ),
            ),
            DataColumn(
              label: Text(
                "Days Left to Shelf Life",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: Colors.red,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                "Available",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ),
            ),
            DataColumn(
              label: Text(
                "Action",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ),
            ),
          ],

          rows: items.map((item) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    item["itemId"]!,
                    style: GoogleFonts.outfit(fontSize: 11),
                  ),
                ),
                DataCell(
                  Text(
                    item["itemName"]!,
                    style: GoogleFonts.outfit(fontSize: 11),
                  ),
                ),
                DataCell(
                  Text(
                    item["itemType"]!,
                    style: GoogleFonts.outfit(fontSize: 11),
                  ),
                ),
                DataCell(
                  Text(
                    item["preservationmethod"]!,
                    style: GoogleFonts.outfit(fontSize: 11),
                  ),
                ),
                DataCell(
                  Text(
                    item["storagelocation"]!,
                    style: GoogleFonts.outfit(fontSize: 11),
                  ),
                ),
                DataCell(
                  Text(
                    item["totalquantity"]!,
                    style: GoogleFonts.outfit(fontSize: 11),
                  ),
                ),
                DataCell(
                  Text(
                    item["dayslefttoshellife"]!,
                    style: GoogleFonts.outfit(fontSize: 11),
                  ),
                ),
                DataCell(
                  Text(
                    item["available"]!,
                    style: GoogleFonts.outfit(fontSize: 11),
                  ),
                ),
                DataCell(
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Set Discount Offer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Text(
                          "Remove From Watchlist",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
