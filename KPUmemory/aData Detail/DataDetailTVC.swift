//
//  DataDetailTVC.swift
//  KPUmemory
//
//  Created by Ferry jati on 08/10/24.
//

import UIKit

class DataDetailTVC: UITableViewCell {
  
  
  @IBOutlet weak var vwNIK: UILabel!
  
  @IBOutlet weak var vwName: UILabel!
  
  @IBOutlet weak var vwPhoneNumb: UILabel!
  
  @IBOutlet weak var vwGender: UILabel!
  
  @IBOutlet weak var vwDate: UILabel!
  
  @IBOutlet weak var vwAddress: UILabel!
  
  @IBOutlet weak var vwImage: UILabel!
  

  
  @IBOutlet weak var imgData: UIImageView!
  
  static let identifier = "DataDetailTVC"
  static func nib() -> UINib {
    return UINib(nibName: identifier, bundle: nil)
  }
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    vwNIK.text = ""
    vwName.text = ""
    vwPhoneNumb.text = ""
    vwGender.text = ""
    vwDate.text = ""
    vwAddress.text = ""
    vwImage.text = ""
  }
}
extension DataDetailVC: PTVDataDetailProtocol, NavigationBarDelegate{
  func successRead(data: DataDetailModel) {
    nik = data.nik
    name = data.name
    phoneNumb = data.phoneNumb
    date = data.date
    address = data.address
    gender = data.gender
    imageData = data.image
    isInputted = data.inputted ?? true
    
    vwNIK.setDetail("NIK", nik ?? "330905200000000")
    vwName.setDetail("Nama", name ?? "Ferry")
    vwPhoneNumb.setDetail("No Telp", phoneNumb ?? "0878787")
    vwGender.setDetail("Jenis Kelamin", gender ?? "Laki-Laki")
    vwDate.setDetail("Tempat Tanggal Lahir", date ?? "Solo 12 Mei 2000")
    vwAddress.setDetail("Alamat", address ?? "Rumah")
    if let decodedImage = stringToImage(imageData ?? "") {
      imgData.image = decodedImage
    }
  }
  
  func successDelete(message: String) {
    Alert.showGeneralAlert(title: "Berhasil Di Hapus", message: message, viewController: self)
    if let navigation = navigationController{
      presenter?.goToHome(nav: navigation)
    }
    
    
  }
  
  func failed(message: String) {
    Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
  }
  
  func pressBack() {
    print("back button pressed")
    self.navigationController?.popViewController(animated: true)
    
  }
  struct DataDetail{
    var nik: String?
    var name: String?
    var phoneNumb: String?
    var date: String?
    var address: String?
    var gender: String?
    var imageData: String?
    var isInputted: Bool?
  }
}
