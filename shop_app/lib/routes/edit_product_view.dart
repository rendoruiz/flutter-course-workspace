import 'package:flutter/material.dart';

class EditProductView extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductViewState createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  // final _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(_priceFocusNode);
                  // },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  // focusNode: _priceFocusNode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
