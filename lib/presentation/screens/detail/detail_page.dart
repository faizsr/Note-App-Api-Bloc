import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/presentation/screens/add_note/cubit/checkbox_cubit.dart';
import 'package:note_app/presentation/screens/add_note/widgets/add_date_status_widget.dart';
import 'package:note_app/presentation/screens/add_note/widgets/add_textfield.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool enableSaveBtn = false;
  @override
  Widget build(BuildContext context) {
    final checkboxCubit = BlocProvider.of<CheckBoxCubit>(context);

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 10, 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_back_ios, size: 20),
                      ),
                    ),
                    const Text(
                      'Your note',
                      style: TextStyle(fontSize: 17),
                    ),
                    const Spacer(),
                    PopupMenuButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: kBlue,
                      child: const Icon(
                        Icons.more_vert_sharp,
                        size: 22,
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          height: 25,
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: 0,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AddCustomTextField(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      hintText: 'Title',
                      onChanged: (value) {
                        setState(() {
                          enableSaveBtn = true;
                        });
                      },
                    ),
                    kHeight(20),
                    AddDateAndStatusWidget(checkboxCubit: checkboxCubit),
                    const Divider(),
                    const AddCustomTextField(
                      hintText: 'Write your notes here...',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton:
            enableSaveBtn ? _customSaveBtn(context) : const SizedBox(),
      ),
    );
  }

  Visibility _customSaveBtn(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        color: kBlue,
        onPressed: () {},
        child: const Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
