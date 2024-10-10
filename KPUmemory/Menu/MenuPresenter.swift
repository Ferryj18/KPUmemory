//
//  MenuPresenter.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
// jembatani tampilan view dengan interaksi pengguna

import Foundation
import UIKit
// meminta router untuk melaukan navigasi ke layar data dan informasi
class MenuPresenter: VTPMenuProtocol{
    var view: PTVMenuProtocol?
    var interactor: PTIMenuProtocol?
    var router: PTRMenuProtocol?
    
    func navToInformation(nav: UINavigationController) {
        router?.goToInformation(nav: nav)
    }
    
    func navToFillData(nav: UINavigationController) {
        router?.goToFillData(nav: nav)
    }
    
    func navToShowData(nav: UINavigationController) {
        router?.goToShowData(nav: nav)
    }
    
    
}

extension MenuPresenter: ITPMenuProtocol{
    
}
