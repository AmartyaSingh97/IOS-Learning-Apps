//
//  FrameworkDetailView.swift
//  Apple Frameworks
//
//  Created by Apple on 11/10/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack{
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .padding()
                .font(.body)
            
            Spacer()
            
            Button{
                isShowingSafariView = true
            }label: {
//                AFButton(title: "Learn More")
                
                Label("Learn More",systemImage: "book.fill")
            }.buttonStyle(.borderedProminent)
                .controlSize(.large)
                .foregroundStyle(.yellow)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .tint(.red)
            
            
        }.sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ??
                       URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
