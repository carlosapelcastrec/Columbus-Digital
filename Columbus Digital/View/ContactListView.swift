//
//  ContactListView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct ContactListView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Contact.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Contact>
    private var ContactVM = ContactViewModel()
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        List {
            ForEach(items) { item in
                NavigationLink {
                    Text("Item at \(item.name!)")
                } label: {
                    Text(item.name!)
                }
            }
            .onDelete { indexSet in
                ContactVM.deleteItems(offsets: indexSet, viewContext: viewContext, contacts: items)
            }
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
