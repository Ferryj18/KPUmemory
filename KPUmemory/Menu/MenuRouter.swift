//
//  MenuRouter.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//menghubungkan komponen dan navigasi antar modul

import Foundation
import UIKit

class MenuRouter: PTRMenuProtocol{
    static func createMainMenuModule() -> MenuVC {
        
        let view = MenuVC()
        let presenter = MenuPresenter()
        let interactor: PTIMenuProtocol = MenuInteractor()
        let router : PTRMenuProtocol = MenuRouter()
                //menghubungkan presenter ke
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        interactor.presenter = presenter
        view.presenter = presenter
                
        return view
    }
    // memanggil modul untuk menmpilkan informasi dan data
    func goToInformation(nav: UINavigationController) {
//        let view = DataDetailRouter.createDataDetailModule()
        let view = InformationRouter.createInformationModule()
        nav.pushViewController(view, animated: true)
    }
    
    func goToFillData(nav: UINavigationController) {
        let view = FormEntryRouter.createFormEntryModule()
        nav.pushViewController(view, animated: true)
    }
    
    func goToShowData(nav: UINavigationController) {
        let view = DataDetailRouter.createDataDetailModule()
        nav.pushViewController(view, animated: true)
    }
    
    
}
