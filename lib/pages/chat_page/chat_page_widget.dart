import '/backend/backend.dart';
import '/flutter/chat/index.dart';
import '/flutter/flutter_icon_button.dart';
import '/flutter/flutter_theme.dart';
import '/flutter/flutter_util.dart';
import '/pages/add_chat_users/add_chat_users_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Stack(
          children: [
            if (!isGroupChat())
              Text(
                'Group Chat',
                style: FlutterTheme.of(context).bodyText1.override(
                      fontFamily: 'Urbanist',
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            if (!isGroupChat())
              Text(
                widget.chatUser!.displayName!,
                style: FlutterTheme.of(context).bodyText1,
              ),
          ],
        ),
        actions: [
          Visibility(
            visible: isGroupChat(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddChatUsersWidget(
                        chat: _chatInfo!.chatRecord,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.person_add,
                  color: FlutterTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: StreamBuilder<FFChatInfo>(
          stream: FFChatManager.instance.getChatInfo(
            otherUserRecord: widget.chatUser,
            chatReference: widget.chatRef,
          ),
          builder: (context, snapshot) => snapshot.hasData
              ? FFChatPage(
                  chatInfo: snapshot.data!,
                  allowImages: true,
                  backgroundColor:
                      FlutterTheme.of(context).primaryBackground,
                  timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                  currentUserBoxDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  otherUsersBoxDecoration: BoxDecoration(
                    color: FlutterTheme.of(context).primaryColor,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  currentUserTextStyle:
                      FlutterTheme.of(context).bodyText2.override(
                            fontFamily: 'Urbanist',
                            color: FlutterTheme.of(context).alternate,
                          ),
                  otherUsersTextStyle: FlutterTheme.of(context).bodyText1,
                  inputHintTextStyle: FlutterTheme.of(context).bodyText2,
                  inputTextStyle:
                      FlutterTheme.of(context).bodyText1.override(
                            fontFamily: 'Urbanist',
                            color: FlutterTheme.of(context).alternate,
                            fontWeight: FontWeight.bold,
                          ),
                  emptyChatWidget: Center(
                    child: Image.asset(
                      'assets/images/Group_20.png',
                      width: MediaQuery.of(context).size.width * 0.76,
                    ),
                  ),
                )
              : Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterTheme.of(context).primaryColor,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
