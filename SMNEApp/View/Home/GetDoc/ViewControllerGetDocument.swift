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
    @IBOutlet weak var downloadA: UIButton!
    @IBOutlet weak var downloadB: UIButton!
    @IBOutlet weak var downloadC: UIButton!
    @IBOutlet weak var downloadD: UIButton!
    @IBOutlet weak var downloadE: UIButton!
    @IBOutlet weak var downloadF: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parentView.layer.cornerRadius = 8
        downloadButton.layer.cornerRadius = 8
        
        downloadA.layer.cornerRadius = 8
        downloadB.layer.cornerRadius = 8
        downloadC.layer.cornerRadius = 8
        downloadD.layer.cornerRadius = 8
        downloadE.layer.cornerRadius = 8
        downloadF.layer.cornerRadius = 8
        
        downloadButton.layer.borderWidth = 1
        downloadButton.layer.borderColor = UIColor(red: 0, green: 147/255, blue: 1, alpha: 1).cgColor
        
        downloadA.layer.borderWidth = 1
        downloadA.layer.borderColor = UIColor(red: 0, green: 147/255, blue: 1, alpha: 1).cgColor
        
        downloadB.layer.borderWidth = 1
        downloadB.layer.borderColor = UIColor(red: 0, green: 147/255, blue: 1, alpha: 1).cgColor
        
        downloadC.layer.borderWidth = 1
        downloadC.layer.borderColor = UIColor(red: 0, green: 147/255, blue: 1, alpha: 1).cgColor
        
        downloadD.layer.borderWidth = 1
        downloadD.layer.borderColor = UIColor(red: 0, green: 147/255, blue: 1, alpha: 1).cgColor
        
        downloadE.layer.borderWidth = 1
        downloadE.layer.borderColor = UIColor(red: 0, green: 147/255, blue: 1, alpha: 1).cgColor
        
        downloadF.layer.borderWidth = 1
        downloadF.layer.borderColor = UIColor(red: 0, green: 147/255, blue: 1, alpha: 1).cgColor
        
        
    }
    
    @IBAction func downloadTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "pdfViewer", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let send = sender as? UIButton
        var url = ""
        switch send {
        case downloadA:
            url = "https://firebasestorage.googleapis.com/v0/b/smne-development.appspot.com/o/algorithm-a.pdf?alt=media&token=58550ce2-7c3c-4fc8-b020-1ca690cbf70d"
            break
        case downloadB:
            url = "https://firebasestorage.googleapis.com/v0/b/smne-development.appspot.com/o/algorithm-b.pdf?alt=media&token=359f042e-bb5e-40bb-a952-e6a8f3d5fb99"
            break
        case downloadC:
            url = "https://firebasestorage.googleapis.com/v0/b/smne-development.appspot.com/o/algorithm-c.pdf?alt=media&token=58efffc7-07d6-435c-8f00-3aae1303aa2a"
            break
        case downloadD:
            url = "https://firebasestorage.googleapis.com/v0/b/smne-development.appspot.com/o/algorithm-d.pdf?alt=media&token=fa8f1ece-2ab4-4102-95cc-6fff9ee4b4b1"
            break
        case downloadE:
            url = "https://firebasestorage.googleapis.com/v0/b/smne-development.appspot.com/o/algorithm-e.pdf?alt=media&token=9077ce1f-50a4-4ffa-8c36-65b3d8dce8b2"
            break
        case downloadF:
            url = "https://firebasestorage.googleapis.com/v0/b/smne-development.appspot.com/o/algorithm-f.pdf?alt=media&token=735ef045-8c26-433f-933c-41b7310105f0"
            break
        default:
            url = "https://firebasestorage.googleapis.com/v0/b/smne-development.appspot.com/o/algorithm.pdf?alt=media&token=f13aa6c9-1e10-4bb8-b4bd-efa422de357f"
            break
        }
        guard let destination = segue.destination as? ViewControllerPDFViewer else { return }
        destination.url = url
    }
    
}

