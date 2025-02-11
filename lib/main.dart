import 'package:flutter/material.dart';
import 'package:loda_attendance/core/utils/color_manager.dart';
import 'package:loda_attendance/core/utils/size_manager.dart';
import 'package:loda_attendance/core/utils/styles_manager.dart';
import 'package:loda_attendance/modules/view/screens/splash_screen.dart';
import 'package:loda_attendance/modules/view/widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  double animationHeightForSun = 0;
  double animationHeight = 0;

  @override
  void didChangeDependencies() {
    increaseAnimation();
    super.didChangeDependencies();
  }

  void increaseAnimation() {
    Future.delayed(const Duration(milliseconds: 50), () {
      animationHeight = 350;
      animationHeightForSun = 200;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = SizeManager.height(context);
    final double width = SizeManager.width(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: <Widget>[
              customAppBar(animationHeight, animationHeightForSun),
              appBarTitle(width),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: width * 0.05,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    defaultFormField(
                      controller: emailController,
                      label: "Email",
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      label: "Password",
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    defaultButton("Login"),
                    notRegisterAccountLabel(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget notRegisterAccountLabel() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have account yet ?",
          style: TextStyleManager.getRegularStyle(),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Create Account",
            style: TextStyleManager.getRegularStyle().copyWith(
              color: ColorManager.primary,
            ),
          ),
        )
      ],
    );

Widget customAppBar(double animationHeight, double animationHeightForSun) => Align(
      heightFactor: 0.8,
      alignment: AlignmentDirectional.topCenter,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomAppBar(),
            child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.bounceOut,
                height: animationHeight,
                color: ColorManager.secondary),
          ),
          ClipPath(
            clipper: CustomAppBarSun(),
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.bounceOut,
              height: animationHeightForSun,
              color: ColorManager.secondary,
            ),
          ),
        ],
      ),
    );

Widget appBarTitle(double width) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "LODA",
          style: TextStyleManager.getAppBarTextStyle()
              .copyWith(color: ColorManager.primary),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Text(
          "IT",
          style: TextStyleManager.getAppBarTextStyle().copyWith(
            color: ColorManager.primary,
          ),
        ),
      ],
    );

class CustomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CustomAppBarSun extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 1.9, 0);
    path.quadraticBezierTo(
        size.width / 1.8, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
