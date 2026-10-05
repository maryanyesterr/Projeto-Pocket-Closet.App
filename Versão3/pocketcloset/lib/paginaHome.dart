// Adicionar flutter pub add http
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class paginaHome extends StatefulWidget {
  const paginaHome({super.key});

  @override
  State<paginaHome> createState() => _GuardaroupaState();
}

class _GuardaroupaState extends State<paginaHome> {
  // ============================================================
  // DADOS DO CLIMA
  // ============================================================

  String cidade = "Carregando...";
  String temperatura = "--°C";
  String condicao = "Buscando clima...";
  String condicaoSlug = "cloud";

  bool carregando = true;


  final String apiKey = "d10fa021";

  // ============================================================
  // TIMER PARA ATUALIZAÇÃO AUTOMÁTICA
  // ============================================================

  Timer? timerClima;

  // ============================================================
  // INICIALIZAÇÃO
  // ============================================================

  @override
  void initState() {
    super.initState();

    // Busca o clima assim que a tela abre.
    buscarClimaAoVivo();

    // Atualiza automaticamente a cada 30 minutos.
    timerClima = Timer.periodic(
      const Duration(minutes: 30),
      (timer) {
        buscarClimaAoVivo();
      },
    );
  }

  // ============================================================
  // ENCERRA O TIMER QUANDO A TELA É DESTRUÍDA
  // ============================================================

  @override
  void dispose() {
    timerClima?.cancel();
    super.dispose();
  }

  // ============================================================
  // BUSCAR CLIMA NA API DA HG BRASIL
  // ============================================================

  Future<void> buscarClimaAoVivo() async {
    // Enquanto estiver buscando, mostramos o carregamento.
    if (mounted) {
      setState(() {
        carregando = true;
      });
    }

    // URL da API HG Brasil.
    //
    // Neste exemplo estamos buscando o clima de
    // Belo Horizonte, MG.
    //
    // Depois podemos trocar isso para localização automática.
    final url = Uri.https(
      'api.hgbrasil.com',
      '/weather',
      {
        'city_name': 'Belo Horizonte,MG',
        'key': apiKey,
        'format': 'json-cors',
        'locale': 'pt',
      },
    );

    try {
      // Faz a requisição para a API.
      final resposta = await http.get(url);

      // Mostra no console o que a API respondeu.
      // Isso ajuda bastante caso aconteça algum erro.
      debugPrint('Status da API: ${resposta.statusCode}');
      debugPrint('Resposta da API: ${resposta.body}');

      // ========================================================
      // RESPOSTA OK
      // ========================================================

      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body);

        // Verifica se a API aceitou a chave.
        if (dados['valid_key'] != true) {
          if (!mounted) return;

          setState(() {
            cidade = "Erro";
            temperatura = "--°C";
            condicao = "Chave da API inválida";
            carregando = false;
          });

          return;
        }

        // Pega os resultados do clima.
        final resultados = dados['results'];

        if (!mounted) return;

        setState(() {
          cidade = resultados['city'] ?? 'Belo Horizonte, MG';

          temperatura = '${resultados['temp'] ?? '--'}°C';

          condicao = ajustarDescricaoClima(
            resultados['description'] ?? 'Sem informação sobre o clima',
          );

          condicaoSlug = resultados['condition_slug'] ?? 'cloud';

          carregando = false;
        });
      }

      // ========================================================
      // ERRO HTTP
      // ========================================================

      else {
        if (!mounted) return;

        setState(() {
          cidade = "Erro";
          temperatura = "--°C";
          condicao =
              "Erro ao consultar o servidor (${resposta.statusCode})";
          carregando = false;
        });
      }
    }

    // ==========================================================
    // ERRO DE CONEXÃO
    // ==========================================================

    catch (e) {
      debugPrint('Erro ao buscar clima: $e');

      if (!mounted) return;

      setState(() {
        cidade = "Sem conexão";
        temperatura = "--°C";
        condicao = "Não foi possível carregar o clima";
        carregando = false;
      });
    }
  }

  // ============================================================
// ÍCONE DE ACORDO COM O CLIMA
// ============================================================

IconData getIconeClima() {
  switch (condicaoSlug) {
    case 'clear_day':
      return Icons.wb_sunny;

    case 'clear_night':
      return Icons.nightlight_round;

    case 'rain':
      return Icons.water_drop;

    case 'storm':
      return Icons.thunderstorm;

    case 'cloud':
      return Icons.cloud;

    case 'cloudly_day':
      return Icons.cloud_queue;

    case 'cloudly_night':
      return Icons.cloud;

    case 'fog':
      return Icons.foggy;

    default:
      return Icons.cloud;
  }
}


// ============================================================
// AJUSTAR DESCRIÇÃO DO CLIMA
// ============================================================

String ajustarDescricaoClima(String descricao) {
  final texto = descricao.toLowerCase().trim();

  switch (texto) {
    case 'chuvas esparsas':
      return 'Chuva passageira';

    case 'chuva':
      return 'Chuvoso';

    case 'pancadas de chuva':
      return 'Pancadas de chuva';

    case 'tempo nublado':
      return 'Nublado';

    case 'parcialmente nublado':
      return 'Parcialmente nublado';

    case 'tempo limpo':
      return 'Céu limpo';

    case 'ensolarado':
      return 'Ensolarado';

    case 'tempestade':
      return 'Tempestade';

    case 'neblina':
      return 'Neblina';

    default:
      return descricao;
  }
}

  // ============================================================
  // TELA
  // ============================================================

 @override
Widget build(BuildContext context) {
  return Scaffold(
    // ==========================================================
    // CONTEÚDO DA PÁGINA
    // ==========================================================

    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================================================
            // TOPO
            // ==================================================

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        "assets/img/logo.png",
                      ),
                    ),

                    const SizedBox(width: 12),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Olá, (nome)! 👋",
                          style: TextStyle(
                            fontFamily: "YoungSerif",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          "Vamos escolher seu look para hoje?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ==================================================
            // BLOCO ROXO DO CLIMA
            // ==================================================

            Container(
              width: double.infinity,
              height: 160,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(81, 17, 147, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cidade,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          temperatura,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          condicao,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 90,
                    height: 100,
                    child: carregando
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Icon(
                            getIconeClima(),
                            size: 70,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ==================================================
            // ATUALIZAR CLIMA
            // ==================================================

            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: carregando
                    ? null
                    : () {
                        buscarClimaAoVivo();
                      },
                icon: const Icon(
                  Icons.refresh,
                  size: 18,
                ),
                label: const Text(
                  "Atualizar clima",
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // LOOK DO DIA
            // ==================================================

            const Text(
              "Look do dia",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  255,
                  255,
                  254,
                  255,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            const SizedBox(height: 16),

            // ==================================================
            // VER DETALHES
            // ==================================================

            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(81, 17, 147, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "Ver detalhes do look",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Espaço para o menu não ficar grudado no conteúdo
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),

    // ==========================================================
    // MENU INFERIOR
    // ==========================================================

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,

      selectedItemColor: const Color.fromRGBO(81, 17, 147, 1),
      unselectedItemColor: Colors.grey,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.door_sliding_outlined),
          activeIcon: Icon(Icons.door_sliding),
          label: 'Guarda-roupa',
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.checkroom_outlined),
          activeIcon: Icon(Icons.checkroom),
          label: 'Looks',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          activeIcon: Icon(Icons.calendar_month),
          label: 'Planejamento',
        ),
      ],
    ),
  );
}
  }
