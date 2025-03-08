import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class SupabaseService {
  static final supabase = Supabase.instance.client;

  static Future setup() {
    return Supabase.initialize(url: '', anonKey: '');
  }

  static SupabaseQueryBuilder queryprofiles = supabase.from('profiles');

  static Future insertprofiles(profiles record) async {
    await supabase
        .from('profiles')
        .insert(record.toJson()..removeWhere((key, value) => value == null));
  }
}

@NowaGenerated()
class profiles {
  @NowaGenerated({'loader': 'auto-constructor'})
  const profiles(
      {this.id,
      this.updated_at,
      this.username,
      this.full_name,
      this.avatar_url,
      this.website});

  @NowaGenerated({'loader': 'auto-from-json'})
  factory profiles.fromJson({required Map<String, dynamic> json}) {
    return profiles(
      id: json['id'],
      updated_at: json['updated_at'],
      username: json['username'],
      full_name: json['full_name'],
      avatar_url: json['avatar_url'],
      website: json['website'],
    );
  }

  final String? id;

  final String? updated_at;

  final String? username;

  final String? full_name;

  final String? avatar_url;

  final String? website;

  @NowaGenerated({'loader': 'auto-copy-with'})
  profiles copyWith(
      {String? id,
      String? updated_at,
      String? username,
      String? full_name,
      String? avatar_url,
      String? website}) {
    return profiles(
      id: id ?? this.id,
      updated_at: updated_at ?? this.updated_at,
      username: username ?? this.username,
      full_name: full_name ?? this.full_name,
      avatar_url: avatar_url ?? this.avatar_url,
      website: website ?? this.website,
    );
  }

  @NowaGenerated({'loader': 'auto-to-json'})
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'updated_at': updated_at,
      'username': username,
      'full_name': full_name,
      'avatar_url': avatar_url,
      'website': website,
    };
  }
}
