import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pall_group/src/providers/provider_datas.dart';
import 'package:pall_group/src/url.dart';
import 'package:pall_group/src/widgets/app_bar.dart';
import 'package:pall_group/src/widgets/sub_menu.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;

class SaveDatas extends StatefulWidget {
  const SaveDatas({Key? key}) : super(key: key);

  @override
  State<SaveDatas> createState() => _SaveDatasState();
}

class _SaveDatasState extends State<SaveDatas> {
  TextEditingController controllerNamePlayer = TextEditingController();
  TextEditingController controllerRut = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  List<String> clubNames = [];
  List<String> categoriaName = [];
  List<String> skiteName = [];
  List<String> palaNames = [];
  List<String> manoNames = ["Derecha", "Izquierda"];

  var datasClub = {};
  var datasSkites = {};
  var datasCategorias = {};
  var datasPala = {};

  Future getDatasClub() async {
    try {
      final response = await http.get(
        Uri.parse(url + '/Club/all'),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBhbGwxIiwibmJmIjoxNjUxMDg4MTE2LCJleHAiOjE2NTY0NDQ5MTYsImlhdCI6MTY1MTA4ODExNn0.YEVDKkooxFP-uznX4Ae-vxe853JzMUCeX-f3ZRhI0mA"
        },
      );
      final responseDatas = jsonDecode(response.body);

      debugPrint('Imprimiendo...');
      debugPrint(responseDatas.toString());

      datasClub = responseDatas;

      for (var i = 0; i < datasClub["items"].length; i++) {
        clubNames.add(datasClub["items"][i]["nombre"]);
      }
    } catch (e) {
      debugPrint('Ha ocurrido un error: $e');
    }
    setState(() {});
  }

  Future getDatasCategory() async {
    try {
      final response = await http.get(
        Uri.parse(url + '/Categoria/all'),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBhbGwxIiwibmJmIjoxNjUxMDg4MTE2LCJleHAiOjE2NTY0NDQ5MTYsImlhdCI6MTY1MTA4ODExNn0.YEVDKkooxFP-uznX4Ae-vxe853JzMUCeX-f3ZRhI0mA"
        },
      );
      final responseDatas = jsonDecode(response.body);

      debugPrint('Imprimiendo categoria...');
      debugPrint(responseDatas.toString());

      datasCategorias = responseDatas;

      for (var i = 0; i < datasCategorias["items"].length; i++) {
        categoriaName.add(datasCategorias["items"][i]["nombre"]);
      }
    } catch (e) {
      debugPrint('Ha ocurrido un error: $e');
    }
    setState(() {});
  }

  Future getDatasSkite() async {
    try {
      final response = await http.get(
        Uri.parse(url + '/TipoZapatilla/all'),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBhbGwxIiwibmJmIjoxNjUxMDg4MTE2LCJleHAiOjE2NTY0NDQ5MTYsImlhdCI6MTY1MTA4ODExNn0.YEVDKkooxFP-uznX4Ae-vxe853JzMUCeX-f3ZRhI0mA"
        },
      );
      final responseDatas = jsonDecode(response.body);

      debugPrint('Imprimiendo datos zapatillas...');
      debugPrint(responseDatas.toString());

      datasSkites = responseDatas;

      for (var i = 0; i < datasSkites["items"].length; i++) {
        skiteName.add(datasSkites["items"][i]["nombre"]);
      }
    } catch (e) {
      debugPrint('Ha ocurrido un error: $e');
    }
    setState(() {});
  }

  Future getDatasPala() async {
    try {
      final response = await http.get(
        Uri.parse(url + '/TipoPala/all'),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBhbGwxIiwibmJmIjoxNjUxMDg4MTE2LCJleHAiOjE2NTY0NDQ5MTYsImlhdCI6MTY1MTA4ODExNn0.YEVDKkooxFP-uznX4Ae-vxe853JzMUCeX-f3ZRhI0mA"
        },
      );
      final responseDatas = jsonDecode(response.body);

      debugPrint('Imprimiendo datos pala...');
      debugPrint(responseDatas.toString());

      datasPala = responseDatas;

      for (var i = 0; i < datasPala["items"].length; i++) {
        palaNames.add(datasPala["items"][i]["nombre"]);
      }
    } catch (e) {
      debugPrint('Ha ocurrido un error: $e');
    }
    setState(() {});
  }

  Future saveDatas(datas) async {
    try {
      debugPrint('entrando al try');
      final response = await http.post(
        Uri.parse(url + '/Jugador'),
        body: datas,
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBhbGwxIiwibmJmIjoxNjUxMDg4MTE2LCJleHAiOjE2NTY0NDQ5MTYsImlhdCI6MTY1MTA4ODExNn0.YEVDKkooxFP-uznX4Ae-vxe853JzMUCeX-f3ZRhI0mA"
        },
      );
      debugPrint('Datos enviados');
      final responseDatas = jsonDecode(response.body);

      debugPrint('Imprimiendo datos enviados...');
      debugPrint(responseDatas.toString());
    } catch (e) {
      debugPrint('Ha ocurrido un error: $e');
    }
    setState(() {});
  }

  Future updateDatas() async {
    try {} catch (e) {
      debugPrint('Ha ocurrido un error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getDatasClub();
    getDatasCategory();
    getDatasPala();
    getDatasSkite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar(),
          body(),
          myButton(),
        ],
      ),
    );
  }

  Widget body() {
    var myProvider = Provider.of<ProviderDatas>(context);
    return Expanded(
      child: ListView(
        children: [
          subMenu(Icons.people, 'Ficha Jugador (Editar / Crear)',
              Icons.arrow_back, context),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Icon(
                    Icons.person_pin_circle_rounded,
                    size: 30.w,
                    color: const Color.fromRGBO(1, 182, 141, 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 66),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 5.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 30),
              color: Colors.transparent,
              child: Text(
                'Nombre Jugador',
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Container(
              margin: EdgeInsets.only(left: 1.w),
              color: Colors.transparent,
              child: TextField(
                controller: controllerNamePlayer,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: myProvider.btnPress == false
                      ? 'Ingrese Nombre'
                      : myProvider.namePlayer,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: const Text('Rut'),
                    ),
                    myTextField(
                        40.w,
                        myProvider.btnPress == false
                            ? 'Ingrese Rut'
                            : myProvider.dni,
                        controllerRut)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: const Text('Fecha Nacimiento'),
                    ),
                    myTextField(
                        40.w,
                        myProvider.btnPress == false
                            ? 'Fecha Nacimiento'
                            : myProvider.date,
                        controllerDate)
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: const Text('E-mail'),
                    ),
                    myTextField(
                        40.w,
                        myProvider.btnPress == false
                            ? 'Ingrese E-mail'
                            : myProvider.mail,
                        controllerEmail)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: const Text('Telefono'),
                    ),
                    myTextField(
                        40.w,
                        myProvider.btnPress == false
                            ? 'Ingrese Telefono'
                            : myProvider.phone,
                        controllerPhone),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.transparent,
            child: Row(
              children: [
                Icon(
                  Icons.person_pin_circle_rounded,
                  color: Colors.grey,
                  size: 10.w,
                ),
                Text(
                  'Perfil',
                  style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                )
              ],
            ),
          ),
          myDropdown(40.w, 'Club', clubNames),
          Row(
            children: [
              myDropdown(35.w, 'Categoria', categoriaName),
              myDropdown(35.w, 'Mano dominante', manoNames),
            ],
          ),
          Row(
            children: [
              myDropdown(35.w, 'Zapatillas y zuelas', skiteName),
              myDropdown(35.w, 'Tipo de pala', palaNames),
            ],
          ),
        ],
      ),
    );
  }

  Widget myTextField(w, String text, controller) {
    return Container(
      color: Colors.transparent,
      width: w,
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(border: const OutlineInputBorder(), hintText: text),
      ),
    );
  }

  Widget myDropdown(w, text, List<String> nameClub) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        color: Colors.transparent,
        width: w,
        child: DropdownSearch(
          showSelectedItems: true,
          mode: Mode.MENU,
          items: nameClub,
          dropdownSearchDecoration: InputDecoration(
            labelText: text,
          ),
          selectedItem: 'select',
        ),
      ),
    );
  }

  Widget myButton() {
    var myProvider = Provider.of<ProviderDatas>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (myProvider.btnPress == false) {
            // Save Datas

            var myDatas = {
              "id": "1",
              "rut": "sample string 2",
              "nombre": "sample string 3",
              "fechaNacimiento": "2022-05-26T00:00:00",
              "email": "sample string 4",
              "telefono": "sample string 5",
              "partidosJugados": "1",
              "partidosGanados": "1",
              "categoria": {"id": "1"},
              "tipoZapatilla": {"id": "1"},
              "tipoPala": {"id": "1"},
              "esDrive": true,
              "nickname": "PALL",
              "club": {"id": "1"},
              "imagen": "1",
              "fechaIngreso": "2022-05-26T10:58:03.9651241-04:00",
              "foto": null
            };

            if (myDatas.isNotEmpty) {
              saveDatas(myDatas);
            } else {
              debugPrint('Ha ocurrido un error');
            }
          } else {
            // Update Datas
          }
        },
        child: Container(
          width: 40.w,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(1, 182, 141, 30),
              borderRadius: BorderRadius.all(Radius.circular(60.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              myProvider.btnPress == false ? 'Guardar' : 'Editar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
