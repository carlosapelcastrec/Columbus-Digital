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
    
    var body: some View {
        Text("Agregar Contacto")
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
