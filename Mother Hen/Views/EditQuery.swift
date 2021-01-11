//
//  EditQuery.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/10/21.
//


import SwiftUI

struct editDishView : View {
    //@State var dish: Dish
    @State var index: Int
    @State var editedValue : String
    
    @Binding var show: Bool
    
    // the query model
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    var body : some View {
        ZStack {
            
            VStack {
                Spacer()
                    .frame(height: 20)
                
                Text("Edit")
                    .font(.custom("Typo Round Regular Demo", size: 30))
                    .foregroundColor(Color("coffee"))
                
                TextField(
                    "",
                    text: $editedValue,
                    onCommit: {
                        // add the dish to the list of dish queries
                        self.recipeViewModel.editDish(index: index, edit: editedValue)
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
                        self.recipeViewModel.editDish(index: index, edit: editedValue)
                        show.toggle()
                    }, label: {
                        Text("OKEH")
                            .font(.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(Color("coffee"))
                        })
                    .padding(.leading, 50)
                    
                    Spacer()
                    
                    Button(action: {
                        self.recipeViewModel.removeDish(index: index)
                        show.toggle()
                    }, label: {
                        Text("DELETE")
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


struct EditIngView : View {
    @State var index : Int
    @State var editedValue : String
    @Binding var show : Bool
    
    @ObservedObject var recipeViewModel : RecipeViewModel
    
    var body : some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 20)
                
                Text("Edit")
                    .font(.custom("Typo Round Regular Demo", size: 30))
                    .foregroundColor(Color("coffee"))
                
                TextField(
                    "",
                    text: $editedValue,
                    onCommit: {
                        self.recipeViewModel.editIngredient(index: index, edit: editedValue)
                        show.toggle()
                    }
                )
                .font(.custom("Montserrat-Regular", size: 25))
                .foregroundColor(.black)
                .background(Rectangle().foregroundColor(.white)
                                .border(Color("slate"))
                )
                .padding(.horizontal, 20)
                
                
                HStack {
                    Button(action: {
                        self.recipeViewModel.editIngredient(index: index, edit: editedValue)
                        show.toggle()
                    }, label: {
                        Text("OKEH")
                            .font(.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(Color("coffee"))
                    })
                    .padding(.leading, 50)
                    
                    Spacer()
                    
                    Button(action: {
                        self.recipeViewModel.removeIng(index: index)
                        show.toggle()
                    }, label: {
                        Text("DELETE")
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
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("coffee"), lineWidth: 8).padding(.horizontal, 35)
            )
        }
    }
}

