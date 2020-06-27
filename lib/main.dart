import 'package:flutter/material.dart';
import 'package:music/common/global.dart';
import 'package:music/music.dart';

void main() => Global.init().then((_) => runApp(Music()));