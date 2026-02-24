import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: 405, body: 'Método não permitido. Use POST.');
  }

  
  final body = await context.request.json() as Map<String, dynamic>;
  final nome = body['nome'];
  final email = body['email'];
  final senha = body['senha'];

  
  if (nome == null || email == null || senha == null) {
    return Response.json(
      statusCode: 400,
      body: {'erro': 'Nome, email e senha são obrigatórios'},
    );
  }

  

  
  return Response.json(
    statusCode: 201, 
    body: {
      'mensagem': 'Produtor cadastrado com sucesso!',
      'produtorId': 'prod_789', 
      'nome': nome
    },
  );
}