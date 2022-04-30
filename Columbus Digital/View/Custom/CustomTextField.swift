//
//  CustomTextField.swift
//  Columbus Digital
//
//  Created by carlos on 29/04/22.
//

import SwiftUI

struct CustomTextField: View {
    var image: String
    var title: String
    var color : String
    @Binding var value: String
    
    var animation: Namespace.ID
    
    var body: some View{
        VStack(spacing: 6){
            HStack(alignment: .bottom){
                Image(systemName: image)
                    .font(.custom("Roboto-Regular", size: 15))
                    .foregroundColor(Color(color))
                VStack(alignment: .leading, spacing: 6){
                    if value != ""{
                        Text(title)
                            .font(.custom("Roboto-Regular", size: 15))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(color))
                            .matchedGeometryEffect(id: title, in: animation)
                    }
                    ZStack(alignment: Alignment(horizontal: . leading, vertical: . center)){
                        if value == ""{
                            Text(title)
                                .font(.custom("Roboto-Regular", size: 15))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(color))
                                .matchedGeometryEffect(id: title, in: animation)
                        }
                        TextField("", text: $value)
                    }
                }
            }
            if value == ""{
                Divider()
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color("theme_background").opacity(value != "" ? 1 : 0))
        .cornerRadius(8)
        .shadow(color: Color("White").opacity(0.1), radius: 5, x: 5, y: 5)
        .shadow(color: Color("White").opacity(0.05), radius: 5, x: -5, y: -5)
        .padding(.horizontal)
        .padding(.top)
        .animation(.linear)
    }
}

struct CustomFieldText_Previews: PreviewProvider {
    @Namespace static var animation
    @State var test = ""
    
    static var previews: some View {
        CustomTextField(image: "iphone", title: "Prueba", color: "Orange", value: .constant(""), securityTextField: .constant(false), animation: animation)
        CustomTextField(image: "iphone", title: "Prueba", color: "Orange", value: .constant(""), securityTextField: .constant(false), animation: animation)
            .preferredColorScheme(.dark)
    }
}

