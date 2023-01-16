//
//  ContentView.swift
//  TwitterFeelingsSwiftUI
//
//  Created by Sergio Ordaz Romero on 15/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    private var analize: Void {
        TwitterAnalyzer(with: self.$searchText).analize()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange.ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("❔")
                        .font(.system(size: 100))
                        .frame(
                            idealWidth: 200, maxWidth: 200,
                            idealHeight: 200, maxHeight: 200,
                            alignment: .center
                        )
                    Spacer()
                        .frame(height: 50)
                    TextField("Buscar...", text: $searchText)
                        .padding()
                        .frame(width: 250, height: 40)
                        .background(.white)
                        .cornerRadius(5)
                        .padding()
                        .font(.system(size: 16))
                        .onSubmit { analize }
                    Button("Analize") { analize }
                    .padding()
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Twitter Feelings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
