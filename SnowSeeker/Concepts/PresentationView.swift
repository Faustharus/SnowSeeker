//
//  PresentationView.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 12/08/2024.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct PresentationView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Button("Tap me") {
                    isShowingUser = true
                    selectedUser = User()
                }
            }
            .sheet(item: $selectedUser) { user in
                Text(user.id)
                    .presentationDetents([.height(proxy.size.height * 0.15), .medium, .large])
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) {  }
//        }
//        .sheet(item: $selectedUser) { user in
//            Text(user.id)
//        }
        
//        NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//                Text("Hello, world!")
//            }
//            .padding()
//        } content: {
//            Text("Content")
//        } detail: {
//            Text("Detail")
//        }
//        .navigationSplitViewStyle(.prominentDetail)
    }
}

#Preview {
    PresentationView()
}
