import 'package:certificate_maker/_features.dart';

extension CertificateExt on Certificate {
  String get firstNameAndLastName => '$firstName $lastName';

  String get label {
    final now = DateTime.now();
    final number = id.toString().padLeft(3, '0');
    return 'JT${now.year}-$number';
  }

  // TODO(YannMancel): update data
  // YM2022-012 - IKMF_MSWC_G_DHS_OPEN
  String get fileName => '$label - IKMF - $firstNameAndLastName';
}
