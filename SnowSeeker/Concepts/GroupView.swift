//
//  GroupView.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 11/08/2024.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna & Arya")
        }
        .font(.title)
    }
}

struct GroupView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @State private var layoutVertically: Bool = false
    
    var body: some View {
        if horizontalSizeClass == .compact {
            VStack {
                UserView()
            }
        } else {
            UserView()
        }
        
//        Button {
//            layoutVertically.toggle()
//        } label: {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                UserView()
//            }
//        }
        
//        ViewThatFits {
//            Rectangle()
//                .frame(width: 500, height: 200)
//            
//            Circle()
//                .frame(width: 200, height: 200)
//        }
    }
}

#Preview {
    GroupView()
}
