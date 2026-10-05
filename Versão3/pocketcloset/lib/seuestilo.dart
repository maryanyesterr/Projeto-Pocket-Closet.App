import 'package:flutter/material.dart';

class SeuEstilo extends StatelessWidget {
  const SeuEstilo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // LOGO
              Row(
                children: [
                  Image.asset('assets/logo.png', width: 38, height: 38),
                ],
              ),

              const SizedBox(height: 16),

              // BARRA DE PROGRESSO
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7B1FA2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // TITULO
              const Text(
                'Seu estilo',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Quais estilos predominam na sua rotina?',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 18),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  StyleChip('Casual'),
                  StyleChip('Elegante'),
                  StyleChip('Streetwear'),
                  StyleChip('Minimalista'),
                  StyleChip('Colorido'),
                  StyleChip('Romântico'),
                  StyleChip('Esportivo'),
                  StyleChip('Boho'),
                  StyleChip('Gótico'),
                  StyleChip('Grunge'),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Seus Objetivos',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 14),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  ObjectiveChip('💸 Economizar'),
                  ObjectiveChip('🎀 Organizar'),
                  ObjectiveChip('👗 Montar looks'),
                  ObjectiveChip('♻️ Sustentabilidade'),
                  ObjectiveChip('✈️ Viagens'),
                  ObjectiveChip('💼 Trabalho/Facul'),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A1B9A),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    'Próximo',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}

class StyleChip extends StatelessWidget {
  final String text;

  const StyleChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF6D983),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF6A1B9A),
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}

class ObjectiveChip extends StatelessWidget {
  final String text;

  const ObjectiveChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE3C3FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF6A1B9A),
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}
