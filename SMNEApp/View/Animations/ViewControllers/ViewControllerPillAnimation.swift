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
        if animationName == nil {
            return
        }
        anim = .init(name: animationName!)
        anim?.loopMode = .loop
        anim?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(anim!)
        anim?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        anim?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if animationName == "loading" {
            anim?.widthAnchor.constraint(equalToConstant: 180).isActive = true
            anim?.heightAnchor.constraint(equalToConstant: 180).isActive = true
        } else {
            anim?.widthAnchor.constraint(equalToConstant: 300).isActive = true
            anim?.heightAnchor.constraint(equalToConstant: 450).isActive = true
            self.view.backgroundColor = .C00D9CC()
        }
        anim?.play(completion: { (flag) in
            if flag {
                self.dismiss(animated: true, completion: nil)
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
