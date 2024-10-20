import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Logo Section
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://i.imgur.com/ZufGk9I.png', // Placeholder for logos
                      height: 50,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('SOP Layanan'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Daftar Akun'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Responsive layout
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    // Desktop Layout
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 400), // Limit max width
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                            child: loginSection(context), // Pass context here
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                            child: serviceSection(context), // Pass context here
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Mobile Layout
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: loginSection(context), // Pass context here
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        serviceSection(context), // Pass context here
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Login',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text('Masukkan email untuk masuk'),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.visibility_off),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.network(
              'https://i.imgur.com/j6z8BZz.png', // Placeholder for captcha
              height: 50,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Masukkan hasil penjumlahan',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text('Tidak Punya Akun? Daftar'),
              ),
            ),
            const SizedBox(width: 10), // Small space between buttons
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text('Lupa password? Reset password'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget serviceSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        children: [
          const Text(
            'PELAYANAN KESEJAHTERAAN SOSIAL SATU PINTU',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 20, // Space between icons
            runSpacing: 20, // Space between rows
            alignment: WrapAlignment.center, // Center align icons
            children: const [
              ServiceIcon(
                iconData: Icons.integration_instructions,
                label: 'Integrasi Layanan',
              ),
              ServiceIcon(
                iconData: Icons.interests,
                label: 'Integrasi Program Intervensi',
              ),
              ServiceIcon(
                iconData: Icons.groups,
                label: 'Kolaborasi Potensi Sumber Kesejahteraan Sosial',
              ),
              ServiceIcon(
                iconData: Icons.cloud,
                label: 'Single Data',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData iconData;
  final String label;

  const ServiceIcon({
    Key? key,
    required this.iconData,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 50,
        ),
        const SizedBox(height: 10),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}
