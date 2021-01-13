//
//  Search.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/8/21.
//

import SwiftUI


struct NavBar : View {
    var body : some View {
        HStack {
            // search tab
            Button(action: {print("implement switch views function")}, label: {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Text("search")
                        .font(.custom("Montserrat-Regular", size: 10))
                        .foregroundColor(.white)
                }
            })
            .padding(.leading, 80)
            .padding(.bottom, 25)
            .padding(.top, 5)
            
            Spacer()
            
            
            // my recipes tab
            Button(action: {print("implement switch views function")}, label: {
                VStack {
                    Image(systemName: "book")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Text("my recipes")
                        .font(.custom("Montserrat-Regular", size: 10))
                        .foregroundColor(.white)
                }
            })
            .padding(.trailing, 80)
            .padding(.bottom, 25)
            .padding(.top, 5)
        }
        .frame(maxWidth: .infinity)
        .background(
            Rectangle().foregroundColor(Color("copper"))
        )
        .padding(.bottom, -50)
    }
}


struct ToggleDish : View {
    @State private var didTap = false
    @State var index : Int
    
    @StateObject var recipeViewModel: RecipeViewModel
    
    var body : some View {
        Button(action: {
            self.recipeViewModel.toggleDish(index: index)
            self.didTap.toggle()
            
        }, label: {
            Image(systemName: "xmark")
                .font(.system(size: 23, weight: .bold))
                .foregroundColor(didTap ? Color.white : Color("slate"))
        })
        .padding(6)
        .background(
            RoundedRectangle(cornerRadius: 6.0)
                .foregroundColor(.white))
    }
}


struct ToggleIngredient : View {
    @State private var didTap = false
    @State var index : Int
    
    @StateObject var recipeViewModel: RecipeViewModel
    
    var body : some View {
        Button(action: {
            self.recipeViewModel.toggleIngredient(index: index)
            self.didTap.toggle()
        }, label: {
            Image(systemName: "xmark")
                .font(.system(size: 23, weight: .bold))
                .foregroundColor(didTap ? Color.white : Color("slate"))
        })
        .padding(6)
        .background(
            RoundedRectangle(cornerRadius: 6.0)
                .foregroundColor(.white))
    }
}


struct DishInput : View {
    //var title: String
    @Binding var show: Bool
    @Binding var index: Int
    var dish: Dish
    //@Binding var show: Bool
    
    @StateObject var recipeViewModel: RecipeViewModel
    
    var body : some View {
         
        HStack {
            Text(dish.name.lowercased())
                .font(.custom("Montserrat", size: 20))
            Spacer()
            
            // edit button
            Button(action: {
                self.show.toggle()
                self.index = recipeViewModel.getDishIndex(dish: dish)
            }, label: {
                Image(systemName: "pencil")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(Color("slate"))
                })
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(.white)
            )
            
            ToggleDish(index: index, recipeViewModel: recipeViewModel)
        }
        
        
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(Color("butter"))
        )
        
        
    }
}

struct IngInput : View {
    @Binding var show: Bool
    @Binding var index: Int
    var ingredient: Ingredient
    
    @StateObject var recipeViewModel : RecipeViewModel
    
    var body : some View {
         
        HStack {
            Text(ingredient.name.lowercased())
                .font(.custom("Montserrat", size: 20))
            Spacer()
            
            // edit button
            Button(action: {
                self.show.toggle()
                self.index = recipeViewModel.getIngIndex(ing: ingredient)
            }, label: {
                Image(systemName: "pencil")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(Color("slate"))
                })
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(.white)
            )
            
            
            // toggle button
            ToggleIngredient(index: index, recipeViewModel: recipeViewModel)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(Color("sky"))
        )
        
        
    }
}


struct dishScroll : View {
    @StateObject var recipeViewModel: RecipeViewModel
    @Binding var showEdit : Bool
    @Binding var index: Int
    
    var body : some View {
        ScrollView(.vertical) {
            // make a scroll of dish cards
            VStack {
                let dishes = self.recipeViewModel.getDishArray()
                
                ForEach(0 ..< dishes.count, id: \.self) { dish in
                    DishInput(show: $showEdit, index: $index, dish: dishes[dish], recipeViewModel: recipeViewModel)
                }
 
            }
            
        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
    }
}


struct ingScroll : View {
    @StateObject var recipeViewModel: RecipeViewModel
    @Binding var showEdit : Bool
    @Binding var index: Int
    
    var body : some View {
        ScrollView(.vertical) {
            VStack {
                let ingredients = self.recipeViewModel.getIngArray()
                
                ForEach(0 ..< ingredients.count, id: \.self) { ingredient in
                    IngInput(show: $showEdit, index: $index, ingredient: ingredients[ingredient], recipeViewModel: recipeViewModel)
                }
 
            }
        }
        //.padding(.horizontal, 25)
        .frame(height: 220)
        .frame(maxWidth: .infinity)
    }
}


struct addDishButton : View {
    // connects to addDishInput
    //@State private var addDish = false
    
    
    // connects to Search
    @Binding var show: Bool
    
    var body : some View {
        Button(action: {
            self.show.toggle()
        }, label: {
            Text("+ Add Dish")
                .font(.custom("Typo Round Regular Demo", size: 25))
                .foregroundColor(Color("coffee"))
            
        })
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 5)
        )
            
            //addDishView(show: $addDish)
    }
}



struct addIngButton : View {
    @Binding var show: Bool
    
    var body : some View {
        
        Button(action: {
            self.show.toggle()
        }, label: {
            Text("+ Add Ingredient")
                .font(.custom("Typo Round Regular Demo", size: 25))
                .foregroundColor(Color("coffee"))
            
        })
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 5)
        )
    }
}


struct Search : View {
    @State private var addDish = false
    @State private var addIngredient = false
    @State private var editDish = false
    @State private var editDishIndex = 0
    @State private var editIngredient = false
    @State private var editIngIndex = 0
    //@State private var editDish = 0
    //@State private var editDishName = ""
    
    @Binding var showSelf : Bool
    @Binding var showOther : Bool
    
    //@Binding var hide : Bool
    //@State var hide = true
    
    // the query model
    @ObservedObject var recipeViewModel: RecipeViewModel
    
  var body : some View {
    ZStack {
        // background
        Color("creme").opacity(1.0).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        VStack{
            // heading
            HStack {
                Text("Search")
                    .font(.custom("Typo Round Regular Demo", size: 45))
                    .foregroundColor(Color("coffee"))
                Spacer()
            }
            
            // subheading
            HStack {
                Text("dishes")
                    .font(.custom("Typo Round Regular Demo", size: 30))
                    .foregroundColor(Color("coffee"))
                    //.padding(.leading, 25)
                    .padding(.top, 5)
                    .padding(.bottom, -5)
                
                Spacer()
            }
            
            dishScroll(recipeViewModel: recipeViewModel, showEdit: $editDish, index: $editDishIndex)
            
            addDishButton(show: $addDish)
            
            // ingredients subheading
            HStack {
                Text("ingredients")
                    .font(.custom("Typo Round Regular Demo", size: 30))
                    .foregroundColor(Color("coffee"))
                    //.padding(.leading, 25)
                    .padding(.top, 10)
                    .padding(.bottom, 1)
                
                Spacer()
            }
            
            ingScroll(recipeViewModel: recipeViewModel, showEdit: $editIngredient, index: $editIngIndex)
            
            addIngButton(show: $addIngredient)
            
            Spacer()
                .frame(height: 15)
            
            
            // search button
            Button(action: {
                self.recipeViewModel.search()
                self.showSelf.toggle()
                self.showOther.toggle()
            }, label: {
                Text("search! ")
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
        
        if addDish {
            addDishView(show: $addDish, recipeViewModel: self.recipeViewModel)
        }
        
        if addIngredient {
            addIngView(show: $addIngredient, recipeViewModel: self.recipeViewModel)
        }
        
        if editDish {
            editDishView(index: editDishIndex, editedValue: recipeViewModel.getDishName(index: editDishIndex), show: $editDish, recipeViewModel: self.recipeViewModel)
        }
        
        if editIngredient {
            EditIngView(index: editIngIndex, editedValue: recipeViewModel.getIngName(index: editIngIndex), show: $editIngredient, recipeViewModel: self.recipeViewModel)
        }
    }
  }
}

/*
struct SearchPreview : PreviewProvider {
    @State var show : Bool = true
    
    static var previews: some View {
        Search(showSelf: show, recipeViewModel: RecipeViewModel())
    }
}
*/
