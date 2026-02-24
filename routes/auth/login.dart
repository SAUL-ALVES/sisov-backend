import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: 405, body: 'Método não permitido. Use POST.');
  }

  final body = await context.request.json() as Map<String, dynamic>;
  final email = body['email'];
  final senha = body['senha'];

  
  if (email == 'admin@sisov.com' && senha == '123456') {
    return Response.json(
      body: {
        'mensagem': 'Login aprovado',
        'token': 'token_jwt_simulado_para_autenticacao',
        'produtorId': 'prod_789'
      },
    );
  }

  
  return Response.json(
    statusCode: 401, 
    body: {'erro': 'E-mail ou senha inválidos'},
  );
}