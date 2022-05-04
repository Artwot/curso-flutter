import 'package:flutter_test/flutter_test.dart';
import '../lib/app/sign_in/email_sign_in_change_model.dart';
import 'package:mockito/annotations.dart';
import '../lib/app/services/auth.dart';

import 'email_sign_in_change_model_test.mocks.dart';

@GenerateMocks([AuthBase])
void main() {
  MockAuthBase mockAuth;
  late EmailSignInChangeModel model;

  setUp(() {
    mockAuth = MockAuthBase();
    model = EmailSignInChangeModel(auth: mockAuth);
  });

  test('updateEmail', () {
    var didNotifyListeners = false;
    model.addListener(() => didNotifyListeners = true);
    const sampleEmail = 'email@email.com';
    model.updateEmail(sampleEmail);
    expect(model.email, sampleEmail);
    expect(didNotifyListeners, true);
  });
}
