class Voucher {
    constructor(Id, Discount, Description, Expired, CampainVoucherId) {
        this.Id = Id;
        this.Discount = Discount;
        this.Description = Description;
        this.Expired = Expired;
        this.CampainVoucherId = CampainVoucherId;
    }
}
export default Voucher;