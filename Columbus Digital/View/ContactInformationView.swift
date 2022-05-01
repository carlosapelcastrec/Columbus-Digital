//
//  ContactInformationView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct ContactInformationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
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
            }
        }
    }
}

struct ContactInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ContactInformationView()
    }
}
