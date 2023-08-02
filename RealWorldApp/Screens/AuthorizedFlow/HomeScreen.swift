//
//  HomeScreen.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 2/08/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var articlesVM = ArticlesViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                if articlesVM.isLoading {
                    LoadingView()
                } else {
                    
                    List(self.articlesVM.articlesList) { article in
                        Text(article.title)
                    }
                    
                }
            }.navigationTitle("Articles")
                
        }.onFistAppear {
            articlesVM.callGetArticlesService()
        }
        .refreshable {
            articlesVM.callGetArticlesService()
        }
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
