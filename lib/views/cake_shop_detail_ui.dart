import 'package:flutter/material.dart';

class CakeShopDetailUi extends StatefulWidget {
   CakeShopDetailUi({super.key});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:  Text(
          'Larna House',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding:  EdgeInsets.all(16.0),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'assets/images/s41.jpg',
                height: 120.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
           SizedBox(
            height: 12.0
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'assets/images/s42.jpg',
                  height: 100.0,
                  width: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
               SizedBox(
                width: 16.0
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'assets/images/s43.jpg',
                  height: 100.0,
                  width: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
           SizedBox(
            height: 24.0
          ),
          _buildInfoSection(
            icon: '🏪',
            title: 'ชื่อร้าน',
            subtitle: 'Larna House',
          ),
          _buildInfoSection(
            icon: '⏰',
            title: 'เวลาเปิดปิด',
            subtitle: 'ทุกวัน 09.00-21.00 น.',
          ),
          _buildInfoSection(
            icon: '💬',
            title: 'รายละเอียดร้าน',
            subtitle: 'คิดถึงเค้กช็อกโกแลต ต้องคิดถึง Larna House เพราะร้านนี้มีจุดเด่นอยู่ที่เค้กช็อกโกแลตหน้านิ่มสูตรต้นตำรับจากสิงคโปร์ ที่คัดสรรวัตถุดิบอย่างดีจากแหล่งผลิตชั้นยอด ผสานความใส่ใจในทุกขั้นตอนและประสบการณ์ของทางร้านกว่า 20 ปีในการสร้างสรรค์เค้กวันเกิด ทำให้ได้เค้กที่มีรสชาติหอม นุ่มละมุน ชุ่มฉ่ำเนื้อช็อกโกแลตในทุกๆ คำ',
          ),
          _buildInfoSection(
            icon: '🚩',
            title: 'ที่อยู่ของร้าน',
            subtitle: 'พัฒนาการ 61',
          ),
           SizedBox(
            height: 16.0
            ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon:  Icon(Icons.phone, color: Colors.white),
              label:  Text('023215995', style: TextStyle(color: Colors.white, fontSize: 16.0)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:  EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
          ),
           SizedBox(
            height: 20.0
          ),
          _buildLinkRow(Icons.language, Colors.amber, 'https://larnahouse.com/'),
           SizedBox(
            height: 12.0
          ),
          _buildLinkRow(Icons.facebook, Colors.blue, 'https://facebook.com/%20larnahouse'),
           SizedBox(
            height: 24.0
          ),

          // ส่วนแผนที่จำลอง (Mockup Map)
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'assets/images/map.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildInfoSection({required String icon, required String title, required String subtitle}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                icon, 
                style: TextStyle(
                  fontSize: 18.0
                  )
                ),
               SizedBox(
                width: 8.0
                ),
              Text(
                title,
                style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
           SizedBox(
            height: 4.0
            ),
          Padding(
            padding:  EdgeInsets.only(left: 26.0),
            key: ValueKey(title),
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildLinkRow(IconData icon, Color iconColor, String url) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 24),
         SizedBox(
          width: 12.0,
          ),
        Expanded(
          child: Text(
            url,
            style:  TextStyle(color: Colors.black87, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon:  Icon(Icons.link, color: Colors.grey),
          onPressed: () {},
        ),
      ],
    );
  }
}