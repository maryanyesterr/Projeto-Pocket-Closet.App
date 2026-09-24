import 'package:flutter/material.dart';

class Guardaroupa extends StatefulWidget {
  const Guardaroupa({super.key});

  @override
  State<Guardaroupa> createState() => _GuardaroupaState();
}

class _GuardaroupaState extends State<Guardaroupa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
                      
              // Linha que junta a Logo e o Texto lado a lado
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 40, // Reduzido para aproximar do tamanho da imagem
                    height: 40,
                    child: Image.asset("assets/img/logo.png"),
                  ),
                  const SizedBox(width: 12), // Espaço entre a logo e o texto
                  
                  // Coluna interna para empilhar o "Olá" e a pergunta
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá, (nome)",
                          style: TextStyle(
                            fontFamily: "YoungSerif",
                            fontSize: 22, // Tamanho ajustado conforme o design
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Vamos escolher seu look para hoje?",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              // Espaçamento antes do bloco roxo
              const SizedBox(height: 24),

              // Bloco Roxo Centralizado/Expandido
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(81, 17, 147, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(height: 34),
              const Text("Look do dia", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black,)),
              // Dar espaço aqui
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(81, 17, 147, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],

          ),
        ),
      
      ),
    );
  }
}
