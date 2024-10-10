//
//  DataDetailInteractor.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
////logika dalam coding dan berkaitan sdekternal

import Foundation
import UIKit
import CoreData

class DataDetailInteractor: PTIDataDetailProtocol{
    var presenter: ITPDataDetailProtocol?
    
    var data = DataDetailModel()
  // Mendapatkan referensi ke AppDelegate dan managedObjectContext
    func readData(nav: UINavigationController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
      // Membuat fetch request untuk mengambil data dari Core Data
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<KPUmemory> = KPUmemory.fetchRequest()
        do {
            let fetchedData = try managedObjectContext.fetch(fetchRequest)
            for object in fetchedData {
                data.nik = object.nik
                data.name = object.name
                data.address = object.address
                data.gender = object.gender
                data.phoneNumb = object.phoneNumber
                data.date = object.date
                data.image = object.image
                data.inputted = object.inputted
                
                presenter?.onSuccessRead(data: data)
            }
        } catch {
            presenter?.onFailed(message: "Error Read Data")
            
            
        }
    }
    
    func deleteData(nav: UINavigationController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<KPUmemory> = KPUmemory.fetchRequest()
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
            // Delete the fetched objects
            for object in fetchedResults {
                managedObjectContext.delete(object)
            }
            
            // Save the changes
            try managedObjectContext.save()
            presenter?.onSuccessDelete(message: "Berhasil Hapus Data")
        } catch {
            presenter?.onFailed(message: "Gagal Hapus Data")
        }
    }
    
    
}
