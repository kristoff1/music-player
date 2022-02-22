# Simple Music Preview App
## Description
It's a simple app that plays previews of Musics from iTunes. It only play previews because in order to play the song in full, you'd have to play it in iTunes and buy the music.
## Features
There are various interactions that you can do with this apps, such as:

**Search Music by Artist**
Type the name of the artist on the Search Bar on the top of the page and the app will return 50 musics related to that artist.

**Play the Music**
Choose any music preview from the artist that you've searched. You can play it, pause it, or skip it. The music will stop after a few seconds (because they're just previews) and you have to manually play another music, or repeat the preview that was just finished playing.

## Supported Devices

**Android**
All Android devices with OS version over 4.1 Jellybean (SDK version 16)

**Tested in**
Samsung A52 Android OS version 11

## Install

**Prerequisite**

- Make sure you have the latest Flutter SDK (at least version 2.8.1) to build the app
- Make sure you have added the Flutter SDK path in your environment variable
- [Resource](https://docs.flutter.dev/get-started/install/macos)

**How to Build**

- Open terminal
- Go to the music_player folder
- To build the apk file:
    - Type `flutter build apk` the result apk will be found in `music_player/build/app/outputs/apk/`debug folder
- To install directly to Android phone/emulator
    - Make sure your phone/emulator connected to adb
        - For Android phone, you have to activate developer option and activate USB Debugging option
        - To check if the device already connected, go to terminal and type `adb devices`
    - Open Terminal
    - Go to music_player folder
    - Type in `flutter run`
    - Make sure your phone/emulator always connected to the computer while the installation process is taking place

## Testing

**Unit Test**
- Open Terminal and go to music_player folder
- Type in `flutter test`

**How to Run Automated Test**
- To run automated test, connect your phone or start an emulator
- Open Terminal, and go to music_player folder
- Type in `flutter test integration_test/app_test.dart`

Notes: Phone must be awake all the time while automated test is running, or the test would be failed


