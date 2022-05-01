//
//  ContactListView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct ContactListView: View {
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Contact.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Contact>
    private var ContactVM = ContactViewModel()
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        ZStack{
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left.circle")
                            .foregroundColor(Color("Text"))
                            .font(.custom("KGPrimaryItalics", size: 30))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Lista de Contactos")
                    .foregroundColor(Color("Text"))
                    .font(.custom("KGPrimaryItalics", size: 30))
                List {
                    ForEach(items) { contact in
                        NavigationLink {
                            ContactInformationView(contact: ContactModel(name: contact.name ?? "", phoneNumber: contact.phoneNumber ?? "", email: contact.email ?? "", address: contact.address ?? "", notes: contact.notes ?? ""))
                        } label: {
                            VStack{
                                Text(contact.name ?? "")
                                    .foregroundColor(Color("Text"))
                                    .font(.custom("KGPrimaryItalics", size:20))
                                Text(contact.phoneNumber ?? "")
                                    .foregroundColor(Color("Text"))
                                    .font(.custom("KGPrimaryItalics", size: 20))
                                
                            }
                        }
                    }
                    .onDelete { indexSet in
                        ContactVM.deleteItems(offsets: indexSet, viewContext: viewContext, contacts: items)
                    }
                    .listRowBackground(BlurView(style: .regular))
                }
                .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor(named :"Background")
                    UITableViewCell.appearance().backgroundColor = UIColor(named: "Background")
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
