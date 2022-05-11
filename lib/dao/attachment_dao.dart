import 'package:firebase_database/firebase_database.dart';

import 'package:gazelist/model/attachment.dart';

class AttachmentDao {
  final DatabaseReference _attachmentRef =
      FirebaseDatabase.instance.ref().child('attachment');

  void saveAttachment(Attachment attachment) {
    _attachmentRef.push().set(attachment.toJson());
  }

  void updateAttachment(Attachment attachment) {
    _attachmentRef.update(attachment.toJson());
  }

  void deleteAttachment(Attachment attachment) {
    _attachmentRef.child(attachment.id).remove();
  }

  Query getAttachmentQuery() {
    return _attachmentRef;
  }
}
