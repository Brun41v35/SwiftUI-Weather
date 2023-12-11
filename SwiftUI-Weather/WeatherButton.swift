import SwiftUI

struct WeatherButton: View {
    
    // MARK: - Variables
    
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    // MARK: - Body
    
    var body: some View {
        Text(title)
            .frame(width: 280,
                   height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20,
                          weight: .bold))
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {

        WeatherButton(title: "Title Test",
                      backgroundColor: .blue,
                      textColor: .white)
    }
}
