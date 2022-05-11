import 'package:firebase_database/firebase_database.dart';

import 'package:gazelist/model/attachment.dart';

class AttachmentDao {
  final DatabaseReference _attachmentRef =
      FirebaseDatabase.instance.ref().child('attachment');

  void saveAttachment(Attachment attachment) {
    _attachmentRef.push().set(attachment.toJson());
  }

  Query getAttachmentQuery() {
    return _attachmentRef;
  }
}
