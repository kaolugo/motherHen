//
//  Results.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/10/21.
//

import SwiftUI


struct resultScroll : View {
    @StateObject var recipeViewModel : RecipeViewModel
    
    var body : some View {
        ScrollView(.vertical) {
            // make a scroll of search result cards
            VStack {
                let recipes = self.recipeViewModel.getRecipeArray()
                
                ForEach(0 ..< recipes.count, id: \.self) { recipe in
                    RecipeResult(recipe: recipes[recipe])
                }
            }
        }
        .padding(.top, 5)
        .frame(height: 620)
        .frame(maxWidth: .infinity)
        //.padding()
    }
}
 


struct RecipeResult : View {
    var recipe: Recipe
    
    var body : some View {
        ZStack {
            HStack {
                
                Link(recipe.title, destination: recipe.url)
                    .frame(height: 50)
                    .font(.custom("Montserrat-Regular", size: 20))
                    .foregroundColor(Color("coffee"))
                    //.padding(.vertical, )
                
                Spacer()
                Button(action: {print("implement like function")}, label: {
                    Image(systemName: "heart")
                        .font(.system(size: 25, weight: .regular))
                        .foregroundColor(Color("slate"))
                })
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 35)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background(RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        //.padding(.top, 10)
        )
    }
}


struct Results: View {
    @ObservedObject var recipeViewModel : RecipeViewModel
    @Binding var showSelf : Bool
    @Binding var showOther : Bool
    
    var body: some View {
        ZStack {
            // background
            Color("creme").opacity(1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //heading
                HStack {
                    Text("Results")
                        .font(.custom("Typo Round Regular Demo", size: 45))
                        .foregroundColor(Color("coffee"))
                    Spacer()
                }
                
                resultScroll(recipeViewModel: recipeViewModel)
                //resultScroll()
                
                Spacer()
                    .frame(height: 15)
                
                // back to search button
                Button(action: {
                    //self.recipeViewModel.search()
                    self.showSelf.toggle()
                    self.showOther.toggle()
                }, label: {
                    Text("back to search")
                        .font(.custom("Typo Round Italic Demo", size: 30))
                        .foregroundColor(Color("coffee"))
                    
                })
                .padding(.leading, 30)
                .padding(.trailing, 25)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 8.0)
                        .foregroundColor(Color("yolk"))
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 5)
                )
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            VStack {
                Spacer()
                NavBar()
            }
        }
    }
}

/*
struct ResultsPreview : PreviewProvider {
    static var previews: some View {
        Results(recipeViewModel: RecipeViewModel())
    }
}
 */
