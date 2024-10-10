//
//  MenuProtocol.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//memberikan tanggung jawab pada masing-masing komponen

import Foundation
import UIKit

protocol PTVMenuProtocol: AnyObject {}
// menuju
protocol VTPMenuProtocol: AnyObject {
    var view: PTVMenuProtocol? {get set}
    var interactor: PTIMenuProtocol? {get set}
    var router: PTRMenuProtocol? {get set}
    
    func navToInformation(nav: UINavigationController)
    func navToFillData(nav: UINavigationController)
    func navToShowData(nav: UINavigationController)
    
    
}
//menuju
protocol PTRMenuProtocol: AnyObject {
    static func createMainMenuModule() -> MenuVC
    func goToInformation(nav: UINavigationController)
    func goToFillData(nav: UINavigationController)
    func goToShowData(nav: UINavigationController)
    
    
    
}

protocol PTIMenuProtocol: AnyObject {
    var presenter: ITPMenuProtocol? {get set}
}

protocol ITPMenuProtocol: AnyObject {}
