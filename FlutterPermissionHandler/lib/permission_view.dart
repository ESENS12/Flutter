import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_permission_handler/scale_layout.dart';

// ignore: must_be_immutable
class CustomPermissionView extends StatelessWidget {
  void Function()? callBack;

  CustomPermissionView({Key? key, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    scaleLayout.init(false, Orientation.portrait,size,size,size);
    Brightness? themeMode = SchedulerBinding.instance?.window
        .platformBrightness;
    bool _night = themeMode == Brightness.dark;

    List<Permission> requiredPerList = Platform.isAndroid ? [
      Permission.storage,
      Permission.location
    ] : [Permission.location];
    List<Permission> selectedPerList = [
      Permission.microphone,
      Permission.speech
    ];
    List<Map> requiredPermissions = [
      {
        "icon": FontAwesomeIcons.locationDot,
        "title": "Location",
        "content": "앱 사용 중 및 백그라운드 상태에서 위치 데이터를 수집 합니다."
      },
      Platform.isAndroid
          ? {
        "icon": FontAwesomeIcons.solidFolder,
        "title": "Storage",
        "content": "사용자 설정 데이터를 저장하고 관리합니다"
      }
          : {}
    ];
    List<Map> selectedPermissions = [
      {
        "icon": FontAwesomeIcons.microphone,
        "title": "Microphone",
        "content": "음성 녹음 기능을 사용합니다."
      },
    ];

    List<Widget> requiredPermissionList = _makePermissionItem(
        context, requiredPermissions, _night);
    List<Widget> selectedPermissionList = _makePermissionItem(
        context, selectedPermissions, _night);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
                top: 20.0.r, bottom: 10.0.r, left: 20.0.r, right: 0.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.0.r),

                ),
                Expanded(
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(text: "앱 사용을 위하여\n아래",
                            style: TextStyle(
                                color: _night ? Color(0xFFFFFFFF) : Color
                                    .fromRGBO(0, 0, 0, 1))),
                        TextSpan(text: "접근권한의 허용",
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 96, 255, 1))),
                        TextSpan(text: "이 필요합니다.",
                            style: TextStyle(
                                color: _night ? Color(0xFFFFFFFF) : Color
                                    .fromRGBO(0, 0, 0, 1))),
                      ],
                          style: TextStyle(fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w700,
                              fontSize: 32.0.rt)),
                    ))
              ],
            ),
          ),
          Divider(
            color: _night ? Color.fromRGBO(102, 102, 102, 1) : Color.fromRGBO(
                204, 204, 204, 1),
            thickness: 1.8,
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: 20.0.r, bottom: 0.0.r, left: 40.0.r, right: 30.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 20.0.r),
                        child: Text(
                          "필수 접근 권한",
                          style: TextStyle(
                              color: _night ? Color(0xFFFFFFFF) : Color
                                  .fromRGBO(0, 0, 0, 1),
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 30.0.rt),
                        )),
                    ...requiredPermissionList,
                    Container(
                        margin: EdgeInsets.only(top: 30.0.r, bottom: 20.0.r),
                        child: Text(
                          "선택 접근 권한",
                          style: TextStyle(
                              color: _night ? Color(0xFFFFFFFF) : Color
                                  .fromRGBO(0, 0, 0, 1),
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 30.0.rt),
                        )),
                    ...selectedPermissionList,
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 35.0.r, left: 40.0.r, right: 40.0.r),
            child: ElevatedButton(
              child: Text(
                "확인",
                style: const TextStyle(color: Color(0xFFFFFFFF),
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 96, 255, 1),
                  minimumSize: Size.fromHeight(85.0.r)),
              onPressed: () async {
                bool result = await callPermission(requiredPerList,
                    selectedPerList);
                if (result) {
                  // request confirm

                } else {
                  // request denied

                  Future.delayed(const Duration(seconds: 5), () async {
                    await openAppSettings();
                    exit(0);
                  });
                }
              },
            ),
          )
        ]),
      ),
    );
  }

  List<Widget> _makePermissionItem(BuildContext context, List<Map> list,
      bool night) {
    List<Widget> resultList = [];

    for (int i = 0; i < list.length; i++) {
      Map item = list[i];
      if (item.isNotEmpty) {
        Widget result = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(right: 25.0.r),
                width: 60.0.r,
                height: 60.0.r,
                ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item["title"],
                      style: TextStyle(
                          color: night ? Color(0xFFFFFFFF) : Color.fromRGBO(
                              0, 0, 0, 1),
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 35.0.rt),
                    ),
                    Text(
                      item["content"],
                      style: TextStyle(
                          color: night ? Color.fromRGBO(204, 204, 204, 1) : Color.fromRGBO(102, 102, 102, 1),
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ))
          ],
        );
        resultList.add(result);
        if (i != list.length - 1) {
          resultList.add(SizedBox(height: 35.0.r));
        }
      }
    }
    return resultList;
  }

  Future<bool> callPermission(List<Permission> requiredPerList,
      List<Permission> selectedPerList) async {
    List<bool> approveList = [];
    final bool per;

    List<Permission> perList = [...requiredPerList, ...selectedPerList];

    Map<Permission, PermissionStatus> statuses = await perList.request();

    for (var key in statuses.keys) {
      bool result = selectedPerList.contains(key);

      if (!result) {
        bool approve = statuses[key] == PermissionStatus.granted;
        approveList.add(approve);
      }
    }

    if (approveList.every((element) => element)) {
      per = true;
    } else {
      per = false;
    }

    return per;
  }
}

