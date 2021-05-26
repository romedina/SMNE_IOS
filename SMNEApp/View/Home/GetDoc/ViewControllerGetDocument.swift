//
//  ViewControllerGetDocument.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 25/05/21.
//

import UIKit

class ViewControllerGetDocument: UIViewController {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var downloadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parentView.layer.cornerRadius = 8
        downloadButton.layer.cornerRadius = 8
    }
    
    @IBAction func downloadTapped(_ sender: Any) {
        DispatchQueue.main.async {
            let urlString = "https://www.clickdimensions.com/links/TestPDFfile.pdf"
            let url = URL(string: urlString)
            let fileName = String((url!.lastPathComponent)) as NSString
            // Create destination URL
            let documentsUrl: URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let destinationFileUrl = documentsUrl.appendingPathComponent("\(fileName)")
            //Create URL to the source file you want to download
            let fileURL = URL(string: urlString)
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            let request = URLRequest(url:fileURL!)
            let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    // Success
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("Successfully downloaded. Status code: \(statusCode)")
                    }
                    do {
                        try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                        do {
                            //Show UIActivityViewController to save the downloaded file
                            let contents  = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                            for indexx in 0..<contents.count {
                                if contents[indexx].lastPathComponent == destinationFileUrl.lastPathComponent {
                                    let activityViewController = UIActivityViewController(activityItems: [contents[indexx]], applicationActivities: nil)
                                    self.present(activityViewController, animated: true, completion: nil)
                                }
                            }
                        }
                        catch (let err) {
                            print("error: \(err)")
                        }
                    } catch (let writeError) {
                        print("Error creating a file \(destinationFileUrl) : \(writeError)")
                    }
                } else {
                    print("Error took place while downloading a file. Error description: \(error?.localizedDescription ?? "")")
                }
            }
            task.resume()
        }
    }
    
}

extension ViewControllerGetDocument {
    
}
