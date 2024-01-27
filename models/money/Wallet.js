class Wallet{
    constructor(Id,Balance,Type,Status,CustomerId,ShipperId){
        this.Id = Id;
        this.Balance = Balance;
        this.Type = Type;       
        this.Status = Status;
        this.CustomerId = CustomerId;
        this.ShipperId = ShipperId;
    }
}
export default Wallet;