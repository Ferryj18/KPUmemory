//
//  InformationVC.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//interaksi dan tampilan pengguna

import UIKit

class InformationVC: UIViewController {

  
  @IBOutlet weak var lblDetail: UILabel!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var navigation: NavigationBar!
  var presenter: VTPInformationProtocol?
  
  override func viewDidLoad() {
      super.viewDidLoad()
      setUpView()
  }
  // Mengatur tampilan elemen-elemen antarmuka pengguna
  func setUpView(){
      navigation.setTitle("Informasi")
      navigation.delegate = self
      
      lblTitle.text = "Komisi Pemilihan Umum"
      lblDetail.text = "Komisi Pemilihan Umum (KPU) adalah lembaga independen di Indonesia yang bertanggung jawab atas penyelenggaraan pemilihan umum. KPU memiliki peran penting dalam mengatur dan melaksanakan pemilihan umum untuk memilih presiden, anggota legislatif, dan kepala daerah. Tanggal pelaksanaan pemilu dapat bervariasi tergantung jenis pemilu dan regulasi yang berlaku. Di Indonesia, pemilihan umum dilakukan setiap lima tahun sekali, namun tanggal pasti pelaksanaannya dapat berbeda-beda untuk setiap siklus pemilu. Pemilu dilaksanakan 14 Februari 2024"
  }


}
// Implementasi protokol PTVInformationProtocol dan NavigationBarDelegate
extension InformationVC: PTVInformationProtocol, NavigationBarDelegate{
  func pressBack() {
      self.navigationController?.popViewController(animated: true)
  }
  
  
}

