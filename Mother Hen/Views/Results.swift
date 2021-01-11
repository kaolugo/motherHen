//
//  Results.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/10/21.
//

import SwiftUI


struct resultScroll : View {
    var body : some View {
        ScrollView(.vertical) {
            RecipeResult()
            RecipeResult()
        }
        .padding(.top, 5)
        .frame(height: 620)
        .frame(maxWidth: .infinity)
        //.padding()
    }
}


struct RecipeResult : View {
    var body : some View {
        ZStack {
            HStack {
                Link("Roasted pepper omelette vegan", destination: URL(string: "https://noahfiner.com/")!)
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
                
                resultScroll()
                
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

struct ResultsPreview : PreviewProvider {
    static var previews: some View {
        Results(recipeViewModel: RecipeViewModel())
    }
}
