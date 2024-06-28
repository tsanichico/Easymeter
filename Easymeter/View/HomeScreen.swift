//
//  MainView.swift
//  Easymeter
//
//  Created by Tsani Chico Bragi on 25/06/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = ViewModel()
    @FocusState private var keyboardDis: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Let's Convert!")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(.top, 50)
                    .padding(.bottom, 5)
                
                Text("Accurate, fast, and easy cm to meter conversions.")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.gray)
                    .padding(.bottom, 30)
                
                Text("Measurement")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                
                HStack{
                    Menu {
                        ForEach(Model.allCases) { conversionType in
                            Button(action: {
                                viewModel.conversionType = conversionType
                            }) {
                                Text(conversionType.rawValue)
                            }
                        }
                    } label: {
                        HStack {
                            Text(viewModel.conversionType.rawValue)
                            Image(systemName: "chevron.down")
                        }
                        .frame(width: 90)
                        .padding()
                        .foregroundStyle(Color.primarycolor)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primarycolor)
                        }
                    }
                    
                    TextField("Input measurement", text: $viewModel.input)
                        .frame(maxWidth: .infinity)
                        .frame(height: 20)
                        .padding()
                       
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(radius: 1)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .keyboardType(.decimalPad)
                        .focused($keyboardDis)
                        
                }
                
                Button(action: {
                    viewModel.calculateResult()
                    keyboardDis = false
                }) {
                    Text("Result")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(viewModel.input.isEmpty ? Color.gray : Color.primarycolor)
                        .foregroundStyle(Color.white)
                        .cornerRadius(5)
                }
                .disabled(viewModel.input.isEmpty)
                .padding(.top, 10)
                .padding(.bottom, 40)
                
                Text("Unit Conversion Rate")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.gray)
                
                if !viewModel.result.isEmpty {
                    let resultComponents = viewModel.result.components(separatedBy: "=")
                    if resultComponents.count == 2 {
                        HStack{
                            Text(resultComponents[0])
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            
                            Text("=")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            
                            
                            Text(resultComponents[1])
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.primarycolor)
                        }.padding(.top, 2)
                    } else {
                        Text(viewModel.result)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.top, 2)
                    }
                }
                
                Spacer()
            }.padding(.horizontal,25)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Image("logooren")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 185, height: 38)
                            .padding(.vertical, 35)
                    }
                }
        }
    }
}

#Preview {
    HomeScreen()
}
