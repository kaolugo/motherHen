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


struct DishInput : View {
    var title: String
    
    var body : some View {
         
        HStack {
            Text(title)
                .font(.custom("Montserrat", size: 20))
            Spacer()
            
            // edit button
            Button(action: {print("implement edit function")}, label: {
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
            Button(action: {print("implement toggle function")}, label: {
                Image(systemName: "xmark")
                    .font(.system(size: 23, weight: .bold))
                    .foregroundColor(Color("slate"))
            })
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(.white))
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
    var title: String
    
    var body : some View {
         
        HStack {
            Text(title)
                .font(.custom("Montserrat", size: 20))
            Spacer()
            
            // edit button
            Button(action: {print("implement edit function")}, label: {
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
            Button(action: {print("implement toggle function")}, label: {
                Image(systemName: "xmark")
                    .font(.system(size: 23, weight: .bold))
                    .foregroundColor(Color("slate"))
            })
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(.white))
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
    var body : some View {
        ScrollView(.vertical) {
            // make a scroll of dish cards
            DishInput(title: "pasta")
        }
        //.padding(.horizontal, 25)
        .frame(width: .infinity, height: 200)
    }
}


struct ingScroll : View {
    var body : some View {
        ScrollView(.vertical) {
            // make a scroll of dish cards
            IngInput(title: "tomato")
        }
        //.padding(.horizontal, 25)
        .frame(width: .infinity, height: 220)
    }
}


struct addDishButton : View {
    var body : some View {
        Button(action: {print("Implement add dish button")}, label: {
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
    }
}


struct addIngButton : View {
    var body : some View {
        Button(action: {print("Implement add ingredient button")}, label: {
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
                    //.padding(.leading, 25)
                Spacer()
            }
            //.padding(.top, -50)
            
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
            
            dishScroll()
            
            addDishButton()
            
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
            
            ingScroll()
            
            addIngButton()
            
            Spacer()
                .frame(height: 15)
            
            
            // search button
            Button(action: {print("Implement search recipe button")}, label: {
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
    }
    
        
  }
}


struct SearchPreview : PreviewProvider {
    static var previews: some View {
        Search()
    }
}
