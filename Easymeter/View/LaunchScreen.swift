//
//  LaunchScreen.swift
//  Easymeter
//
//  Created by Tsani Chico Bragi on 27/06/24.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive: Bool = false
    private let delay: TimeInterval = 2.5

       var body: some View {
           Color.primarycolor
               .ignoresSafeArea()
               .overlay{
                       if self.isActive {
                           HomeScreen()
                       } else {
                           Image("logoputih")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 185, height: 38)
                               .foregroundStyle(Color.black)
                               .accessibility(label: Text("App Logo"))
                       }
                   }
               .onAppear {
                   DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                       withAnimation(.smooth(duration: 1)) {
                           self.isActive = true
                       }
                   }
               }
       }
   }
#Preview {
    LaunchScreen()
}
