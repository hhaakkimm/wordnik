//
//  WordnikPageVC.swift
//  wordnik
//
//  Created by Abdulkhakim Abdrakhman on 14.06.16.
//  Copyright © 2016 Abdulkhakim Abdrakhman. All rights reserved.
//

import UIKit

class WordnikPageVC: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        if (wordsArray.first != nil) {
            setViewControllers([newContentVC(0)], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        }
        
        let pageControl: UIPageControl! = UIPageControl()
        pageControl.frame = CGRectZero
        pageControl.currentPage = 0
        pageControl.numberOfPages = wordsArray.count
        pageControl.tintColor = UIColor.blackColor()
        self.view.addSubview(pageControl)
        //self.navigationItem.titleView = pageControl
    }
    
    var wordsArray : [String]!
    
    func newContentVC(index : Int) -> ContentVC {
        let contentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ContentVC") as! ContentVC
        contentVC.synonim = wordsArray[index]
        contentVC.index = index
        return contentVC
    }
}

extension WordnikPageVC : UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! ContentVC
        let nextIndex = contentVC.index + 1
        let maxIndex = wordsArray.count
        guard nextIndex < maxIndex  else {
            return nil
        }
        return newContentVC(nextIndex)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let contencVC = viewController as! ContentVC
        let previousIndex = contencVC.index - 1
        guard previousIndex >= 0  else {
            return nil
        }
        return newContentVC(previousIndex)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return wordsArray.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first as? ContentVC,
            firstViewControllerIndex = firstViewController.index else {
                return 0
        }
        
        return firstViewControllerIndex
    }
}