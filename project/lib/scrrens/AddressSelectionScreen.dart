import 'package:flutter/material.dart';

class AddressSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Delivery Address")),
      body: Column(
        children: [
          // Add address
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Add new address logic
                  },
                  child: Text("Create new address"),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Show new address form
                  },
                  child: Text("+ New"),
                ),
              ],
            ),
          ),
          // Existing address card
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: Text("Anuj Deb"),
              subtitle: Text("Shyamaprasad Road, Ghatline"),
              trailing: Icon(Icons.radio_button_checked, color: Colors.amber),
              onTap: () {
                // Select this address
              },
            ),
          ),
          Spacer(),
          // Next button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Go to order summary or payment
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}
