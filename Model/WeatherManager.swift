//
//  WeatherManager.swift
//  Clima
//
//  Created by administrator on 04/05/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=71b470e7bdf63fadef56a2f4383bd91d&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a URl (get and copy the url)
        if let url = URL(string: urlString) {
            //2. Ceate a URL sesssion (Open the browwser)
            let session = URLSession(configuration: .default)
            //3. Give a sesseion task (past the URL to the browwser to fetch the data)
            //let task = session.dataTask(with: url, completionHandler: handle(data:repsonse:error:))
            let task = session.dataTask(with: url) { (data, repsonse, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString ?? 0 )
                }
            }
            //4. Start the task (click enter)
            task.resume()
        }
    }
    
    
    
}
