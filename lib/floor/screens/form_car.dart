import 'package:flutter/material.dart';
import 'package:persistences_types/commons/constants.dart';

import '../models/car.dart';

class FormCarWidget extends StatelessWidget {
  FormCarWidget({super.key});

  final _formKey = GlobalKey<
      FormState>(); //controlador de todo formulário, acionada no assincrono
  final _nameController = TextEditingController();
  final _modelController = TextEditingController();
  final _brandController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const title = novoCarro;
    return Scaffold(
        appBar: AppBar(title: title),
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Nome", labelText: "Nome"),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nome de carro inválido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Modelo", labelText: "Modelo"),
                  controller: _modelController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Modelo de carro inválido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Marca", labelText: "Marca"),
                  controller: _brandController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Marca inválida";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Ano", labelText: "Ano"),
                  controller: _yearController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ano inválido";
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                        child: const Text("Salvar"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final car = Car(
                                _nameController.text,
                                _modelController.text,
                                _brandController.text,
                                _yearController.text);
                            Navigator.pop(context, car);
                          }
                        }))
              ]),
            )));
  }
}
