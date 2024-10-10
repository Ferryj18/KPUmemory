//
//  ListLabel.swift
//  KPUmemory
//
//  Created by Ferry jati on 27/08/23.
//

import UIKit

class ListLabel: UIView {
  @IBOutlet weak var lblTitle: UILabel!
 
  @IBOutlet weak var lblDetail: UILabel!
  
    static let shared = ListLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    //MARK: - function ToolbarView
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func setUpView(){
        guard let view = self.loadViewFromNib(nibName: "ListLabel") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
        
    }
    
    func setDetail(_ text: String, _ detail: String){
        lblTitle.text = ("\(text) :")
        lblDetail.text = detail
    }
    
    func setTitle(_ text: String){
        lblDetail.isHidden = true
        lblTitle.text = text
    }
    
   



}
