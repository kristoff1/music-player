import 'package:flutter/material.dart';

class SearchViewComponent extends StatelessWidget {
  final TextEditingController _controller;

  const SearchViewComponent(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black54),
      cursorColor: Colors.black54,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        hintText: 'Search Artists',
        border: OutlineInputBorder(),
      ),
      controller: _controller,
    );
  }
}
