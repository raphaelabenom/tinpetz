import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter/flutter_theme.dart';
import '/flutter/flutter_util.dart';
import '/flutter/flutter_widgets.dart';
import '/flutter/upload_media.dart';
import '/pages/create_your_profile/create_your_profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetProfileModel extends FlutterModel {
  ///  State fields for stateful widgets in this page.

  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for petName widget.
  TextEditingController? petNameController;
  String? Function(BuildContext, String?)? petNameControllerValidator;
  // State field(s) for petBreed widget.
  TextEditingController? petBreedController;
  String? Function(BuildContext, String?)? petBreedControllerValidator;
  // State field(s) for petAge widget.
  TextEditingController? petAgeController;
  String? Function(BuildContext, String?)? petAgeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    petNameController?.dispose();
    petBreedController?.dispose();
    petAgeController?.dispose();
  }

  /// Additional helper methods are added here.

}
