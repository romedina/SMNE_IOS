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
    func endAnimationWith(handler: @escaping ()->Void)
    func endAnimationWith(error: String, completion: @escaping () -> Void)
}

class ViewControllerPillAnimation: UIViewController {

    
    @IBOutlet weak var animationView: AnimationView!
    var anim: AnimationView?
    var animationName: String?
    
    enum AnimationEnum: String {
        case loading = "loading"
        case treatment = "fin__tratamiento"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        anim = .init(name: "loading")
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
    
    func setAnim(type: AnimationEnum) {
        switch type {
        case .loading:
            animationName = type.rawValue
            break
        case .treatment:
            animationName = type.rawValue
            break
        }
    }
}

extension ViewControllerPillAnimation: EndPillAnimationProtocol {
    func endAnimationWith(handler: @escaping () -> Void) {
        self.dismiss(animated: true) {
            self.anim?.stop()
            handler()
        }
    }
    
    
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
