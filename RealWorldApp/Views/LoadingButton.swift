//
//  LoadingButton.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 30/07/23.
//

import SwiftUI

struct LoadingButton: View {
    
    var title: String
    var isLoading: Bool = false
    var disable: Bool = false
    var buttonColor: Color = Color.brandPrimary
    var onPress: (()-> Void)
    
    
    @State private var loadingIconAngle = 0.0

    
    var body: some View {
        
        Button {
            onPress()
        } label: {
            
            HStack {
                
                Text(title)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 10)
                
                if self.isLoading {
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(loadingIconAngle))
                        .onAppear{
                            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)){
                                self.loadingIconAngle = 360.0
                            }
                        }
                }
                
                
            }.frame(maxWidth: .infinity, minHeight: 45)
                .background(buttonColor)
                .opacity(isLoading || disable ? 0.7 : 1)
                .cornerRadius(10)
                
            
            
        }.disabled(isLoading || disable)

    }
}

struct LoadingButton_Previews: PreviewProvider {
    static var previews: some View {
        LoadingButton(title: "Press Me",isLoading: false) {
            print("Button Pressed")
        }
    }
}
