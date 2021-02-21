//
//  ViewControllerNPPageView.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 29/01/21.
//

import UIKit

class ViewControllerNPPageView: UIPageViewController {
    
    lazy var subViewControllers: [UIViewController] = {
        return [
            UIStoryboard(name: "NewPatient", bundle: nil).instantiateViewController(withIdentifier: "S1") as! TableViewControllerNewPatient_S1,
            UIStoryboard(name: "NewPatient", bundle: nil).instantiateViewController(withIdentifier: "S2") as! TableViewControllerNewPatient_S2,
            UIStoryboard(name: "NewPatient", bundle: nil).instantiateViewController(withIdentifier: "S3") as! TableViewControllerNewPatient_S3,
            UIStoryboard(name: "NewPatient", bundle: nil).instantiateViewController(withIdentifier: "S4") as! TableViewControllerNewPatient_S4,
            UIStoryboard(name: "NewPatient", bundle: nil).instantiateViewController(withIdentifier: "S5") as! TableViewControllerNewPatient_S5,
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = nil
        delegate = self
        setViewControllerFromIndex(index: 0)
    }
    
    
    func setViewControllerFromIndex(index:Int) {
        self.setViewControllers([subViewControllers[index]], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
    }

}

extension ViewControllerNPPageView: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0 {
            
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count - 1 {
            
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
    
}
