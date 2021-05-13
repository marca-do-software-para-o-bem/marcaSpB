import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:marca_spb/models/user.dart';
import 'package:marca_spb/modules/screen/user_profile/bloc/profile_bloc.dart';
import 'package:marca_spb/modules/screen/user_profile/bloc/profile_event.dart';
import 'package:marca_spb/modules/screen/user_profile/bloc/profile_state.dart';
import 'package:marca_spb/modules/screen/user_profile/components/boxTitle.dart';
import 'package:marca_spb/modules/screen/user_profile/components/boxUser_Name_Cpf.dart';
import 'package:marca_spb/modules/screen/user_profile/components/boxUser_data.dart';
import 'package:marca_spb/modules/screen/user_profile/components/circular_loading.dart';
import 'package:marca_spb/modules/screen/user_profile/components/profileImage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const String _APPBARTITLE = 'Profile';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  Bloc _bloc = ProfilePageBloc(ProfileState());
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _bloc.add(ProfilePageStart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: profileImage(),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffFFFFFF),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Software para o bem',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _status ? _getEditIcon() : Container(),
                                  ],
                                )
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: boxTitle("Nome"),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: boxTitle("CPF/CNPJ"),
                                  flex: 2,
                                ),
                              ],
                            )),
                        BoxUserNameCPF("Software Para o Bem", "-----", _status),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [boxTitle("Email")],
                                ),
                              ],
                            )),
                        boxUserdata("softwarePB@spb.com", _status),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [boxTitle("Endereço")],
                                ),
                              ],
                            )),
                        boxUserdata("-----", _status),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: boxTitle("CEP"),
                                  flex: 2,
                                ),
                              ],
                            )),
                        boxUserdata("user.account.cep", _status),
                        !_status ? _getActionButtons() : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Cancel"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 25.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 25.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  Widget _getAppBar() {
    return AppBar(
      actions: <Widget>[
        Icon(
          LineAwesomeIcons.square_full,
          color: Colors.blue[700],
          size: 35,
        ),
        Icon(MdiIcons.squareRounded,
            color: Color.fromARGB(255, 255, 20, 147), size: 32),
        Icon(
          Icons.circle,
          color: Color.fromARGB(255, 149, 193, 31),
          size: 32,
        )
      ],
      title: Text('Marca Mutante'),
      backgroundColor: Colors.blue[400],
    );
  }
}
