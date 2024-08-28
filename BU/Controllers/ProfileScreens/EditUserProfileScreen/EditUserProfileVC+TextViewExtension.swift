//
//  EditUserProfileVC+TextViewExtension.swift
//  BU
//
//  Created by Aman Kumar on 09/02/21.
//

import Foundation
import UIKit
//MARK: - Textview delegates
extension EditUserProfileVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == AppColor.darkGrayColor {
            textView.font = AppFont.Regular.size(AppFontName.Montserrat, size: 15)
            textView.text = nil
            textView.textColor = AppColor.app_theame_color
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.font = AppFont.Italic.size(AppFontName.Montserrat, size: 15)
            textView.text = ConstantTexts.WriteCommentNewPH
            textView.textColor = AppColor.darkGrayColor
        }
    }
    
}

