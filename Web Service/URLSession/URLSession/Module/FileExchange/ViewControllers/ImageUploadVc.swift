//
//  ImageUploadVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 29/06/23.
//

import UIKit

class ImageUploadVc: UIViewController, URLSessionTaskDelegate {
    
    // MARK: OUTLETS
    @IBOutlet weak var btnUploadImg: UIButton!
    @IBOutlet weak var progessView: UIProgressView!
    
    // MARK: VARIABLES
    var coordinator: ExchangeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progessView.progress = 0
    }
    
    // MARK: ACTION METHODS
    @IBAction func pickImage(_ sender: UIButton) {
        progessView.progress = 0
        DispatchQueue.global(qos: .background).async {
            self.uploadData(image: UIImage(named: "starShot") ?? UIImage(), type: ImageUploadModel.self) {(result: Result<ImageUploadModel, Error>) in
                switch result {
                case .success(let imageResponse):
                    print("Response: ",imageResponse.data.displayURL)
                    break
                case .failure(let error):
                    print("Error: ",error)
                }
            }
        }
    }
}

// MARK: UPLOAD MECHANISM
extension  ImageUploadVc {
    
    func setUpMultiPartData(paramName: String, fileName: String?, image: UIImage, boundary: String) -> Data {
        var data = Data()
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8) ?? Data())
        if let fileName {
            data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8) ?? Data())
        }
        else {
            data.append("Content-Disposition: form-data; name=\"\(paramName)\"\r\n".data(using: .utf8) ?? Data())
        }
        //            data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n" ?? "")
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8) ?? Data())
        data.append(image.pngData() ?? Data())
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8) ?? Data())
        return data
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        DispatchQueue.main.async {
            self.progessView.setProgress(Float(totalBytesSent/totalBytesExpectedToSend), animated: true)
        }
    }
    
    func uploadData<T: Decodable>(image: UIImage, type : T.Type , completion : @escaping ((Result<T,Error>) -> ()) ) {
        if var url = URL(string: "https://api.imgbb.com/1/upload") {
            url.append(queryItems: [URLQueryItem(name: "key", value: "dd7832bb31a876cce8cc739a31728d44")])
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            let boundary = UUID().uuidString
            urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            let data = setUpMultiPartData(paramName: "image", fileName: "ShortHand", image: image, boundary: boundary)
            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: data) { data, response, error in
                if let data {
                    do {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(response))
                    } catch let error {
                        print("error \(error)")
                    }
                }
            }
            uploadTask.delegate = self
            uploadTask.resume()
        }
    }
    
}
