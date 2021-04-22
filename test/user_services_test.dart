import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../lib/utils/services/user/user_services.dart';

class MockitoExample extends Mock implements http.Client {}

void main() {
  test('Request Name from API', () async {
    UserServices services = UserServices();
    final teste = await services.getUser(5);
    expect(teste.firstName, "U2");
  });
  test('Request Email from API', () async {
    UserServices services = UserServices();
    final teste = await services.getUser(5);
    expect(teste.email, "2@2.com");
  });
  test('Request Email from API', () async {
    UserServices services = UserServices();
    final teste = await services.getUser(5);
    expect(teste.account.cep, "2222222");
  });
}
