//
//  DataDetailRouter.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
// //menghubungkan komponen dan navigasi antar modul

import Foundation
import UIKit

class DataDetailRouter: PTRDataDetailProtocol{
    static func createDataDetailModule() -> DataDetailVC {
        let view = DataDetailVC()
        let presenter = DataDetailPresenter()
        let interactor: PTIDataDetailProtocol = DataDetailInteractor()
        let router : PTRDataDetailProtocol = DataDetailRouter()
        //menghubungkan komponen
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        interactor.presenter = presenter
        view.presenter = presenter
                
        return view
    }
    // memanggil router dari modul untuk menampilkan tampilan
    func goToHome(nav: UINavigationController) {
        let view = MenuRouter.createMainMenuModule()
        nav.pushViewController(view, animated: true)
    }
  func goToFillData(nav: UINavigationController) {
    let view = FormEntryRouter.createFormEntryModule()
    nav.pushViewController(view, animated: true)
  }
    
    
    
    
}
