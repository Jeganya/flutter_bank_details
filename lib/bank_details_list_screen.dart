import 'package:flutter/material.dart';

import 'bank_details_form_screen.dart';
import 'bank_details_model.dart';
import 'database_helper.dart';
import 'edit_bank_details_form_screen.dart';
import 'main.dart';

class BankDetailsListScreen extends StatefulWidget {
  const BankDetailsListScreen({super.key});

  @override
  State<BankDetailsListScreen> createState() => _BankDetailsListScreenState();
}

class _BankDetailsListScreenState extends State<BankDetailsListScreen> {
  late List<BankDetailsModel> _bankDetailsList;

  @override
  void initState() {
    super.initState();
    getAllBankDetails();
  }

  getAllBankDetails() async {
    _bankDetailsList = <BankDetailsModel>[];

    var bankDetailRecords =
        await dbHelper.queryAllRows(DatabaseHelper.bankDetailsTable);

    bankDetailRecords.forEach((bankDetail) {
      setState(() {
        print(bankDetail['_id']);
        print(bankDetail['_bankName']);
        print(bankDetail['_branchName']);
        print(bankDetail['_accountType']);
        print(bankDetail['_accountNo']);
        print(bankDetail['_IFSCCode']);

        var bankDetailsModel = BankDetailsModel(
          bankDetail['_id'],
          bankDetail['_bankName'],
          bankDetail['_branchName'],
          bankDetail['_accountType'],
          bankDetail['_accountNo'],
          bankDetail['_IFSCCode'],
        );

        _bankDetailsList.add(bankDetailsModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bank Details',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              new Expanded(
                child: new ListView.builder(
                  itemCount: _bankDetailsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new InkWell(
                      onTap: () {
                        print('---------->Edit or Delete invoked: Send Data');

                        print(_bankDetailsList[index].id);
                        print(_bankDetailsList[index].bankName);
                        print(_bankDetailsList[index].branchName);
                        print(_bankDetailsList[index].accountType);
                        print(_bankDetailsList[index].accountNo);
                        print(_bankDetailsList[index].IFSCcode);

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditBankDetailsFormScreen(),
                          settings: RouteSettings(
                            arguments: _bankDetailsList[index],
                          ),
                        ));
                      },
                      child: ListTile(
                        title: Text(_bankDetailsList[index].bankName +
                            '\n' +
                            _bankDetailsList[index].branchName +
                            '\n' +
                            _bankDetailsList[index].accountType +
                            '\n' +
                            _bankDetailsList[index].accountNo +
                            '\n' +
                            _bankDetailsList[index].IFSCcode),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('--------> Launch Bank Details Form Screen');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BankDetailsFormScreen()));
          },
          child: Icon(Icons.add),
        ));
  }
}
