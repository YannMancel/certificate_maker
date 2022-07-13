import 'package:certificate_maker/_features.dart';

extension CertificateExt on Certificate {
  String get subtitle1 => 'CERTIFIES';

  String get firstNameAndLastName => '$firstName $lastName';

  String get subtitle2 {
    return map<String>(
      judge: (_) => 'ACHIEVED THE TEST OF',
      ranking: (_) => 'ACHIEVED THE RANK OF',
    );
  }

  String get label {
    final prefix = map<String>(
      judge: (_) => 'JT',
      ranking: (_) => 'YM',
    );
    final now = DateTime.now();
    final number = id.toString().padLeft(3, '0');
    return '$prefix${now.year}-$number';
  }

  // TODO(YannMancel): update data
  // YM2022-012 - IKMF_MSWC_G_DHS_OPEN
  String get fileName => '$label - IKMF - $firstNameAndLastName';
}
