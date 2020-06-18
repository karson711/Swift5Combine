//
//  UITextFieldViewController.swift
//  SwiftControls
//
//  Created by jikun on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit

class UITextFieldViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "UITextField详解"
        self.view.backgroundColor = UIColor.white
        
        self.addSpecialField()
        
        let phoneTF = UITextField.init(frame: CGRect.init(x: 20, y: 200, width: UIScreen.main.bounds.size.width-40, height: 50))
        phoneTF.delegate = self
        self.view.addSubview(phoneTF)
        
        // 属性设置
        phoneTF.placeholder = "请输入手机号"
        //字体颜色
        phoneTF.textColor = UIColor.purple
        //字体大小
        phoneTF.font = UIFont.systemFont(ofSize: 16)
        //文字是否可以缩小，缩小到指定字号不再缩小
        phoneTF.adjustsFontSizeToFitWidth = true
        // 文字最小字号
        phoneTF.minimumFontSize = 12
        //设置是否加密模式
        phoneTF.isSecureTextEntry = true
        //记录之前输入的内容
        phoneTF.autocorrectionType = UITextAutocorrectionType.no
        
        //设置边框样式
        phoneTF.borderStyle = UITextField.BorderStyle.roundedRect
        /*
         phoneTF.borderStyle = UITextField.BorderStyle.none
         phoneTF.borderStyle = UITextField.BorderStyle.line
         phoneTF.borderStyle = UITextField.BorderStyle.bezel
         */
        
        // 文字内容对齐方式
        phoneTF.textAlignment = NSTextAlignment.left
        /*
         phoneTF.textAlignment = NSTextAlignment.left
         phoneTF.textAlignment = NSTextAlignment.right
         phoneTF.textAlignment = NSTextAlignment.justified
         phoneTF.textAlignment = NSTextAlignment.natural
         */
        
        // 内容水平对齐方式
        phoneTF.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        /*
         phoneTF.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
         phoneTF.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
         phoneTF.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.fill
         */
        
        //内容垂直对齐方式
        phoneTF.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        /*
         phoneTF.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
         phoneTF.contentVerticalAlignment = UIControl.ContentVerticalAlignment.bottom
         phoneTF.contentVerticalAlignment = UIControl.ContentVerticalAlignment.fill
         */
        
        // 设置返回按钮样式
        phoneTF.returnKeyType = UIReturnKeyType.done
        /*
         phoneTF.returnKeyType = UIReturnKeyType.default
         phoneTF.returnKeyType = UIReturnKeyType.go
         phoneTF.returnKeyType = UIReturnKeyType.google
         phoneTF.returnKeyType = UIReturnKeyType.join
         phoneTF.returnKeyType = UIReturnKeyType.next
         phoneTF.returnKeyType = UIReturnKeyType.route
         phoneTF.returnKeyType = UIReturnKeyType.search
         phoneTF.returnKeyType = UIReturnKeyType.send
         phoneTF.returnKeyType = UIReturnKeyType.yahoo
         */
        
        // 设置键盘样式
        phoneTF.keyboardType = UIKeyboardType.numberPad
        /*
         phoneTF.keyboardType = UIKeyboardType.default
         phoneTF.keyboardType = UIKeyboardType.asciiCapable
         phoneTF.keyboardType = UIKeyboardType.emailAddress
         phoneTF.keyboardType = UIKeyboardType.URL
         phoneTF.keyboardType = UIKeyboardType.numberPad
         phoneTF.keyboardType = UIKeyboardType.phonePad
         phoneTF.keyboardType = UIKeyboardType.namePhonePad
         */
        
        // 设置键盘风格
        phoneTF.keyboardAppearance = UIKeyboardAppearance.light
        /*
         phoneTF.keyboardAppearance = UIKeyboardAppearance.default
         phoneTF.keyboardAppearance = UIKeyboardAppearance.dark
         phoneTF.keyboardAppearance = UIKeyboardAppearance.alert
         */
        // 设置清除按钮
        phoneTF.clearButtonMode = UITextField.ViewMode.always
        /*
         phoneTF.clearButtonMode = UITextField.ViewMode.never
         phoneTF.clearButtonMode = UITextField.ViewMode.whileEditing
         phoneTF.clearButtonMode = UITextField.ViewMode.unlessEditing
         */
        
        //设置首字母是否大写
        phoneTF.autocapitalizationType = UITextAutocapitalizationType.none
        /*
         phoneTF.autocapitalizationType = UITextAutocapitalizationType.words
         phoneTF.autocapitalizationType = UITextAutocapitalizationType.sentences
         phoneTF.autocapitalizationType = UITextAutocapitalizationType.allCharacters
         */
        //设置输入框左侧头像
        let hadeimage = UIImageView.init(frame:CGRect(x:10, y:10, width:30, height:30))
        hadeimage.image = UIImage.init(named: "cellPhoneImage")
        phoneTF.leftView = hadeimage;
        
        //设置左侧视图模式
        phoneTF.leftViewMode = UITextField.ViewMode.always;
        /*
         textField.leftViewMode = UITextField.ViewMode.whileEditing;
         textField.leftViewMode = UITextField.ViewMode.unlessEditing;
         textField.leftViewMode = UITextField.ViewMode.none;
         */
    }
    
    //下划线UITextField
    func addSpecialField() {
        let textField = UITextField(frame: CGRect(x: 50, y: 100, width: 300, height: 25))
        
        //弄一个和输入框一样宽的View
        let line = UIView(frame: CGRect(x: 0, y: textField.frame.size.height - 1, width: textField.frame.size.width, height: 0.5))
        
        line.backgroundColor = UIColor.red
        
        //关键是添加到输入框中去
        textField.addSubview(line)
        
        self.view.addSubview(textField)
    }

}

extension UITextFieldViewController:UITextFieldDelegate{
    // MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //返回一个BOOL值，指定是否循序文本字段开始编辑
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出first responder
        //要想在用户结束编辑时阻止文本字段消失，可以返回NO
        //这对一些文本字段必须始终保持活跃状态的程序很有用，比如即时消息
        return false;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //开始编辑时触发，文本字段将成为first responder
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        //返回一个BOOL值指明是否允许根据用户请求清除内容
        //可以设置在特定条件下才允许清除内容
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
        //如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起[textField resignFirstResponder];
        //查一下resign这个单词的意思就明白这个方法了
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //当用户使用自动更正功能，把输入的文字修改为推荐的文字时，就会调用这个方法。
        //这对于想要加入撤销选项的应用程序特别有用
        //可以跟踪字段内所做的最后一次修改，也可以对所有编辑做日志记录,用作审计用途。
        //要防止文字被改变可以返回NO
        //这个方法的参数中有一个NSRange对象，指明了被改变文字的位置，建议修改的文本也在其中
        return true;
    }
}
