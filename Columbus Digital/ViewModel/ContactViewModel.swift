//
//  ContactViewModel.swift
//  Columbus Digital
//
//  Created by carlos on 01/05/22.
//

import Foundation
import CoreData
import SwiftUI

class ContactViewModel{
    
    func addContact(viewContext: NSManagedObjectContext, contact : ContactModel) {
        let newContact = Contact(context: viewContext)
        newContact.name = contact.name
        newContact.phoneNumber = contact.phoneNumber
        newContact.email = contact.email
        newContact.address = contact.address
        newContact.notes = contact.notes
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteItems(offsets: IndexSet, viewContext: NSManagedObjectContext, contacts : FetchedResults<Contact>) {
        
        offsets.map { contacts[$0] }.forEach(viewContext.delete)
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
}
