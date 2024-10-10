//
//  FormEntryProtocol.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//memberikan tanggung jawab pada masing-masing komponen

import Foundation
import UIKit
// tanggung jawab pesan
protocol PTVFormEntryProtocol: AnyObject {
    func success(message: String)
    func failed(message: String)
    func alreadyInput(data: formEntryModel)
    func notInput()
}
//mengambik data
protocol VTPFormEntryProtocol: AnyObject {
    var view: PTVFormEntryProtocol? {get set}
    var interactor: PTIFormEntryProtocol? {get set}
    var router: PTRFormEntryProtocol? {get set}
    
    func startFetchData(data: formEntryModel, nav: UINavigationController)
    func startReadData(nav: UINavigationController)
    func startUpdateData(data: formEntryModel, nav: UINavigationController)
    
    
}
  // kepada router terhdajab fungsi go to menu
protocol PTRFormEntryProtocol: AnyObject {
    static func createFormEntryModule() -> FormEntryVC
    func goToMenu(nav: UINavigationController)
    
    
    
    
}
// mengambi data dari dorm entry
protocol PTIFormEntryProtocol: AnyObject {
    var presenter: ITPFormEntryProtocol? {get set}
    
    func fetchData(data: formEntryModel, nav: UINavigationController)
    func readData(nav: UINavigationController)
    func updateData(data: formEntryModel, nav: UINavigationController)
    
}
//memberilan pesan
protocol ITPFormEntryProtocol: AnyObject {
    func onSuccess(message: String)
    func onFailed(message: String)
    func onAlreadyInput(data: formEntryModel)
    func onNotInput()
}

