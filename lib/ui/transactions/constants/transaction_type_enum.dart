enum TransactionTypeEnum {
  send('Send'),
  recieve('Recieve'),
  all('All');

  const TransactionTypeEnum(this.label);
  final String label;
}
