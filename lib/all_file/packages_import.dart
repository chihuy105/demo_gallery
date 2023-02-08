//// *** Dart ***
export 'dart:async';
export 'dart:convert';
export 'dart:io';

export 'package:auto_route/auto_route.dart';
export 'package:bloc/bloc.dart' hide EventHandler;
export 'package:cached_network_image/cached_network_image.dart';
export 'package:demo_gallery/core/dio/dio_module.dart';
//// *** Third Party Packages ***
export 'package:dio/dio.dart' hide Headers, MultipartFile;
export 'package:equatable/equatable.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart' hide Path;
export 'package:flutter_bloc/flutter_bloc.dart' hide EventHandler;
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get_core/get_core.dart';
export 'package:get/get_rx/get_rx.dart' hide StringExtension, IntExtension, BoolExtension;
export 'package:get/utils.dart';
export 'package:get_it/get_it.dart';
export 'package:json_annotation/json_annotation.dart';
export 'package:retrofit/http.dart' hide Path;
export 'package:velocity_x/velocity_x.dart'
    show
        VelocityXRichTextExtension,
        VelocityXTextSpanExtension,
        VxNumExtension,
        VxObjectExtensions,
        VxOpacityExtension,
        VxTransformExtension,
        VxWidgetsExtension,
        VxTextExtensions,
        // StringExtension,
        VxPaddingExtensions,
        VxMarqueeExtension,
        CenterExtension,
        VxCenterBuilderExtension;
