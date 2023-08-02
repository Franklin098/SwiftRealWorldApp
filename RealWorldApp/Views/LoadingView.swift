//
//  LoadingView.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 2/08/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
