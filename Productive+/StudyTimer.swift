//
//  Timer.swift
//  Productive+
//
//  Created by scholar on 8/16/23.
//

import SwiftUI

struct StudyTimer: View {
    
    @StateObject private var vm = ViewModel()
        private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        private let width: Double = 250
    
    var body: some View {
        ZStack {
            Color(red: 0.959, green: 0.924, blue: 0.925)
                .ignoresSafeArea()
            Image("timerBg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 120)
            VStack {
                Text("focus timer")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 0.523, green: 0.383, blue: 0.333))
                    .padding(.top, 50)
                Spacer()
                Text("\(vm.time)")
                    .font(.system(size: 64, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 0.523, green: 0.383, blue: 0.333, opacity: 1.0))
                    .alert("Timer done!", isPresented: $vm.showingAlert) {
                                Button("Continue", role: .cancel) {
                                    // notif???
                                }
                            }
                    .padding()
                
                // binding here since user changes the #
                Slider(value: $vm.minutes, in: 0...45, step: 5)
                    .padding()
                // if countdown already started disable the slider
                    .disabled(vm.isActive)
                //
                    .animation(.easeInOut, value: vm.minutes)
                    .frame(width: width)
                    .accentColor(Color(red: 0.523, green: 0.383, blue: 0.333, opacity: 1.0))

                HStack(spacing:50) {
                    Button("Start") {
                        vm.start(minutes: vm.minutes)
                            }
                    .padding(.horizontal)
//                    .disabled(vm.isActive)
                    .foregroundColor(Color(red: 0.523, green: 0.383, blue: 0.333, opacity: 1.0))
                    .buttonStyle(.bordered)
                    .border(Color(red: 0.523, green: 0.383, blue: 0.333, opacity: 1.0), width: 3)
                    .cornerRadius(3)
                    .tint(Color(red: 0.959, green: 0.924, blue: 0.925))
                            
                    Button("Reset", action: vm.reset)
                        .foregroundColor(.red)
                        .buttonStyle(.bordered)
                        .padding(.horizontal)
                        .border(.red, width: 3)
                        .cornerRadius(3)
                        .tint(Color(red: 0.959, green: 0.924, blue: 0.925))
                }
//                .frame(width: width)
                    }
                    .onReceive(timer) { _ in
                        vm.updateCountdown()
                    }
        }
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        StudyTimer()
    }
}
