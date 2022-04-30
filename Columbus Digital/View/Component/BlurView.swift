//
//  BlurView.swift
//  Columbus Digital
//
//  Created by Carlos A Pelcastre Carmona on 29/04/22.
//

import SwiftUI

import SwiftUI

//Efecto Blur
struct BlurView : UIViewRepresentable{
    var style : UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
