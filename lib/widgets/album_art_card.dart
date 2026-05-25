import 'package:flutter/material.dart';

class AlbumArtCard extends StatelessWidget {
  final double height;

  const AlbumArtCard({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white, // This will be replaced by the album image later
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(160),
          bottomRight: Radius.circular(160),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 15),
            blurRadius: 20,
          ),
        ],
      ),
      child: const Center(
        child: Icon(Icons.music_note_rounded, size: 80, color: Colors.black26),
      ),
    );
  }
}
