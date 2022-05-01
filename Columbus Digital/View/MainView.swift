//
//  MainView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Agenda de Contactos")
                        .font(.custom("The-Californication", size: 40))
                        .foregroundColor(Color("Text"))
                        .padding()
                    NavigationLink(destination: AddContactView(contact: ContactModel(name: "", phoneNumber: "", email: "", address: "", notes: ""))){
                        Text("Agregar Contacto")
                            .font(.custom("KGPrimaryItalics", size: 25))
                            .foregroundColor(Color("Text"))
                            .padding()
                            .frame(width:UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/6)
                            .background(BlurView(style: .regular))
                            .cornerRadius(15)
                            
                    }
                    .padding()
                    
                    NavigationLink(destination: ContactListView()){
                        Text("Lista de Contactos")
                            .font(.custom("KGPrimaryItalics", size: 25))
                            .foregroundColor(Color("Text"))
                            .padding()
                            .frame(width:UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/6)
                            .background(BlurView(style: .regular))
                            .cornerRadius(15)
                    }
                    .padding()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
