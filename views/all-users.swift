func fetchData(completion: @escaping () -> Void){
    //getting the right json info time to use it huh
    let urlString = "http://localhost:8080/allthings"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else { return }
        do {
            let apiResponse = try JSONDecoder().decode([MainData.self], from: data)
            DispatchQueue.main.async {
                
                //idk if this will work, good news
                self.arrayofData = apiResponse
                completion()
            }
        } catch {
            print("Failed to decode JSON:", error)
            if let dataString = String(data: data, encoding: .utf8) {
                print("Raw JSON data:", dataString)
            }
            
        }
    }.resume()
}
            let apiResponse = try JSONDecoder().decode([MainData].self, from: data)
            
            DispatchQueue.main.async {
                // Update arrayofData on the main thread
                self.arrayofData = apiResponse
                completion()
            }
        } catch {
            print("Failed to decode JSON:", error)
            if let dataString = String(data: data, encoding: .utf8) {
                print("Raw JSON data:", dataString)
            }
        }
    }.resume()  // This should work correctly as the task is properly set up
}
