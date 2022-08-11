import 'package:certificate_maker/_features.dart';

extension CertificateExt on Certificate {
  String get certifiesLabel => 'CERTIFIES';

  String get firstNameAndLastName => '$firstName $lastName';

  String get achieveLabel {
    return map<String>(
      judge: (_) => 'ACHIEVED THE TEST OF',
      ranking: (_) => 'ACHIEVED THE RANK OF',
    );
  }

  String get title {
    return map<String>(
      judge: (_) => 'JUDGE',
      ranking: (value) => value.rank,
    );
  }

  String get reference {
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
  String get fileName => '$reference - IKMF - $firstNameAndLastName';
}
