//
//  DataDetailPresenter.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//// jembatani tampilan view dengan interaksi pengguna
import Foundation
import UIKit

class DataDetailPresenter: VTPDataDetailProtocol{
  
  // Referensi ke tampilan (View) yang akan diinteraksikan dengan presenter
  var view: PTVDataDetailProtocol?
  var interactor: PTIDataDetailProtocol?// Referensi ke interaktor (Interactor) yang mengurus logika bisnis
  var router: PTRDataDetailProtocol?// Referensi ke router (Router) yang menangani navigasi antar layar
  //meminta interaktor untuk membaca mengisi dan delete data
  func startReadData(nav: UINavigationController) {
    interactor?.readData(nav: nav)// Meminta interaktor untuk membaca data dan memulai operasi read data
  }
  func navToFillData(nav: UINavigationController) {
    router?.goToFillData(nav: nav)// Menggunakan router untuk navigasi ke layar pengisian data
  }
  func navToAddDatapresenter(nav: UINavigationController) {
    router?.goToAddData(nav: nav)
  }
  
    
    func startDeleteData(nav: UINavigationController) {
        interactor?.deleteData(nav: nav)// Meminta interaktor untuk menghapus data dan memulai operasi delete data
    }
    
    func goToHome(nav: UINavigationController) {
        router?.goToHome(nav: nav) // Menggunakan router untuk navigasi kembali ke layar utama
    }
    
    
    
    
}
// menampilkan pesan ke presenter
extension DataDetailPresenter: ITPDataDetailProtocol{
    func onSuccessRead(data: DataDetailModel) {
        view?.successRead(data: data)
    }
    
    func onSuccessDelete(message: String) {
        view?.successDelete(message: message)
    }
    
    func onFailed(message: String) {
        view?.failed(message: message)
    }
    
    
}
