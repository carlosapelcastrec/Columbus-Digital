//
//  ContactViewModel.swift
//  Columbus Digital
//
//  Created by carlos on 01/05/22.
//

import Foundation
import CoreData
import SwiftUI

class ContactViewModel : ObservableObject{
    @Published var showAlert : Bool = false
    var alert =  Alert(title: "", description: "", type: .failed)
    
    func addContact(viewContext: NSManagedObjectContext, contact : ContactModel) {
        let newContact = Contact(context: viewContext)
        newContact.name = contact.name
        newContact.phoneNumber = contact.phoneNumber
        newContact.email = contact.email
        newContact.address = contact.address
        newContact.notes = contact.notes
        
        do {
            try viewContext.save()
            alert = Alert(title: "Guardado Exitosamente", description: "Se guardo el contacto exitosamente", type: .success)
            showAlert = true
        } catch {
            let nsError = error as NSError
            alert = Alert(title: "Ocurrio un error", description: " \(nsError.userInfo)", type: .failed)
            showAlert = true
        }
    }
    
    func updateContact(viewContext: NSManagedObjectContext, contact : ContactModel){
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: viewContext)
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = entity
        let predicate = NSPredicate(format: "(name = %@)", contact.name)
        request.predicate = predicate
        do {
            let results =
            try viewContext.fetch(request)
            let objectUpdate = results[0] as! NSManagedObject
            objectUpdate.setValue(contact.name, forKey: "name")
            objectUpdate.setValue(contact.phoneNumber, forKey: "phoneNumber")
            objectUpdate.setValue(contact.email, forKey: "email")
            objectUpdate.setValue(contact.address, forKey: "address")
            objectUpdate.setValue(contact.notes, forKey: "notes")
            do {
                try viewContext.save()
                alert = Alert(title: "Actualización Exitosa", description: "Se actualizo el contacto exitosamente", type: .success)
                self.showAlert = true
            }catch let error as NSError {
                alert = Alert(title: "Ocurrio un error", description: " \(error.localizedFailureReason)", type: .failed)
                self.showAlert = true
            }
        }
        catch let error as NSError {
            alert = Alert(title: "Ocurrio un error", description: " \(error.localizedFailureReason)", type: .failed)
            self.showAlert = true
            
        }
    }
    
    func deleteItems(offsets: IndexSet, viewContext: NSManagedObjectContext, contacts : FetchedResults<Contact>) {
        
        offsets.map { contacts[$0] }.forEach(viewContext.delete)
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
}
