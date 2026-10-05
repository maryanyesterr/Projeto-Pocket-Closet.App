import 'package:flutter/material.dart';

class SuasMedidas extends StatelessWidget {
  const SuasMedidas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LOGO
              Image.asset('assets/logo.png', width: 40, height: 40),

              const SizedBox(height: 12),

              // BARRA DE PROGRESSO
              Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff6A1B9A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text("Suas medidas"),

              const SizedBox(height: 18),

              const Text(
                "Para sugestões mais precisas de combinações",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MeasureItem(title: "Busto (CM)", value: "90"),
                  MeasureItem(title: "Cintura (CM)", value: "80"),
                ],
              ),

              const SizedBox(height: 22),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MeasureItem(title: "Quadril (CM)", value: "78"),
                  MeasureItem(title: "Altura (CM)", value: "1,68"),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Tamanho de roupas",
                style: TextStyle(
                  color: Color(0xff6A1B9A),
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 16),

              Wrap(
                spacing: 8,
                children: const [
                  SizeChip("PP"),
                  SizeChip("P"),
                  SizeChip("M"),
                  SizeChip("G"),
                  SizeChip("GG"),
                  SizeChip("XGG"),
                ],
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffD9B3FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "+ Tamanhos",
                    style: TextStyle(
                      color: Color(0xff6A1B9A),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6A1B9A),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "Pronto, criar conta",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class MeasureItem extends StatelessWidget {
  final String title;
  final String value;

  const MeasureItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff6A1B9A),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          width: 46,
          height: 22,
          decoration: BoxDecoration(
            color: Color(0xffF6D983),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xff6A1B9A),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class SizeChip extends StatelessWidget {
  final String label;

  const SizeChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xffE3C3FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xff6A1B9A),
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
      ),
    );
  }
}
