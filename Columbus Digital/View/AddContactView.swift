//
//  AddContactView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct AddContactView: View {
    @State var name : String = ""
    @State var phoneNumber : String = ""
    @State var email: String = ""
    @State var address : String = ""
    @State var notes : String = ""
    
    @Namespace var animation
    @Environment(\.presentationMode) var presentationMode
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
                
                Text("Agregar Contacto")
                    .foregroundColor(Color("Text"))
                    .font(.custom("KGPrimaryItalics", size: 30))
                
                Spacer()
                
                CustomTextField(image: "person.circle", title: "Name", value: $name, animation: animation)
                
                CustomTextField(image: "phone.circle", title: "Phone Number", value: $phoneNumber, animation: animation)
                
                CustomTextField(image: "envelope.circle", title: "Email", value: $email, animation: animation)
                
                CustomTextField(image: "mappin.circle", title: "Address", value: $address, animation: animation)
                
                CustomTextField(image: "doc.circle", title: "Notes", value: $notes, animation: animation)
                Spacer()
                
                Button(action: {
                    ContactVM.addContact(viewContext: viewContext, contact: ContactModel(name: name, phoneNumber: phoneNumber, email: email, address: address, notes: notes))
                }){
                    Text("Guardar Contacto")
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size: 20))
                        .padding()
                }
                .background(BlurView(style: .regular))
                .cornerRadius(15)
                .padding(.bottom,32)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct AddContactView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        AddContactView()
    }
}
