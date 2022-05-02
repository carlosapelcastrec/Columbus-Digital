//
//  ContactInformationView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct ContactInformationView: View {
    @Environment(\.presentationMode) var presentationMode
    var contact : ContactModel
    
    var body: some View {
        ZStack{
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.left.circle")
                                .foregroundColor(Color("Text"))
                                .font(.custom("KGPrimaryItalics", size: 30))
                        }
                    }
                    Spacer()
                    NavigationLink(destination: AddContactView(contact: contact, isAddContact : false)){
                        Text("Editar")
                            .foregroundColor(Color("Text"))
                            .font(.custom("KGPrimaryItalics", size: 20))
                    }
                }
                .padding()
                Spacer()
                
                VStack{
                    Image(systemName: "person.circle")
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size:50))
                        .padding()
                    Text(contact.name)
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size:20))
                        .padding()
                    Text(contact.phoneNumber)
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size:20))
                        .padding()
                    Text(contact.email)
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size:20))
                        .padding()
                    Text(contact.address)
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size:20))
                        .padding()
                    Text(contact.notes)
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size:20))
                        .padding()
                }
                .frame(width: UIScreen.main.bounds.width/1.2)
                .background(BlurView(style: .regular))
                .cornerRadius(15)
                Spacer()
            }
           
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContactInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ContactInformationView(contact: ContactModel(name: "Carlos", phoneNumber: "552445907", email: "carlosapelcastrec@gmail.com", address: "Hidalgo 205", notes: ""))
    }
}
