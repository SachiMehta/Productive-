
import SwiftUI
struct Journal: View {
  @State private var journalEntry = ""
  var body: some View {
     ZStack {
         Color(red: 0.959, green: 0.924, blue: 0.925)
                   .ignoresSafeArea()
         VStack{
         Image("journalTemplate")
           .renderingMode (.original)
       Spacer ()
         Button (action:{print("clear")
             journalEntry = ""
         }, label: {Image("newEntry").resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 100.0)})
      }
       TextField("Type out your feelings", text: $journalEntry, axis: .vertical)
         .padding(.all, 20.0)
         .frame(width: 250.0, height: 300.0)
         .border(Color("popYellow"), width: 2)
         .multilineTextAlignment(.center)
         .foregroundColor(.accentColor)
     }
      }
    }
struct Journal_Previews: PreviewProvider {
  static var previews: some View {
    Journal()
  }
}
