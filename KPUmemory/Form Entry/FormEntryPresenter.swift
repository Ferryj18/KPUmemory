//
//  FormEntryPresenter.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//// jembatani tampilan view dengan interaksi pengguna

import Foundation
import UIKit
//Referensi ke tampilan View, interactor router yang akan diinteraksikan dengan presenter
class FormEntryPresenter: VTPFormEntryProtocol{
    var view: PTVFormEntryProtocol?
    var interactor: PTIFormEntryProtocol?
    var router: PTRFormEntryProtocol?
  // Meminta interaktor untuk membaca data
    func startFetchData(data: formEntryModel, nav: UINavigationController) {
        interactor?.fetchData(data: data, nav: nav)
    }
    
    func startReadData(nav: UINavigationController){
        interactor?.readData(nav: nav)
    }
    
    func startUpdateData(data: formEntryModel, nav: UINavigationController) {
        interactor?.updateData(data: data, nav: nav)
    }
    
    
    
    
}
//  // Memanggil metode  di tampilan dengan pesan sukses, gagal atapun failed
extension FormEntryPresenter: ITPFormEntryProtocol{
    func onSuccess(message: String) {
        view?.success(message: message)
    }
    
    func onFailed(message: String) {
        view?.failed(message: message)
        
    }
    
    func onAlreadyInput(data: formEntryModel) {
        view?.alreadyInput(data: data)
    }
  // Memanggil metode notInput di tampilan saat data belum ada
    func onNotInput() {
        view?.notInput()
    }
    
    
}
