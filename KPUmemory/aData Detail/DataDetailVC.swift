//
//  DataDetailVC.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//interaksi dan tampilan pengguna

import UIKit

class DataDetailVC: UIViewController {
  
  @IBOutlet weak var navigation: NavigationBar!
  
  @IBOutlet weak var tableDetail: UITableView!
  @IBOutlet weak var btnDelete: UIButton!
  
  @IBOutlet weak var btnUpdate: UIButton!
    
    var presenter: VTPDataDetailProtocol?
    
    var nik: String?
    var name: String?
    var phoneNumb: String?
    var date: String?
    var address: String?
    var gender: String?
    var imageData: String?
    var isInputted: Bool?
  var rowCount: Int? = 0
  var dataArray: [DataDetailModel] = []
  let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpAction()
    }
  // Mengatur tampilan elemen-elemen antarmuka pengguna
  func setUpView(){
    if let navigation = navigationController{
      presenter?.startReadData(nav: navigation)
    }
    self.navigationController?.isNavigationBarHidden = true
    navigation.setTitle("Data")
    navigation.delegate = self
    btnUpdate.setTitle("Perbarui Data", for: .normal)
    btnDelete.setTitle("Hapus Data", for: .normal)
    
    btnUpdate.tintColor = .white
    btnDelete.tintColor = .white
    btnUpdate.backgroundColor = .systemOrange
    btnDelete.backgroundColor = .systemOrange
    
    btnUpdate.layer.cornerRadius = 20
    btnDelete.layer.cornerRadius = 20
    
    tableDetail.delegate = self
    tableDetail.dataSource = self
    tableDetail.allowsSelection = true
    tableDetail.isScrollEnabled = true
    tableDetail.register(DataDetailTVC.nib(), forCellReuseIdentifier: DataDetailTVC.identifier)
    tableDetail.rowHeight = UITableView.automaticDimension
    
  }
    
    func setUpAction(){
        btnUpdate.addTarget(self, action: #selector(updateData), for: .touchUpInside)
        btnDelete.addTarget(self, action: #selector(deleteData), for: .touchUpInside)
    }
    
  @objc func updateData(){
    if let navigation = navigationController{
      presenter?.navToFillData(nav: navigation)
    }
  }
    @objc func deleteData(){
        if let navigation = navigationController{
            presenter?.startDeleteData(nav: navigation)
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
    
    
  // Implementasi protokol PTVDataDetailProtocol dan NavigationBarDelegat
}
extension DataDetailVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
      let cell = tableView.dequeueReusableCell(withIdentifier: DataDetailTVC.identifier, for: indexPath) as! DataDetailTVC
      let dataDetail = dataArray[indexPath.row]
      cell.data = dataDetail
      cell.parentViewController = self
        
        if rowCount == 0 {
      print("OK")
  }else {
    let dataDetail = dataArray[indexPath.row]
      print(dataDetail.title)
      let dataCell = TVCModel(
          title: dataDetail.title,
          author: dataDetail.author ?? "",
          date: dataDetail.publishedAt,
          image: dataDetail.urlToImage ?? "",
          url: dataDetail.url
      )
      cell.setUpData(dataCell: dataCell, index: indexPath.row)
  }
  return cell
}

}

