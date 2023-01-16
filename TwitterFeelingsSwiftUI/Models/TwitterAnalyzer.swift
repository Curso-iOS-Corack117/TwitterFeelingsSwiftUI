//
//  TwitterAnalyzer.swift
//  TwitterFeelingsSwiftUI
//
//  Created by Sergio Ordaz Romero on 15/01/23.
//

import Foundation
import SwiftUI

struct TwitterAnalyzer {
    @Binding var searchedText: String
    private var model: TwitterFeeling!
    
    init(with searchedText: Binding<String>) {
        self._searchedText = searchedText
        if let model = try? TwitterFeeling(configuration: .init()) {
            self.model = model
        }
    }
    
    func analize() {
        if let prediction = try? model.prediction(text: searchedText) {
            print(prediction.label)
        }
    }
}
