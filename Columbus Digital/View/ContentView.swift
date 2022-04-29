//
//  ContentView.swift
//  Columbus Digital
//
//  Created by carlos on 28/04/22.
//

import SwiftUI

struct ContentView: View {
        @State var isActive:Bool = false
        
        var body: some View {
            VStack {
                if self.isActive {
                    MainView()
                } else {
                   SplashView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
