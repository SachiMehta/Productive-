//
//  ToDo.swift
//  Productive+
//
//  Created by scholar on 8/16/23.
//
// cmt
import SwiftUI
import Foundation

class todoItem: Identifiable
{
    var id = UUID()
    var title = ""
    var isDone = false
    
    init(title: String, isDone: Bool = false) {
            self.title = title
            self.isDone = isDone
        }
}


struct ToDoView: View {
    @Environment(\.managedObjectContext) var context
    @State var title: String
    @FetchRequest(
        entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    
    var toDoItems: FetchedResults<ToDo>
    
    var body: some View {
        VStack {
            
            ZStack{
                Image("todo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture { location in
                        if Elipse(x: 325, y:647, radius: 28, location: location)
                        {
                            self.addTask(title: self.title)
                            title = ""
                        }
                        print("tapped at \(location)")

                        
                    }

                //cut overflow scrollable div
                Rectangle()
                    .frame(width: 250.0, height: 350)
                    .foregroundColor(.white)
                    .overlay(
                            VStack{
                                List{
                                    ForEach(toDoItems){ todoItem in
                                        HStack{
                                            Image(systemName: todoItem.isDone ? "checkmark.square": "square")
                                                            .onTapGesture {
                                                                todoItem.isDone.toggle()
                                                                try? context.save()
                                                            }
                                            Text(todoItem.title ?? "No Title")
                                        }
                                        
                                    }
                                    
                                    .onDelete(perform: deleteTask)
                                }.listStyle(.plain)
                                
                            }
                            
                        
                    )
                    .position(x:200, y:375)
                TextField("Enter the task description...", text:$title)
                    .padding(.horizontal)
                    .frame(width: 250.0, height: 50.0)
                    .background(.white)
                    .position(x:150, y:650)
                            }
            }
            
                        
        }
    private func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)

                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    private func addTask(title: String, isDone: Bool = false) {
            
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isDone = isDone
                
        do {
           try context.save()
        } catch {
           print(error)
        }
        }
    }

struct ToDo_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView(title: "")
    }
}
