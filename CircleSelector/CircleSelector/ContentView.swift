//
//  ContentView.swift
//  CircleSelector
//
//  Created by Enric Herce on 23/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
                    Rectangle()
                        .fill(Color.init(red: 34/255, green: 30/255, blue: 47/255))
                        .edgesIgnoringSafeArea(.all)
            
                    TemperatureControlView()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct TemperatureControlView: View {
    
    //Current Temp
    @State var temperatureValue: CGFloat = 0.0
    //CurrentAngle (Selector Angle)
    @State var angleValue: CGFloat = 0.0
    
    //Here we define values for the selector
    let config = Config(minimumValue: 0.0,
                        maximumValue: 40.0,
                        totalValue: 40.0,
                        knobRadius: 15.0,
                        radius: 125.0)
    
    var body: some View {
        ZStack {
            
            

            //We create a circle for a better visuals. Here we have some issue because we don't want a circle with a color or stroke, we want a dot separation, so we use lineCap and dash with two values:
            Circle()
                .stroke(Color.gray,
                        style: StrokeStyle(lineWidth: 3, lineCap: .butt, dash: [3.0,33.0]))
                .frame(width: config.radius * 2, height: config.radius * 2)
            
            //Here we define the zone our circle will pass. It will change using the next circle
            Circle()
                //From where the circle trim (from 0 to the total value we define. We can put 1 to have all drawed
                .trim(from: 0.0, to: temperatureValue/config.totalValue)
                
                //Color of the line
                .stroke(Color.blue, lineWidth: 4)
                
                //Measures
                .frame(width: config.radius * 2, height: config.radius * 2)
                //By default the circle starts drawing from 0º(right) if we want to start in the upper zone we move the circcle -90º
                .rotationEffect(.degrees(-90))
            
            //KnobCircle that we will drag to change the temperature value.
            Circle()
                .fill(temperatureValue < config.maximumValue/2 ? Color.blue : Color.red)
                .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
                //padding allow us to have a bigger zone to tap
                .padding(10)
                .offset(y: -config.radius)
                
                .rotationEffect(Angle.degrees(Double(angleValue)))
                
                //Together: We add a gesture to the circle and onChange to indicates changes in the circle we make in the movement
                .gesture(DragGesture(minimumDistance: 0.0)
                .onChanged({ value in
                    change(location: value.location)
            }))
            
            Text("\(String.init(format: "%.0f", temperatureValue)) º")
            .font(.system(size: 60))
            .foregroundColor(.white)
            
        }
    }
    
    //Here is where magic happens
    private func change(location: CGPoint) {
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
        let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + .pi/2.0
        
        // convert angle range from (-pi to pi) to (0 to 2pi)
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        // convert angle value to temperature value
        let value = fixedAngle / (2.0 * .pi) * config.totalValue
        
        if value >= config.minimumValue && value <= config.maximumValue {
            temperatureValue = value
            angleValue = fixedAngle * 180 / .pi // converting to degree
        }
    }
}
    
struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}








