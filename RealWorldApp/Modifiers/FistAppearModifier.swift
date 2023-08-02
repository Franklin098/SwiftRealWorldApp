//
//  FistAppearModifier.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 2/08/23.
//

import SwiftUI

public struct FirstAppearModifier: ViewModifier {
    
    private let action: () async -> Void
    @State private var hasAppeared = false
    
    init(action: @escaping () async -> Void){
        self.action = action
    }
    
    
    public func body(content: Content) -> some View {
        
        content.task {
            
            guard !hasAppeared else {
                return
            }
            
            self.hasAppeared = true
            
            await self.action()
        }
    }
    
}
