import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  final SupabaseStorageClient client = Supabase.instance.client.storage;

  Future<String> uploadFile(String bucketName, String path, File file) async =>
      await client.from(bucketName).upload(path, file,
          fileOptions: const FileOptions(cacheControl: "3600", upsert: false));

  String getPublicUrl(String bucketName, String path) =>
      client.from(bucketName).getPublicUrl(path);
}
