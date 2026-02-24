import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  // Esse endpoint responde apenas a requisições GET
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: 405, body: 'Método não permitido. Use GET.');
  }
  

  // TODO: Futuramente, buscaremos os dados reais do banco (PostgreSQL)

  // Retornando uma lista simulada de animais (Mock)
  final listaDeAnimais = [
    {
      'idSISOV': 'SISOV-001',
      'raca': 'Santa Inês',
      'pesoAtual': 45.5,
      'statusSanitario': 'Vacinado',
      'dataNascimento': '2025-01-15'
    },
    {
      'idSISOV': 'SISOV-002',
      'raca': 'Dorper',
      'pesoAtual': 52.0,
      'statusSanitario': 'Pendente Vermifugação',
      'dataNascimento': '2024-11-20'
    }
  ];

  return Response.json(
    body: {
      'total': listaDeAnimais.length,
      'data': listaDeAnimais
    },
  );
}