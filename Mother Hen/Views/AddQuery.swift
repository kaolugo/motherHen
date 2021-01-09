//
//  AddQuery.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/8/21.
//

import SwiftUI

struct addDishView : View {
    @State var dishInput: String = ""
    
    // connects to add dish button
    @Binding var show: Bool
    
    // the query model
    @ObservedObject var recipeViewModel: RecipeViewModel

    var body : some View {
        if show {
            ZStack {
                
                VStack {
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Add")
                        .font(.custom("Typo Round Regular Demo", size: 30))
                        .foregroundColor(Color("coffee"))
                    
                    TextField(
                        " enter dish name",
                        text: $dishInput,
                        onCommit: {
                            // add the dish to the list of dish queries
                            self.recipeViewModel.addDish(dish: dishInput)
                            show.toggle()
                            
                        }
                    )
                        .font(.custom("Montserrat-Regular", size: 25))
                        .foregroundColor(.black)
                        .background(Rectangle()
                                        .foregroundColor(.white)
                                        .border(Color("slate"))
                        )
                        .padding(.horizontal, 20)
                    

                    
                    HStack {
                        Button(action: {
                            self.recipeViewModel.addDish(dish: dishInput)
                            show.toggle()
                        }, label: {
                            Text("OKEH")
                                .font(.custom("Montserrat-Regular", size: 20))
                                .foregroundColor(Color("coffee"))
                            })
                        .padding(.leading, 50)
                        
                        Spacer()
                        
                        Button(action: {
                            show.toggle()
                        }, label: {
                            Text("CANCEL")
                                .font(.custom("Montserrat-Regular", size: 20))
                                .foregroundColor(.red)
                            })
                        .padding(.trailing, 50)
                        
                    }
                    Spacer()
                        .frame(height: 20)
                }
                .background(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 35)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("coffee"), lineWidth: 8)
                            .padding(.horizontal, 35)
                )
            }
        }
    }
}


struct testView : View {
    @State private var addDish = true
    @State private var commitInput = false
    
    var body : some View {
        addDishView(show: $addDish, recipeViewModel: RecipeViewModel())
    }
}


struct addPreview : PreviewProvider {
    static var previews: some View {
        testView()
    }
}
 

