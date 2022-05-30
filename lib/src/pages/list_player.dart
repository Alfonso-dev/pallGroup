import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:pall_group/src/pages/save_datas.dart';
import 'package:pall_group/src/pages/show_datas.dart';
import 'package:pall_group/src/providers/provider_datas.dart';
import 'package:pall_group/src/url.dart';
import 'package:pall_group/src/widgets/app_bar.dart';
import 'package:pall_group/src/widgets/sub_menu.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class PlayerList extends StatefulWidget {
  const PlayerList({Key? key}) : super(key: key);

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  var dataOne = {};
  Future getAllPlayers() async {
    try {
      final response = await http.get(
        Uri.parse(url + '/Jugador/listado?pagina=0&filas=1&sinFoto=true'),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBhbGwxIiwibmJmIjoxNjUxMDg4MTE2LCJleHAiOjE2NTY0NDQ5MTYsImlhdCI6MTY1MTA4ODExNn0.YEVDKkooxFP-uznX4Ae-vxe853JzMUCeX-f3ZRhI0mA"
        },
      );
      final responseDatas = jsonDecode(response.body);

      debugPrint('Imprimiendo...');
      debugPrint(responseDatas["items"].toString());

      dataOne = responseDatas;
    } catch (e) {
      debugPrint('Ha ocurrido un error: $e');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPlayers();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ProviderDatas>(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: SizerUtil.deviceType == DeviceType.mobile ? 100.w : 100.w,
        height: SizerUtil.deviceType == DeviceType.mobile ? 100.h : 100.h,
        child: Column(
          children: [
            appBar(),
            subMenu(
                Icons.people, 'Listado Jugadores', Icons.arrow_back, context),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 0, left: 50),
                color: Colors.transparent,
                child: Text(
                  'dataOne',
                  style: TextStyle(fontSize: 11.sp),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              width: SizerUtil.deviceType == DeviceType.mobile ? 80.w : 80.w,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nombre',
                ),
                style: TextStyle(),
              ),
            ),
            dataOne.isEmpty
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: dataOne.isEmpty ? 0 : dataOne["items"].length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_pin_circle_rounded,
                                      color:
                                          const Color.fromRGBO(1, 182, 141, 30),
                                      size: 20.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Icon(
                                            Icons.perm_contact_calendar_rounded,
                                            color: const Color.fromRGBO(
                                                1, 182, 141, 30),
                                            size: 6.w,
                                          ),
                                        ),
                                        Text(
                                            dataOne["items"][index]["nombre"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp)),
                                        Text(
                                          dataOne["items"][index]["categoria"]
                                                  ["id"]
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11.sp),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ShowDatas(),
                                        ));
                                  },
                                  child: Container(
                                    width: 95.w,
                                    height: 4.h,
                                    color:
                                        const Color.fromRGBO(1, 182, 141, 30),
                                    child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Ver Ficha',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.red.shade300,
        onPressed: () {
          myProvider.btnPress = false;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SaveDatas(),
              ));
        },
      ),
    );
  }
}
