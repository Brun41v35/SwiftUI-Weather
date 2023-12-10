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
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,
                          weight: .bold))
            .cornerRadius(10)
    }
}
