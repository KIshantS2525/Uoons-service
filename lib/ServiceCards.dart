import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ServiceCard extends StatefulWidget {
  final String title;
  final String price;
  final String time;
  final String description;
  final String imageUrl;
  final List<String> customizationOptions;
  final bool isCustomizable;

  ServiceCard({
    required this.title,
    required this.price,
    required this.time,
    required this.description,
    required this.imageUrl,
    this.isCustomizable = false,
    this.customizationOptions = const [],
  });

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  int _quantity = 0;

  void _increment() {
    setState(() {
      _quantity++;
    });
    if (widget.isCustomizable && _quantity == 1) {
      _showCustomizationDialog();
    }
  }

  void _decrement() {
    setState(() {
      if (_quantity > 0) _quantity--;
    });
  }

  void _showCustomizationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Customization'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.customizationOptions.map((option) {
              return ListTile(
                title: Text(option),
                onTap: () {
                  // Handle customization selection
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                setState(() {
                  _quantity = 0;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        widget.time,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  if (widget.isCustomizable)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Customization available',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("View details"),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: _decrement,
                          ),
                          Text('$_quantity'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: _increment,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 80.0,
              height: 80.0,
              margin: EdgeInsets.only(left: 10.0),
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}