class Wallet {
  int? id;
  double balance;
  double invoice;
  bool active;

  Wallet({
    this.id,
    this.invoice = 0,
    this.balance = 0,
    this.active = true,
  });
}
