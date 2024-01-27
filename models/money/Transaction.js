class Transaction{
    constructor(Id,OrderId,Description,Amount,Status,Date,WalletId,CustomerId,ShipperId){
        this.Id = Id;
        this.OrderId = OrderId;
        this.Description = Description;
        this.Amount = Amount;       
        this.Status = Status;
        this.Date = Date;
        this.WalletId = WalletId;
        this.CustomerId = CustomerId;
        this.ShipperId = ShipperId;
    }
}
export default Transaction;