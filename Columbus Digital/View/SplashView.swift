//
//  SplashView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Color("BlueDark")
                .edgesIgnoringSafeArea(.all)
            VStack{
                LottieView(name: "ContactsBook", loopMode: .loop)
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
