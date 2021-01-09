//
//  AddQuery.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/8/21.
//

import SwiftUI



struct okeh : View {
    var body : some View {
        Button(action: {print("implement okeh function")}, label: {
            Text("OKEH")
                .font(.custom("Montserrat-Regular", size: 20))
                .foregroundColor(Color("coffee"))
            })
        .padding(.leading, 50)
    }
}


struct delete : View {
    var body : some View {
        Button(action: {print("implement delete function")}, label: {
            Text("DELETE")
                .font(.custom("Montserrat-Regular", size: 20))
                .foregroundColor(.red)
            })
        .padding(.trailing, 50)
    }
}




struct addDishView : View {
    @State var dishInput: String = ""
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
                        }
                    )
                        .font(.custom("Montserrat-Regular", size: 25))
                        .background(Rectangle()
                                        .foregroundColor(.white)
                                        .border(Color("slate"))
                        )
                        .padding(.horizontal, 20)
                    
                    HStack {
                        okeh()
                        Spacer()
                        delete()
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

/*
struct testView : View {
    @State private var addDish = true
    
    var body : some View {
        addDishView(show: $addDish)
    }
}


struct addPreview : PreviewProvider {
    
    
    static var previews: some View {
        
        testView()
    }
}
 
 */
