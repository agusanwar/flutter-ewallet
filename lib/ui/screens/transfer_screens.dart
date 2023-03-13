import 'package:aipay/blocs/user/user_bloc.dart';
import 'package:aipay/models/transfer_form_model.dart';
import 'package:aipay/models/user_model.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/transfer_amount_screens.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:aipay/ui/widgets/transfer_recent_user_item_widget.dart';
import 'package:aipay/ui/widgets/transfer_resault_user_item._widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferScreens extends StatefulWidget {
  const TransferScreens({super.key});

  @override
  State<TransferScreens> createState() => _TransferScreensState();
}

class _TransferScreensState extends State<TransferScreens> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  // user bloc = untuk menempilkan awal recent user saat screen transfer awal
  late UserBloc userBloc;
  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackSoftColor,
        centerTitle: true,
        title: Text(
          'Transfer Money',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBlackSoftColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Transfer',
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    title: 'Find By Username',
                    isShowTitle: false,
                    controlller: usernameController,
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        userBloc
                            .add(UserGetByUsername(usernameController.text));
                      } else {
                        selectedUser = null;
                        userBloc.add(UserGetRecent());
                      }
                      // call controller
                      setState(() {});
                    },
                  ),
                  // Recent user
                  usernameController.text.isEmpty
                      ? buildRecentUser()
                      : buildResaultUser(),
                  // buildResaultUser(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: selectedUser != null
          ? Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomFilledButton(
                title: 'Continue',
                color: kBlueDarkColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferAmountScreens(
                        data: TransferFormModel(sendTo: selectedUser!.username),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildRecentUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent User',
            style: grayTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Column(
                  children: state.users.map((user) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransferAmountScreens(
                                data: TransferFormModel(
                                  sendTo: user.username,
                                ),
                              ),
                            ),
                          );
                        },
                        child: TransferRecentUserItem(user: user));
                  }).toList(),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildResaultUser() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resault User',
            style: grayTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Wrap(
                  spacing: 25,
                  runSpacing: 10,
                  children: state.users.map((user) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedUser = user;
                        });
                      },
                      child: TransferResaultUserItem(
                        user: user,
                        isSelected: user.id == selectedUser?.id,
                      ),
                    );
                  }).toList(),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
