//
//  DataDetailProtocol.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//memberikan tanggung jawab pada masing-masing komponen

import Foundation
import UIKit
// pesan
protocol PTVDataDetailProtocol: AnyObject {
    func successRead(data: DataDetailModel)
    func successDelete(message: String)
    func failed(message: String)
}
// mengambil data dan navigasi
protocol VTPDataDetailProtocol: AnyObject {
    var view: PTVDataDetailProtocol? {get set}
    var interactor: PTIDataDetailProtocol? {get set}
    var router: PTRDataDetailProtocol? {get set}
    func addDaata(nav: UINavigationController)
  func startReadData(nav: UINavigationController)
    func startDeleteData(nav: UINavigationController)
    func goToHome(nav: UINavigationController)
  func navToFillData(nav: UINavigationController)
    
    
}
// menuju
protocol PTRDataDetailProtocol: AnyObject {
    static func createDataDetailModule() -> DataDetailVC
    func goToHome(nav: UINavigationController)
  func goToFillData(nav: UINavigationController)
    
    
    
}
// data dan pesan
protocol PTIDataDetailProtocol: AnyObject {
    var presenter: ITPDataDetailProtocol? {get set}
    func readData(nav: UINavigationController)
    func deleteData(nav: UINavigationController)
}

protocol ITPDataDetailProtocol: AnyObject {
    func onSuccessRead(data: DataDetailModel)
    func onSuccessDelete(message: String)
    func onFailed(message: String)
}
