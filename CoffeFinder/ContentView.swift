//
//  ContentView.swift
//  CoffeFinder
//
//  Created by Muhammad Jafar Ash Siddiq on 21/11/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var searchText: String = ""
    
    private var coffeShopSearchResult : [Coffeeshop] {
        let results = CoffeeshopProvider.all()
        
        if searchText.isEmpty {
            return results
        } else {
            return results.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private var suggestedResult: [Coffeeshop] {
        if searchText.isEmpty {
            return []
        } else {
            return coffeShopSearchResult
        }
    }
    
    
    
    // MARK: - BODY
    var body: some View {
        
        NavigationStack {
            List(coffeShopSearchResult) { result in
                NavigationLink(destination: {
                    DetailCoffeeshop(coffeeshopDetail: result)
                })
                {
                    HStack(){
                        Image("\(result.image)")
                            .resizable()
                            .frame(width: 100,height: 100)
                            .cornerRadius(10)
                        VStack(alignment: .leading){
                            Text("\(result.name)")
                                .bold()
                                .font(.system(size: 18, design: .rounded))
                            Text("\(result.location)")
                                .font(.system(size: 14, design: .rounded))
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                            Text("rating: 4/5")
                                .font(.system(size: 10, design: .rounded))
                                .foregroundColor(.gray)
                        }
                    }
                }// NavigationLink
            }
            .navigationTitle("CoffeeShop")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search Coffeeshops"
            )
            {
                ForEach(suggestedResult) { result in
                    Text("Lookinf for  \(result.name) ?")
                        .searchCompletion(result.name)
                }
            }
        }// NavigationStack
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
