//
//  View+Extensions.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 2/08/23.
//

import SwiftUI

public extension View {
    
    
    func onFistAppear(action: @escaping() async -> Void) -> some View {
        return modifier(FirstAppearModifier(action: action))
    }
    
}
