import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter/flutter_icon_button.dart';
import '/flutter/flutter_media_display.dart';
import '/flutter/flutter_theme.dart';
import '/flutter/flutter_util.dart';
import '/flutter/flutter_video_player.dart';
import '/flutter/flutter_widgets.dart';
import '/flutter/upload_media.dart';
import '/main.dart';
import '/flutter/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateStoryModel extends FlutterModel {
  ///  State fields for stateful widgets in this page.

  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for storyDescription widget.
  TextEditingController? storyDescriptionController;
  String? Function(BuildContext, String?)? storyDescriptionControllerValidator;
  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isMediaUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    storyDescriptionController?.dispose();
  }

  /// Additional helper methods are added here.

}
