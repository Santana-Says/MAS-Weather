//
//  SearchViewControllerRepresentable.swift
//  MAS-Weather
//
//  Created by Jeffrey Santana on 9/23/24.
//

import SwiftUI

struct SearchViewControllerRepresentable: UIViewControllerRepresentable {
    private var contentViewDelegate: ContentViewDelegate
    
    init(contentViewDelegate: ContentViewDelegate) {
        self.contentViewDelegate = contentViewDelegate
    }
    
    func makeUIViewController(context: Context) -> SearchViewController {
        let viewController = SearchViewController()
        viewController.setDelegate(contentViewDelegate)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: SearchViewController, context: Context) {
        
    }
}
