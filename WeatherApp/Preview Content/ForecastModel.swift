//
//  ForecastModel.swift
//  WeatherApp
//
//  Created by Justin on 5/4/23.
//

import Foundation

enum ForecastPeriod {
    case hourly
    case daily
}

enum Weather: String {
    case clear = "Clear"
    case cloudy = "Cloudy"
    case rainy = "Mid Rain"
    case stormy = "Showers"
    case sunny = "Sunny"
    case tornado = "Tornado"
    case windy = "Fast Wind"
}

struct Forecast: Identifiable {
    var id = UUID()
    var date: Date
    var weather: Weather
    var probability: Double
    var temperature: Double
    var high: Double
    var low: Double
    var location: String
    
    // update with icons under given weather conditions
    var icon: String {
        switch weather {
        case .clear:
            return "Moon"
        case .cloudy:
            return "Cloud"
        case .rainy:
            return "Moon cloud mid rain"
        case .stormy:
            return "Sun cloud angled rain"
        case .sunny:
            return "Sun"
        case .tornado:
            return "Tornado"
        case .windy:
            return "Moon cloud fast wind"
        }
    }
}

extension Forecast {
    static let hour: TimeInterval = 60 * 60
    static let day: TimeInterval = 60 * 60 * 24
    
    static let hourly: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: hour * -1), weather: .rainy, probability: 30, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 1), weather: .windy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 2), weather: .rainy, probability: 0, temperature: 18, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 3), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 4), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada")
    ]
    
    static let daily: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: 0), weather: .rainy, probability: 30, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: day * 1), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: day * 2), weather: .stormy, probability: 100, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: day * 3), weather: .stormy, probability: 50, temperature: 18, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: day * 4), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        Forecast(date: .init(timeIntervalSinceNow: day * 5), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada")
    ]
    
    // model data until search bar fix for real time data 
    static let cities: [Forecast] = [
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 66.2, high: 75.2, low: 64.4, location: "Montreal, Canada"),
        Forecast(date: .now, weather: .windy, probability: 0, temperature: 68, high: 69.8, low: 66.2, location: "Toronto, Canada"),
        Forecast(date: .now, weather: .stormy, probability: 0, temperature: 55.4, high: 60.8, low: 46.4, location: "Tokyo, Japan"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 77, low: 68, location: "Montgomery, Alabama"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Juneau, Alaska"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 66.2, high: 71.6, low: 60.8, location: "Phoenix, Arizona"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Little Rock, Arkansas"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Sacramento, California"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Denver, Colorado"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Hartford, Connecticut"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Dover, Delaware"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 66.2, high: 71.6, low: 60.8, location: "Tallahassee, Florida"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Atlanta, Georgia"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Honolulu, Hawaii"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Boise, Idaho"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Springfield, Illinois"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73.4, high: 78.8, low: 68, location: "Indianapolis, Indiana"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73, high: 79, low: 66, location: "Des Moines, Iowa"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 83, high: 83, low: 81, location: "Topeka, Kansas"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 76, high: 77, low: 66, location: "Frankfort, Kentucky"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 85, high: 85, low: 78, location: "Baton Rouge, Louisiana"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 82, high: 83, low: 70, location: "St. Paul, Minnesota"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 84, high: 86, low: 72, location: "Jackson, Mississippi"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 78, high: 78, low: 70, location: "Jefferson City, Missouri"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 79, high: 80, low: 66, location: "Helena, Montana"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 75, high: 77, low: 66, location: "Lincoln, Nebraska"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 77, high: 77, low: 66, location: "Carson City, Nevada"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 65, high: 66, low: 58, location: "Concord, New Hampshire"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 64, high: 66, low: 58, location: "Trenton, New Jersey"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 79, high: 86, low: 68, location: "Santa Fe, New Mexico"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 56, high: 60, low: 48, location: "Albany, New York"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 72, high: 73, low: 62, location: "Raleigh, North Carolina"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 68, high: 69, low: 58, location: "Bismarck, North Dakota"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 74, high: 76, low: 58, location: "Columbus, Ohio"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 70, high: 72, low: 60, location: "Oklahoma City, Oklahoma"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 72, high: 73, low: 61, location: "Salem, Oregon"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73, high: 76, low: 68, location: "Harrisburg, Pennsylvania"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 73, high: 76, low: 64, location: "Providence, Rhode Island"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 75, high: 77, low: 68, location: "Columbia, South Carolina"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 76, high: 76, low: 66, location: "Pierre, South Dakota"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 78, high: 80, low: 72, location: "Nashville, Tennessee"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 82, high: 84, low: 75, location: "Austin, Texas"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 84, high: 88, low: 70, location: "Salt Lake City, Utah"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 69, high: 70, low: 48, location: "Montpelier, Vermont"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 73, high: 75, low: 52, location: "Richmond, Virginia"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 66, high: 66, low: 48, location: "Olympia, Washington"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 72, high: 73, low: 55, location: "Charleston, West Virginia"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 74, high: 80, low: 68, location: "Madison, Wisconsin"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 78, high: 80, low: 71, location: "Cheyenne, Wyoming"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 82, high: 84, low: 74, location: "Los Angeles, USA"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 64, high: 66, low: 48, location: "London, UK"),
        Forecast(date: .now, weather: .cloudy, probability: 0, temperature: 60, high: 60, low: 48, location: "Berlin, Germany"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 84, high: 90, low: 78, location: "Mumbai, India"),
        Forecast(date: .now, weather: .windy, probability: 0, temperature: 23, high: 24, low: 2, location: "Moscow, Russia"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 81, high: 85, low: 73, location: "San Francisco, USA"),
        Forecast(date: .now, weather: .windy, probability: 0, temperature: 75, high: 77, low: 69, location: "Sydney, Australia"),
        Forecast(date: .now, weather: .sunny, probability: 0, temperature: 90, high: 95, low: 88, location: "Rio de Janeiro, Brazil")

    ]
}
