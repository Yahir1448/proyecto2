import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Chatting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GroupChattingScreen(),
    );
  }
}

class GroupChattingScreen extends StatelessWidget {
  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Acción'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _showAlert(context, 'Abriendo menú');
          },
        ),
        title: Text(
          'Group chatting',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              _showAlert(context, 'Abriendo configuración');
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.8,
              children: [
                _buildImageCard('assets/images/person1.jpg'),
                _buildImageCard('assets/images/person2.jpg'),
                _buildImageCard('assets/images/person3.jpg'),
                _buildImageCard('assets/images/person4.jpg'),
              ],
            ),
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconButton(
                Icons.videocam_off,
                Colors.grey,
                context,
                'Apagar cámara',
              ),
              _buildIconButton(
                Icons.mic_off,
                Colors.grey,
                context,
                'Deshabilitar micrófono',
              ),
              _buildIconButton(
                Icons.call_end,
                Colors.red,
                context,
                'Salir de la llamada',
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'History'),
          BottomNavigationBarItem(
            icon: Badge(label: Text('1'), child: Icon(Icons.person)),
            label: 'Perfil',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          switch (index) {
            case 0:
              _showAlert(context, 'Abriendo Dashboard');
              break;
            case 1:
              _showAlert(context, 'Abriendo Inicio');
              break;
            case 2:
              _showAlert(context, 'Abriendo History');
              break;
            case 3:
              _showAlert(context, 'Abriendo Perfil');
              break;
          }
        },
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildIconButton(
    IconData icon,
    Color color,
    BuildContext context,
    String message,
  ) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          _showAlert(context, message);
        },
      ),
    );
  }
}
