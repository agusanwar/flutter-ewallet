import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/profile_menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackSoftColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Profile Akun',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          // loading
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: state.user.profilePicture == null
                                      ? const AssetImage(
                                          'assets/images/img_profile.png',
                                        )
                                      : NetworkImage(
                                          state.user.profilePicture!,
                                        ) as ImageProvider,
                                ),
                              ),
                              child: state.user.verified == 1
                                  ? Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        height: 28,
                                        width: 28,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kDarkBackgraundColor,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.check_circle,
                                            color: kGreenColor,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              state.user.name.toString(),
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Setting',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kBlackSoftColor,
                          ),
                          child: Column(
                            children: [
                              ProfileMenuItem(
                                onTap: () async {
                                  if (await Navigator.pushNamed(
                                          context, '/pin') ==
                                      true) {
                                    Navigator.pushNamed(
                                        context, '/profile-edit');
                                  }
                                },
                                iconUrl: 'assets/icons/ic_user.png',
                                title: 'Edit Profile',
                                icon: Icon(
                                  Icons.verified_user,
                                  size: 15,
                                  color: kBlackColor,
                                ),
                                color: kYellowColor,
                              ),
                              const Divider(
                                thickness: 2,
                                height: 2,
                              ),
                              ProfileMenuItem(
                                onTap: () async {
                                  if (await Navigator.pushNamed(
                                          context, '/pin') ==
                                      true) {
                                    Navigator.pushNamed(
                                        context, '/profile-edit-pin');
                                  }
                                },
                                iconUrl: 'assets/icons/ic_my_pin.png',
                                title: 'My PIN',
                              ),
                              const Divider(
                                thickness: 2,
                                height: 2,
                              ),
                              ProfileMenuItem(
                                iconUrl: 'assets/icons/ic_wallet.png',
                                title: 'E-Wallet Setting',
                                icon: Icon(
                                  Icons.wallet,
                                  size: 15,
                                  color: kWhiteColor,
                                ),
                                color: kBlueColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Help',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kBlackSoftColor,
                          ),
                          child: Column(
                            children: [
                              ProfileMenuItem(
                                iconUrl: 'assets/icons/ic_my_reward.png',
                                title: 'My Reward',
                                icon: Icon(
                                  Icons.card_membership,
                                  size: 15,
                                  color: kBlackColor,
                                ),
                                color: kGreenColor,
                              ),
                              const Divider(
                                thickness: 2,
                                height: 2,
                              ),
                              ProfileMenuItem(
                                iconUrl: 'assets/icons/ic_help_center.png',
                                title: 'Contact US',
                                icon: Icon(
                                  Icons.headset_mic_outlined,
                                  size: 15,
                                  color: kWhiteColor,
                                ),
                                color: kRedColor,
                              ),
                              const Divider(
                                thickness: 2,
                                height: 2,
                              ),
                              const ProfileMenuItem(
                                iconUrl: 'assets/icons/ic_statistic.png',
                                title: 'Terms and Conditions',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Information',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kBlackSoftColor,
                          ),
                          child: Column(
                            children: [
                              ProfileMenuItem(
                                iconUrl: 'assets/icons/ic_travel.png',
                                title: 'Information Aplikasi',
                                icon: Icon(
                                  Icons.info_outline_rounded,
                                  size: 15,
                                  color: kBlackColor,
                                ),
                                color: kYellowColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Versi Aplkasi 1.0.0',
                          style: graySoftTextStyle.copyWith(
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomFilledButton(
                          title: 'Logout',
                          color: kBlueDarkColor,
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthLogout());
                          },
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
