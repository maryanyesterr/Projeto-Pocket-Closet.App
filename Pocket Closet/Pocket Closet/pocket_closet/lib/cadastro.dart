import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Logo

              const SizedBox(height: 16),
              // Título
              const Text(
                "Criar conta",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(68, 17, 140, 1),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Comece Grátis! O seu estilo organizado nunca esteve tão fácil.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 10),

              // Campos de formulário
              _InputField(label: "Nome", hint: "Ana"),
              _InputField(label: "Sobrenome", hint: "Silva"),
              _InputField(label: "E-mail", hint: "seuemail@dominio.com"),
              _InputField(
                label: "Idade",
                hint: "21",
                keyboard: TextInputType.number,
              ),
              _InputField(
                label: "Senha",
                hint: "mínimo de 8 caracteres",
                obscure: true,
              ),
              const SizedBox(height: 30),
              // Botão principal
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(68, 17, 140, 1),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // ação ao clicar em Próximo
                },
                child: const Text("Próximo"),
              ),
              const SizedBox(height: 12),
              // Link de esqueci senha
              TextButton(
                onPressed: () {
                  // ação ao clicar em Esqueci minha senha
                },
                child: const Text(
                  "Esqueci minha senha →",
                  style: TextStyle(color: Color.fromRGBO(68, 17, 140, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final TextInputType keyboard;

  const _InputField({
    required this.label,
    required this.hint,
    this.obscure = false,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        obscureText: obscure,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
         enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // arredondamento
            borderSide: BorderSide(
              color: Color.fromRGBO(246, 214, 85, 1), // cor da borda quando não focado
              width: 2,                       // espessura
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(246, 214, 85, 1), // cor da borda quando focado
              width: 2.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red, // cor da borda em caso de erro
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}