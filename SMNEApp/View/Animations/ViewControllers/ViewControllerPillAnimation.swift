//
//  ViewControllerPillAnimation.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/03/21.
//

import UIKit
import Lottie

protocol EndPillAnimationProtocol {
    func endAnimation()
    func endAnimationWith(error: String, completion: @escaping () -> Void)
}

class ViewControllerPillAnimation: UIViewController {

    
    @IBOutlet weak var animationView: AnimationView!
    var anim: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anim = .init(name: "coffee")
        anim?.frame = view.bounds
        anim?.loopMode = .loop
        view.addSubview(anim!)
        anim?.play(completion: { (flag) in
            if flag {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Usuario cerró")
            }
        })
    }
}

extension ViewControllerPillAnimation: EndPillAnimationProtocol {
    
    func endAnimation() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyBoard.instantiateViewController(withIdentifier: "init")
        viewcontroller.modalPresentationStyle = .fullScreen
        self.present(viewcontroller, animated: true) {
            self.anim?.stop()
        }
    }
    
    func endAnimationWith(error: String, completion: @escaping () -> Void) {
        anim?.stop()
        
        self.dismiss(animated: true) {
            completion()
        }
    }
}
