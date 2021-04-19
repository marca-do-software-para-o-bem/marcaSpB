import 'package:flutter/material.dart';

abstract class ProfilePageEvent {}

@immutable
class ProfilePageStart extends ProfilePageEvent {}

@immutable
class ProfilePageError extends ProfilePageEvent {}
