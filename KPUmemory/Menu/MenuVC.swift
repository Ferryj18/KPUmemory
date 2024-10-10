//
//  MenuVC.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//interaksi dan tampilan pengguna

import UIKit

class MenuVC: UIViewController {
  
  
  // Deklarasi outlet tombol-tombol di antarmuka pengguna
  @IBOutlet weak var btnInformation: UIButton!
  @IBOutlet weak var btnFormEntry: UIButton!
  @IBOutlet weak var btnListData: UIButton!
  @IBOutlet weak var btnExit: UIButton!
  // Properti presenter yang terkait dengan protokol VTPMenuProtocol
    var presenter: VTPMenuProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
        
    }
  // Mengatur tampilan elemen-elemen antarmuka pengguna
    func setUpView(){
        self.navigationController?.isNavigationBarHidden = true
        btnInformation.setTitle("Informasi", for: .normal)
        btnFormEntry.setTitle("Formulir", for: .normal)
        btnListData.setTitle("Lihat Data", for: .normal)
        btnExit.setTitle("Keluar", for: .normal)
        
      btnInformation.backgroundColor = UIColor.systemOrange
        btnFormEntry.backgroundColor = UIColor.systemOrange
        btnListData.backgroundColor = UIColor.systemOrange
        btnExit.backgroundColor = UIColor.systemOrange
        
        btnInformation.layer.cornerRadius = 20
        btnFormEntry.layer.cornerRadius = 20
        btnListData.layer.cornerRadius = 20
        btnExit.layer.cornerRadius = 20
        
        
        btnInformation.tintColor = UIColor.white
        btnFormEntry.tintColor = UIColor.white
        btnListData.tintColor = UIColor.white
        btnExit.tintColor = UIColor.white
        
        
    }
  // Metode penanganan saat tombol ditekan
    func setUpAction(){
        btnInformation.addTarget(self, action: #selector(infoPress), for: .touchUpInside)
        btnFormEntry.addTarget(self, action: #selector(formEntryPress), for: .touchUpInside)
        btnListData.addTarget(self, action: #selector(listDataPress), for: .touchUpInside)
        btnExit.addTarget(self, action: #selector(exitPress), for: .touchUpInside)
        
    }
    
    @objc func infoPress(){
        if let navigation = navigationController{
            presenter?.navToInformation(nav: navigation)
        }
    }
    
    @objc func formEntryPress(){
        if let navigation = navigationController{
            presenter?.navToFillData(nav: navigation)
        }
    }
    
    @objc func listDataPress(){
        if let navigation = navigationController{
            presenter?.navToShowData(nav: navigation)
        }
    }
    
    @objc func exitPress(){
        let exitConfirmation = UIAlertController(title: "Exit", message: "Ingin Keluar", preferredStyle: .alert)
                
            let confirmAction = UIAlertAction(title: "iya", style: .default) { _ in
            // Perform any cleanup or tasks if needed
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            // This will suspend the app, which is similar to putting it in the background
            }
                
            let cancelAction = UIAlertAction(title: "Tidak", style: .cancel, handler: nil)
                
            exitConfirmation.addAction(confirmAction)
            exitConfirmation.addAction(cancelAction)
                
            present(exitConfirmation, animated: true, completion: nil)
    }
    
    

}

extension MenuVC: PTVMenuProtocol{
    
}
