//
//  AppTextFieldModifier.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import SwiftUI

struct AppTextFieldModifier: ViewModifier {
    
    var leftIconName: String? = nil
    
    func body(content: Content) -> some View {
        
        HStack {
            
            if let leftIconName = leftIconName {
                Image(systemName: leftIconName)
                    .foregroundColor(Color.brandBorder)
                    .padding(.leading,5)
            }
            
            content
            
        }.cornerRadius(10)
            .frame(height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.brandBorder, lineWidth: 1)
            )
            
    }
}

struct AppTextFieldModifier_Previews: PreviewProvider {
    
    static var previews: some View {

        TextField("Test Title", text: .constant("Test Value"))
            .modifier(AppTextFieldModifier(leftIconName: "mail"))
            .padding(.horizontal, 10)
    }
}
