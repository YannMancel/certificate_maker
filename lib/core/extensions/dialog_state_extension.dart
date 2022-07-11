import 'package:certificate_maker/_features.dart';

extension DialogStateExt<T> on DialogState<T> {
  bool get isConfirmed {
    return when<bool>(
      confirm: (_) => true,
      cancel: () => false,
    );
  }
}
