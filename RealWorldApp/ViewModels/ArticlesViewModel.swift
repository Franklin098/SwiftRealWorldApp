//
//  ArticlesViewModel.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 2/08/23.
//

import SwiftUI

class ArticlesViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var articlesList: [Article] = []
    
    
    func callGetArticlesService() {
        
        self.isError = false
        self.isLoading = true
        
        ConduitService.shared.getRequest(forResponseType: MultipleArticlesResponse.self,
                                         endpointUrl: ConduitService.articlesEndpoint)
        { result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result {
                case .success(let response):
                    self.isError = false
                    self.articlesList = response.articles
                case .failure(let error):
                    self.isError = true
                    print("Error fetching articles \(error)")
                }
            }
            

        }
    }
    
}

