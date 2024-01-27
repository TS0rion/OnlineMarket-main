class Shipper {
  constructor(ShipperId, Name, Phone, Email, Gender, Status, Image, AreaId) {
    this.ShipperId = ShipperId;
    this.Name = Name;
    this.Phone = Phone;
    this.Email = Email;
    this.Gender = Gender;
    this.Status = Status;
    this.Image = Image;
    this.AreaId = AreaId;
  }
}
// export default Shipper;
module.exports = Shipper;
