import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/Brewery.dart';

class ProductDetails extends StatefulWidget {
  final Brewery brewery;
  const ProductDetails({super.key, required this.brewery});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.brewery.name!),
                Text(widget.brewery.id!),
                Text("Type: ${widget.brewery.breweryType!}"),
                Text("Street : ${widget.brewery.street}"),
                Text("Adress 2 : ${widget.brewery.address2}"),
                Text("Address 3 : ${widget.brewery.address3}"),
                Text("City : ${widget.brewery.city}"),
                Text("State : ${widget.brewery.state}"),
                Text("Country Province : ${widget.brewery.countyProvince}"),
                Text("Postal Code : ${widget.brewery.postalCode}"),
                Text("Country : ${widget.brewery.country}"),
                Text("Longitude : ${widget.brewery.longitude}"),
                Text("Latitude : ${widget.brewery.latitude}"),
                Text("Phone : ${widget.brewery.phone}"),
                Text("Website URL : ${widget.brewery.websiteUrl}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
