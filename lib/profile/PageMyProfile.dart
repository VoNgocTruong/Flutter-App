import 'package:flutter/material.dart';
class PageMyProfile extends StatefulWidget {
  const PageMyProfile({Key? key}) : super(key: key);

  @override
  State<PageMyProfile> createState() => _PageMyProfileState();
}

class _PageMyProfileState extends State<PageMyProfile> {
  String gioiTinh = "Nam";
  String phepTinh = "Cong";
  List<String> phepTinhs = ["Cong","Tru","Nhan","Chia","Tich phan","Dao ham"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            UserAccountsDrawerHeader(
                accountName: Text("Truong"),
                accountEmail: Text("truongv366@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/IMG_20230219_173536.jpg"),
              ),
            ),

            ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Inbox"),
              trailing: Text("10"),
            ),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Phone"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset("assets/images/IMG_20230219_173536.jpg", fit: BoxFit.fill,),
              ),
              const SizedBox(height: 20,),
              const Text("Ho ten"),
              Text("Trường",style: TextStyle
                (fontSize: 20, color: Colors.blue[800], fontWeight: FontWeight.bold)),
              const SizedBox(height: 20,),
              const Text("Ngay Sinh"),
              Text("14/02/2002", style: TextStyle(fontSize: 20,color: Colors.blue[800],fontWeight: FontWeight.bold ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: Radio(
                        value: "Nam",
                        groupValue: gioiTinh,
                        onChanged: (value) {
                          setState(() {
                            gioiTinh = value as String;
                          });
                        },
                      ),
                      title: Text("Nam"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: Radio(
                        value: "Nu",
                        groupValue: gioiTinh,
                        onChanged: (value) {
                          setState(() {
                            gioiTinh = value as String;
                          });
                        },
                      ),
                      title: Text("Nu"),
                    ),
                  ),],

              ),
              const SizedBox(height: 20),
              const Text("Que quan"),
              const Text("Ninh thuan, phan rang",style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20,),
              const Text("So Thich"),
              const Text("Nghe Nhac",style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              const Text("Phep tinh hay dung",style: TextStyle(fontSize: 20)),
              DropdownButton<String>(
                isExpanded: true,
                value: phepTinh,
                  items: phepTinhs.map((e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                  )).toList(),
                  onChanged: (value){
                    setState(() {
                      phepTinh = value as String;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
