//
//  AddContactView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct AddContactView: View {
    @ObservedObject var ContactVM = ContactViewModel()
    @State var contact : ContactModel
    var isAddContact = true
    
    @Namespace var animation
    @Environment(\.presentationMode) var presentationMode
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
                
                Text(isAddContact ? "Agregar Contacto" : "Actualizar Contacto")
                    .foregroundColor(Color("Text"))
                    .font(.custom("KGPrimaryItalics", size: 30))
                
                Spacer()
                
                CustomTextField(image: "person.circle", title: "Name", value: $contact.name, animation: animation)
                
                CustomTextField(image: "phone.circle", title: "Phone Number", value: $contact.phoneNumber, animation: animation)
                
                CustomTextField(image: "envelope.circle", title: "Email", value: $contact.email, animation: animation)
                
                CustomTextField(image: "mappin.circle", title: "Address", value: $contact.address, animation: animation)
                
                CustomTextField(image: "doc.circle", title: "Notes", value: $contact.notes, animation: animation)
                Spacer()
                
                Button(action: {
                    if isAddContact{
                        ContactVM.addContact(viewContext: viewContext, contact: ContactModel(name: contact.name, phoneNumber: contact.phoneNumber, email: contact.email, address: contact.address, notes: contact.notes))
                        contact = ContactModel(name: "", phoneNumber: "", email: "", address: "", notes: "")
                    }else{
                        ContactVM.updateContact(viewContext: viewContext, contact: ContactModel(name: contact.name, phoneNumber: contact.phoneNumber, email: contact.email, address: contact.address, notes: contact.notes))
                        
                    }
                }){
                    Text(isAddContact ? "Guardar Contacto" : "Actualizar Contacto")
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size: 20))
                        .padding()
                }
                .background(BlurView(style: .regular))
                .cornerRadius(15)
                .padding(.bottom,32)
                
            }
            let type = ContactVM.alert.type
            CustomAlert(show: $ContactVM.showAlert , titleText: ContactVM.alert.title, bodyText: ContactVM.alert.description, typeAlert: type, showAccept: type == .success ? true : false ,showClose: type == .failed ? true : false){
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct AddContactView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        AddContactView(contact: ContactModel(name: "", phoneNumber: "", email: "", address: "", notes: ""))
    }
}
