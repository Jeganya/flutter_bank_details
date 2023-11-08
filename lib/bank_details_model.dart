class BankDetailsModel {
  int? id;
  late String bankName;
  late String branchName;
  late String accountType;
  late String accountNo;
  late String IFSCcode;

  BankDetailsModel(this.id, this.bankName, this.branchName, this.accountType,
      this.accountNo, this.IFSCcode);
}
