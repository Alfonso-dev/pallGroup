import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:pall_group/src/pages/save_datas.dart';
import 'package:pall_group/src/providers/provider_datas.dart';
import 'package:pall_group/src/url.dart';
import 'package:pall_group/src/widgets/app_bar.dart';
import 'package:pall_group/src/widgets/sub_menu.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class ShowDatas extends StatefulWidget {
  const ShowDatas({Key? key}) : super(key: key);

  @override
  State<ShowDatas> createState() => _ShowDatasState();
}

class _ShowDatasState extends State<ShowDatas> {
  var dataOne = {};
  Future getDatailsPlayers() async {
    try {
      final response = await http.get(
        Uri.parse(url + '/Jugador?jugador=70089'),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBhbGwxIiwibmJmIjoxNjUxMDg4MTE2LCJleHAiOjE2NTY0NDQ5MTYsImlhdCI6MTY1MTA4ODExNn0.YEVDKkooxFP-uznX4Ae-vxe853JzMUCeX-f3ZRhI0mA"
        },
      );
      final responseDatas = jsonDecode(response.body);

      debugPrint('Imprimiendo...');
      debugPrint(responseDatas.toString());

      dataOne = responseDatas;
    } catch (e) {
      debugPrint('Ha ocurrido un error: $e');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDatailsPlayers();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ProviderDatas>(context);
    return Scaffold(
      body: Column(
        children: [
          appBar(),
          subMenu(Icons.people, 'Ficha Jugador', Icons.arrow_back, context),
          dataOne.isEmpty
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 4.h, bottom: 0, left: 4.w, right: 4.w),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(1, 182, 141, 30),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0))),
                        width: 95.w,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 2.h, bottom: 1),
                              child: Stack(
                                children: [
                                  Icon(
                                    Icons.person_pin_circle_rounded,
                                    color: Colors.white38,
                                    size: 30.w,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 50, left: 60),
                                    decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 6.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1.h, bottom: 4),
                              child: Text(
                                dataOne["nombre"].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 0.h, bottom: 0, left: 4.w, right: 4.w),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0))),
                        width: 95.w,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 4.h, bottom: 4.h, left: 14.w, right: 4.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 2.h,
                                        bottom: 2.h,
                                        left: 2.w,
                                        right: 2.w),
                                    child: columnInfo(
                                        Icons.calendar_today,
                                        'Fecha nacimiento',
                                        dataOne["fechaNacimiento"].toString()),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 2.h,
                                        bottom: 2.h,
                                        left: 2.w,
                                        right: 2.w),
                                    child: columnInfo(
                                        Icons.perm_contact_calendar_rounded,
                                        'Rut',
                                        dataOne["rut"].toString()),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 2.h,
                                        bottom: 2.h,
                                        left: 2.w,
                                        right: 2.w),
                                    child: columnInfo(Icons.email, 'E-mail',
                                        dataOne["email"].toString()),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 2.h,
                                          bottom: 2.h,
                                          left: 6.w,
                                          right: 2.w),
                                      child: columnInfo(Icons.phone, 'Telefono',
                                          dataOne["telefono"].toString())),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 1.h, bottom: 2, left: 4.w, right: 4.w),
                        child: Row(
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.person_pin_circle_rounded,
                                color: Colors.grey,
                                size: 10.w,
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              child: Text(
                                'Información',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                      containerInfo(
                          'Club', dataOne["club"]["nombre"].toString()),
                      containerInfo(
                          'Categoria', dataOne["categoria"]["id"].toString()),
                      containerInfo('Mano Dominante',
                          dataOne["esDrive"] == true ? 'Derecha' : 'Izquierda'),
                      containerInfo('Zapatilla y zuela',
                          dataOne["tipoZapatilla"]["nombre"].toString()),
                      containerInfo('Tipo de pala',
                          dataOne["tipoPala"]["nombre"].toString()),
                      InkWell(
                        onTap: () {
                          myProvider.btnPress = true;
                          myProvider.date =
                              dataOne["fechaNacimiento"].toString();
                          myProvider.dni = dataOne["rut"].toString();
                          myProvider.mail = dataOne["email"].toString();
                          myProvider.namePlayer = dataOne["nombre"].toString();
                          myProvider.phone = dataOne["telefono"].toString();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SaveDatas(),
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 1.h, bottom: 1.h, left: 15.w, right: 15.w),
                          width: 20.w,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 8.w,
                                ),
                                Text(
                                  'Edita perfil',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget columnInfo(icon, text, textTwo) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color.fromRGBO(1, 182, 141, 30),
          size: 10.w,
        ),
        Text(
          text,
          style: TextStyle(
              color: const Color.fromRGBO(1, 182, 141, 30),
              fontSize: 13.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          textTwo,
          style: TextStyle(
              color: Colors.grey, fontSize: 10.sp, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget containerInfo(text, textTwo) {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 1.h, left: 4.w, right: 4.w),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.transparent,
      ),
      width: 95.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60.0)),
                color: Color.fromRGBO(1, 182, 141, 30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textTwo,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
