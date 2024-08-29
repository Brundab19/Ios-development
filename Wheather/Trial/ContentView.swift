
import SwiftUI

struct ContentView: View {

    @State private var isNight = false
    
    var body: some View {
        
        ZStack{
           
            
            BackgroundView(isNight: $isNight)
            
            VStack {
                
                CityNameView(cityName: "Cupertino,CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temparature: isNight ? 20 : 26)
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    ButtonView(buttonText: "Change Day Time",bgcolor: .white, fgcolor:  isNight ? .gray : .blue)
                }
                
                Spacer()
            }
            
            
        }
        
     
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    
    
    var body: some View {
        VStack {
            
            Text(dayOfWeek)
                .foregroundColor(.white)
            
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50,height: 50)
                .foregroundColor(.white)
            
            
            Text(temperature)
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
//    var topColor: Color
//    var bottomColor: Color
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ?  .gray: Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}


struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var  imageName: String
    var  temparature: Int
    
    var body: some View {
        VStack{
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temparature)°")
                .font(.system(size: 80, weight: .medium))
                .foregroundColor(.white)
            
                .padding(.bottom,40)
            
            
            HStack(spacing:20){
                
                WeatherDayView(dayOfWeek:"Tue", imageName:"cloud.circle" , temperature: "20°")
                
                WeatherDayView(dayOfWeek:"Wed", imageName:"cloud.drizzle.fill" , temperature: "12°")
                
                WeatherDayView(dayOfWeek:"Thr", imageName:"cloud.fill" , temperature: "18°")
                
                WeatherDayView(dayOfWeek:"Fri", imageName:"sun.max" , temperature: "16°")
                
                WeatherDayView(dayOfWeek:"Sat", imageName:"wind" , temperature: "20°")
                
            }
            
            
        }
    }
}


