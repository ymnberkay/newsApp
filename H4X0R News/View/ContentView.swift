//
//  ContentView.swift
//  H4X0R News
//
//  Created by Berkay Yaman on 5.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                            .padding(.horizontal)
                        Text(post.title)
                            .font(.system(size: 13))
                            .padding(.horizontal)
                    }
                }
            }.listStyle(.insetGrouped).navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



