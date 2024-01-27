class CustomerOrder{
    constructor(Id,OrderDate,Status,PayingStatus,ShippingPrice,VoucherId,OrderDetailId,Total,BuildingId,ShipperId){
        this.Id = Id;
        this.OrderDate = OrderDate;
        this.Status = Status;
        this.PayingStatus = PayingStatus;       
        this.ShippingPrice = ShippingPrice;       
        this.VoucherId = VoucherId;      
        this.OrderDetailId = OrderDetailId;      
        this.Total = Total;      
        this.BuildingId = BuildingId;      
        this.ShipperId = ShipperId;      
    }
}
export default CustomerOrder;