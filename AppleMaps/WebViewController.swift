//
//  WebViewController.swift
//  AppleMaps
//
//  Created by Aditya Narayan on 2/28/17.
//
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView? = nil
    
    var selectedAnnotation: CustomAnnotation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let theConfig = WKWebViewConfiguration()
        self.webView = WKWebView(frame: self.view.frame, configuration: theConfig)
        
        
        
        let url = self.selectedAnnotation?.url
        let request = URLRequest(url: url!)
        
        _ = self.webView?.load(request)
        self.view.addSubview(self.webView!)
        
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/9)
        let backButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.buttonPressed))
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        let buttons = [backButton, fixedSpace]
        
        toolBar.setItems(buttons, animated: false)
        self.webView?.addSubview(toolBar)
        
    }

    func buttonPressed(){
        
        
        
        self.dismiss(animated: true) { 
            
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
