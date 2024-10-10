//
//  InformationPresenter.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//// jembatani tampilan view dengan interaksi pengguna

import Foundation
import UIKit
//Referensi ke tampilan (View) yang akan diinteraksika
class InformationPresenter: VTPInformationProtocol{
    var view: PTVInformationProtocol?
    var interactor: PTIInformationProtocol?
    var router: PTRInformationProtocol?
    
    
}

extension InformationPresenter: ITPInformationProtocol{
  // Implementasi metode-metode dari protokol ITPInformationProtocol
      // Anda dapat menambahkan implementasi metode di sini jika diperlukan
}
