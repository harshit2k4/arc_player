import 'package:flutter/material.dart';

class AudioController extends ChangeNotifier {
  // A clean list of our songs (temporary data)
  final List<Map<String, String>> playlist = [
    {'number': '01', 'title': 'Intro III', 'duration': '4:29'},
    {'number': '02', 'title': 'Outcast', 'duration': '5:26'},
    {'number': '03', 'title': '10 Feet Down', 'duration': '3:37'},
    {'number': '04', 'title': 'Green Lights', 'duration': '3:02'},
    {'number': '05', 'title': 'Dreams', 'duration': '3:42'},
  ];

  int _currentSongIndex = 0;
  bool _isPlaying = false;
  double _currentProgress = 0.25; // Default progress value at 25 percent

  // Getters to read the data safely from our views
  int get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  double get currentProgress => _currentProgress;

  Map<String, String> get currentSong => playlist[_currentSongIndex];

  // Function to select and play a song from the list
  void selectSong(int index) {
    _currentSongIndex = index;
    _isPlaying = true;
    _currentProgress = 0.0; // Reset progress bar for the new song
    notifyListeners(); // This tells the UI to refresh instantly
  }

  // Function to toggle between play and pause states
  void togglePlayPause() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  // Function to go to the next song safely
  void playNextSong() {
    if (_currentSongIndex < playlist.length - 1) {
      _currentSongIndex = _currentSongIndex + 1;
    } else {
      _currentSongIndex = 0; // Loop back to the first song
    }
    _currentProgress = 0.0;
    _isPlaying = true;
    notifyListeners();
  }

  // Function to go to the previous song safely
  void playPreviousSong() {
    if (_currentSongIndex > 0) {
      _currentSongIndex = _currentSongIndex - 1;
    } else {
      _currentSongIndex = playlist.length - 1; // Loop to the end of the list
    }
    _currentProgress = 0.0;
    _isPlaying = true;
    notifyListeners();
  }
}
