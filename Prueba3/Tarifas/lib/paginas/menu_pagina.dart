import 'package:flutter/material.dart';
import 'package:onehand/paginas/menu_venta.dart';
import 'package:onehand/paginas/menu_tarifa.dart';
import './page.dart';

class MenuPagina extends StatefulWidget {
  static Route<dynamic> route(String mensaje) {
    return MaterialPageRoute(
      builder: (context) => MenuPagina(mensaje: mensaje),
    );
  }

  final String mensaje;

  const MenuPagina({Key key, @required this.mensaje}) : super(key: key);

  @override
  _MenuPagina createState() => new _MenuPagina();
}

class _MenuPagina extends State<MenuPagina> {
  String currentProfilePic = "assets/logo2.png.png";
  String otherProfilePic = "assets/fondo.png";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Menu Inicial"),
          backgroundColor: Colors.pinkAccent
        ),
        //pantalla desplegable
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text("jjeraldom@alumnos.ceduc.cl"),
                accountName: new Text("Javiera Jeraldo Medalla"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new AssetImage(currentProfilePic),
                  ),
                  onTap: () => print("Cambio cuenta"),
                ),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                    child: new CircleAvatar(
                      backgroundImage: new AssetImage(otherProfilePic),
                    ),
                    onTap: () => switchAccounts(),
                  ),
                ],
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage("assets/fondo.jpg"),
                        fit: BoxFit.fill)),
              ),
              //Seleccion de pestañas
              new ListTile(
                  title: new Text("Tarifas"),
                  trailing: new Icon(Icons.attach_money),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuTarifa()),
                    );
                  }),
              new ListTile(
                  title: new Text("Ventas"),
                  trailing: new Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuVentas()),
                    );
                  }),
              new Divider(),
              new ListTile(
                title: new Text("Salir"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        //pantalla principal MAPA
        body: new Principal());
  }
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 150,
          child: Container(
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              color: Colors.pinkAccent,
              child: Column(
                children: <Widget>[
                  Text(
                    "Ventas",
                    style: TextStyle(fontSize: 30),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        size: 30,
                      ),
                      Text(
                        "152.562",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuTarifa()),
                     );
              },
            ),
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   color: Colors.blue,
            // ),
            padding: EdgeInsets.all(100.0),
            margin: EdgeInsets.all(10.0),
          ),
        ),
        Positioned(
          top: 250,
          child: Container(
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              color: Colors.pinkAccent,
              child: Column(
                children: <Widget>[
                  Text(
                    "Atenciones",
                    style: TextStyle(fontSize: 30),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.av_timer,
                        size: 30,
                      ),
                      Text(
                        "73.659",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuVentas()),
                     );
              },
            ),
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   color: Colors.blue,
            // ),
            padding: EdgeInsets.all(110.0),
          ),
        ),
      ],
    );
  }

  // final
}
