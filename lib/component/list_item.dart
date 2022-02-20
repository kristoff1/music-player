import 'package:flutter/material.dart';
import 'package:music_player/view_model.dart';

class ListItemComponent extends StatelessWidget {
  final Function() onSelected;

  final MusicViewModel musicViewModel;

  final bool isSelected;

  const ListItemComponent({
    Key? key,
    required this.onSelected,
    required this.musicViewModel,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Ink(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: Colors.black54),
                bottom: BorderSide(width: 1, color: Colors.black54))),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.network(musicViewModel.imagePath)),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(musicViewModel.title),
                  Text(musicViewModel.artistName),
                  Text(musicViewModel.albumName),
                ],
              ),
            ),
            isSelected
                ? const Expanded(flex: 3, child: Icon(Icons.stream))
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
