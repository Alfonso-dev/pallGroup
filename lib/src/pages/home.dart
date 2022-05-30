import 'package:flutter/material.dart';
import 'package:pall_group/src/pages/list_player.dart';
import 'package:pall_group/src/providers/provider_datas.dart';
import 'package:pall_group/src/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ProviderDatas(),
            )
          ],
          child: MaterialApp(
            title: 'Pall Group',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const InitialApp(),
          ),
        );
      },
    );
  }
}

class InitialApp extends StatefulWidget {
  const InitialApp({Key? key}) : super(key: key);

  @override
  State<InitialApp> createState() => _InitialAppState();
}

class _InitialAppState extends State<InitialApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: SizerUtil.deviceType == DeviceType.mobile ? 100.w : 100.w,
        height: SizerUtil.deviceType == DeviceType.mobile ? 100.h : 100.h,
        child: Column(
          children: [
            appBar(),
            body(),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: SizerUtil.deviceType == DeviceType.mobile ? 3.h : 3.h,
              horizontal:
                  SizerUtil.deviceType == DeviceType.mobile ? 3.w : 3.w),
          child: Row(
            children: [
              const Icon(
                Icons.home,
                color: Colors.grey,
              ),
              Text(
                'Inicio',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: SizerUtil.deviceType == DeviceType.mobile
                        ? 17.sp
                        : 17.sp),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: SizerUtil.deviceType == DeviceType.mobile ? 8.h : 15.h,
            horizontal: SizerUtil.deviceType == DeviceType.mobile ? 13.w : 13.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/pall.png",
                    width: 25,
                  ),
                  Text(
                    'PALL',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(85, 85, 85, 100),
                        fontSize: SizerUtil.deviceType == DeviceType.mobile
                            ? 30.sp
                            : 24.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Tecnology',
                    style: TextStyle(
                        color: const Color.fromRGBO(147, 186, 176, 100),
                        fontSize: SizerUtil.deviceType == DeviceType.mobile
                            ? 26.sp
                            : 26),
                  ),
                  Text(
                    'Group',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(22, 176, 136, 100),
                        fontSize: SizerUtil.deviceType == DeviceType.mobile
                            ? 26.sp
                            : 26),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: SizerUtil.deviceType == DeviceType.mobile ? 1.h : 5.h,
              horizontal:
                  SizerUtil.deviceType == DeviceType.mobile ? 10.w : 10.w),
          color: const Color.fromRGBO(204, 241, 233, 70),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              'Seleccione una opción',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(1, 182, 141, 30),
                  fontSize: SizerUtil.deviceType == DeviceType.mobile
                      ? 17.sp
                      : 17.sp),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: SizerUtil.deviceType == DeviceType.mobile ? 2.h : 15.h,
            horizontal: SizerUtil.deviceType == DeviceType.mobile ? 10.w : 10.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              opsiones(Icons.people, 'Jugadores', 1),
              opsiones(Icons.people, 'Partidos', 2),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            opsiones(Icons.calendar_today_outlined, 'Arriendos', 3),
            opsiones(Icons.home, 'Clubes', 4)
          ],
        )
      ],
    );
  }

  Widget opsiones(icono, text, number) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PlayerList(),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: Color.fromRGBO(1, 182, 141, 30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(icono, color: Colors.white),
              const SizedBox(
                width: 6,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
