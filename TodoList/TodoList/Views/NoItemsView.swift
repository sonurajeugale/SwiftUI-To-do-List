//
//  NoItemsView.swift
//  TodoList
//
//  Created by Prathamesh Ugale on 17/02/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let SecondaryColor = Color("SecondaryColor")

    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items!")
                NavigationLink(destination: AddView(), label: {
                    Text("ADD SOMETHING")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? SecondaryColor : Color.accentColor)
                        .cornerRadius(5)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? SecondaryColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30:10, x: 0, y: animate ? 50:30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("Title")
        }
       
    }
}
