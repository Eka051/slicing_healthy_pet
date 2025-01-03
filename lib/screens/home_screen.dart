import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_pet/models/doctor_model.dart';
import 'package:healthy_pet/models/service_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

var selectedService = 0;
var menus = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _greetings(),
              const SizedBox(
                height: 16,
              ),
              _card(),
              const SizedBox(
                height: 21,
              ),
              _search(),
              const SizedBox(
                height: 20,
              ),
              _services(),
              const SizedBox(
                height: 27,
              ),
              _doctors()
            ],
          ),
        )));
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: menus
          .map((e) => BottomNavigationBarItem(icon: Icon(e), label: ''))
          .toList(),
      selectedItemColor: const Color(0xFF818AF9),
      unselectedItemColor: const Color(0xFFACA3A3),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  ListView _doctors() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(doctors[index]),
        separatorBuilder: (context, index) => SizedBox(
              height: 11,
            ),
        itemCount: doctors.length);
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF35385A).withAlpha(30),
                blurRadius: 30,
                offset: const Offset(0, 2))
          ]),
      child: Row(children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            'assets/images/${doctorModel.image}',
            height: 103,
            width: 88,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorModel.name,
                style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3E3F)),
              ),
              const SizedBox(
                height: 7,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Services: ${doctorModel.services.join(', ')}',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: Colors.black,
                      ))),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    FeatherIcons.mapPin,
                    color: const Color(0xFFACA3A3),
                    size: 14,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    '${doctorModel.distance} km',
                    style: GoogleFonts.manrope(
                        fontSize: 12, color: const Color(0xFFACA3A3)),
                  )
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(
                    'Available for',
                    style: GoogleFonts.manrope(
                        color: const Color(0xFF50CC98),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/svgs/cat.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset('assets/svgs/dog.svg'),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: index == selectedService
                      ? const Color(0xFF818AF9)
                      : const Color(0xFFF6F6F6),
                  border: selectedService == index
                      ? Border.all(
                          color: const Color(0xFFF1E5E5).withAlpha(56),
                          width: 2)
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    Service.all()[index],
                    style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: selectedService == index
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF3F3E3F).withAlpha(76)),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: Service.all().length),
    );
  }

  Widget _search() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextFormField(
            decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(FeatherIcons.search,
              color: Color(0xFFADACAD), size: 20),
          hintText: 'Find best vaccinate, treatment...',
          hintStyle: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFCACACA),
            height: 150 / 100,
          ),
        )));
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xFF818AF9),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background_card.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Your ',
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            color: Colors.white,
                            height: 150 / 100),
                        children: const [
                          TextSpan(
                              text: 'Catrine',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              )),
                          TextSpan(text: 'will get\nvaccination '),
                          TextSpan(
                              text: 'tomorrow\nat 07.00 am!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                        ]),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(102),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Colors.white.withAlpha(50),
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'See details',
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Hello Human!',
              style: GoogleFonts.manrope(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: const Color(0XFF3F3E3F))),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FeatherIcons.shoppingBag),
                color: const Color(0xFF818AF9),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: const Color(0xFFEF6497),
                      borderRadius: BorderRadius.circular(15 / 2)),
                  child: Center(
                    child: Text(
                      '2',
                      style: GoogleFonts.mPlus1(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
