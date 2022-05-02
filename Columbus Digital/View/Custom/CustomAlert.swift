//
//  CustomAlert.swift
//  Columbus Digital
//
//  Created by carlos on 02/05/22.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var show : Bool
    var image : String = ""
    var titleText : String
    var bodyText : String
    var typeAlert : TypeAlert
    var showAccept : Bool = false
    var showClose : Bool = false
    let actionAccept: () -> Void
    
    
    var body: some View {
        if show {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                VStack(spacing:25){
                    Image(systemName:  typeAlert == TypeAlert.success ? "checkmark.circle" : typeAlert == TypeAlert.failed ? "x.circle" : typeAlert == TypeAlert.warning ? "exclamationmark.circle"  : "info.circle")
                        .foregroundColor(typeAlert == TypeAlert.success ? Color("Success") : typeAlert == TypeAlert.failed ? Color("Failed") : typeAlert == TypeAlert.warning ? Color("Warning") : Color("Info"))
                        .font(.system(size: 40, weight: .regular))
                    Text(titleText)
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size: 25))
                    Text(bodyText)
                        .foregroundColor(Color("Text"))
                        .font(.custom("KGPrimaryItalics", size: 20))
                    if showClose{
                        Button(action:{
                            withAnimation(){
                                show.toggle()
                            }
                        }){
                            Text("Cerrar")
                                .foregroundColor(Color("Failed"))
                                .fontWeight(.bold)
                                .padding(.vertical,10)
                                .padding(.horizontal,25)
                                .clipShape(Capsule())
                        }       .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Faied"), lineWidth: 5)
                        )
                    }
                    
                    if showAccept{
                        Button(action:{
                            withAnimation(){
                               actionAccept()
                                show.toggle()
                            }
                        }){
                            Text("Aceptar")
                                .foregroundColor(Color("Success"))
                                .fontWeight(.bold)
                                .padding(.vertical,10)
                                .padding(.horizontal,25)
                                .clipShape(Capsule())
                        }       .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Success"), lineWidth: 5)
                        )
                    }

                }
                .padding(.vertical,25)
                .padding(.horizontal,30)
                .background(BlurView(style: .regular))
                .cornerRadius(25)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.35)
            )
        }
    }
}

