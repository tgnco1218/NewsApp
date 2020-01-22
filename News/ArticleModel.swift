//
//  ArticleModel.swift
//  News
//
//  Created by KYT on 2020/1/22.
//  Copyright © 2020 tgnco1218. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles:[Article])
    
}


class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire off  the request to the API
        
        // Create a string URL
        let stringUrl = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-12-22&sortBy=publishedAt&apiKey=ce6b1ea35ece404fbdf3400f39866970"
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't nil
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        // Get the URl Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do {
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articles = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles)
                    }
                
                }
                
                catch {
                    
                    print("Error parsing the json")
                    
                } // End DO - Catch
            } // End if
        } // End Data Task
        
        // Start the data task
        dataTask.resume()
        
    }
    
}
