//
//  ContentView.swift
//  The Epic Navigation Page
//
//  Created by Sachi on 8/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack (path: $path){
            VStack {
                Image("nav")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture { location in
                        if Rect(x1: 158, y1: 414, x2: 237, y2: 480, location: location)
                        {
                            
                            path.append("playlist")
                            print("comp clicked")
                        }
                        
                        if Elipse(x: 312, y:308, radius: 30, location: location)
                        {
                            path.append("timer")
                            print("in the clock")
                        }
                        print("Tapped at \(location)")
                        
                        if Rect(x1: 285, y1: 440, x2: 346, y2: 473, location: location)
                        {
                            path.append("journal")
                            print("in the journal")
                        }
                        
                        if Rect(x1: 41, y1: 305, x2: 161, y2: 385, location: location)
                        {
                            path.append("todo")
                            print("in the todo list")
                        }
                        print("Tapped at \(location)")
                    }
            }
            .navigationDestination(for: String.self){ view in
                if view == "playlist"
                {
                    let _ = print("playlist is being requested")
                    Playlist()
                }
                
                if view == "timer"
                {
                    let _ = print("timer is being requested")
                    Timer()
                }
                
                if view == "journal"
                {
                    let _ = print("journal is being requested")
                    Journal()
                }
                
                if view == "todo"
                {
                    let _ = print("todo is being requested")
                    ToDo()
                }

            }
            
        }
        
        
    }
}




func Rect (x1: Int, y1: Int, x2: Int , y2: Int, location: CGPoint) -> Bool
{
    if Int(location.x) > x1 && Int(location.x) < x2
        && Int(location.y) > y1 && Int(location.y) < y2
    {
        return true
    }
    return false
}

func Elipse (x: Int, y: Int, radius: Double, location: CGPoint) -> Bool
{
    let xd = Int(abs(Double(x) - (location.x)))
    let yd = Int(abs(Double(y) - (location.y)))
    let xys = (pow(Double(xd),2) + pow(Double(yd),2))
    let distance = sqrt(Double(xys))
    if Double(distance) <= Double(radius)
    {
        
        return true
    }
    return false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

