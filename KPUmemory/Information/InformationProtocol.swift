//
//  InformationProtocol.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//memberikan tanggung jawab pada masing-masing komponen

import Foundation
import UIKit
// Protokol yang mendefinisikan kontrak untuk tampilan (View) dalam modul Informasi
protocol PTVInformationProtocol: AnyObject {}
// Protokol yang mendefinisikan untuk presenter dalam modul Informasi
protocol VTPInformationProtocol: AnyObject {
    var view: PTVInformationProtocol? {get set}
    var interactor: PTIInformationProtocol? {get set}
    var router: PTRInformationProtocol? {get set}
    
    
}

protocol PTRInformationProtocol: AnyObject {
    static func createInformationModule() -> InformationVC
    
    
    
    
}

protocol PTIInformationProtocol: AnyObject {
    var presenter: ITPInformationProtocol? {get set}
}

protocol ITPInformationProtocol: AnyObject {}
