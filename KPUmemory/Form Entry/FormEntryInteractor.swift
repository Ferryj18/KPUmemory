//
//  FormEntryInteractor.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
////logika dalam coding dan berkaitan sdekternal

import Foundation
import UIKit
import CoreData

class FormEntryInteractor: PTIFormEntryProtocol{
    var presenter: ITPFormEntryProtocol?
    
    var data = formEntryModel()
    var isInputted: Bool?
    
    
    func fetchData(data: formEntryModel, nav: UINavigationController) {
      // Mendapatkan data dari parameter
      var nik = data.nik
        var name = data.name
        var phoneNumb = data.phoneNumb
        var address = data.address
        var date = data.date
        var image = data.image
        var gender = data.gender
      // Mendapatkan managedObjectContext dari AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if let entityDescription = NSEntityDescription.entity(forEntityName: "KPUmemory", in: context) {
            let item = KPUmemory(entity: entityDescription, insertInto: context)
            item.nik = nik
            item.name = name
            item.phoneNumber = phoneNumb
            item.gender = gender
            item.address = address
            item.date = date
            item.image = image
          // Menyimpan data ke Core Data
            do {
                try context.save()
                presenter?.onSuccess(message: "Berhasil Simpan Data")
            } catch {
                presenter?.onFailed(message: "Gagal Simpan Data")
            }
        }
    }
  // Mendapatkan referensi ke AppDelegate dan managedObjectContext
    func readData(nav: UINavigationController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
      // Membuat fetch request untuk mengambil data yang akan diperbarui
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<KPUmemory> = KPUmemory.fetchRequest()
        do {
          // Melakukan pengambilan data dari Core Data Jika ada data yang diambil, maka update data pertama yang ditemuka
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
                
                presenter?.onAlreadyInput(data: data)
            }
        } catch {
            presenter?.onNotInput()
            
            
        }
    }
    
    
    
    func updateData(data: formEntryModel, nav: UINavigationController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext

        // Fetch the data to update
        let fetchRequest: NSFetchRequest<KPUmemory> = KPUmemory.fetchRequest()
               
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
                if let objectToUpdate = fetchedResults.first {
                    // Update attributes of the object
                    objectToUpdate.nik = data.nik
                    objectToUpdate.name = data.name
                    objectToUpdate.address = data.address
                    objectToUpdate.gender = data.gender
                    objectToUpdate.phoneNumber = data.phoneNumb
                    objectToUpdate.date = data.date
                    objectToUpdate.image = data.image
                    objectToUpdate.inputted = data.inputted ?? true
                    
                    // Save the changes
                    try managedObjectContext.save()
                    presenter?.onSuccess(message: "Berhasil Simpan Data")
                }
            
        } catch {
            presenter?.onFailed(message: "Gagal Simpan Data")
            
        }
        
    }
    
}
