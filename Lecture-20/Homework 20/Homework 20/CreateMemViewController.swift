//
//  CreateMemViewController.swift
//  Homework 20
//
//  Created by Vyacheslav Pronin on 02.08.2021.
//

import Foundation
import UIKit
import CoreImage

final class CreateMemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
 

    private var imageViewHeightConstraint: NSLayoutConstraint?
    private var imageViewWidthConstraint: NSLayoutConstraint?
    private let screenSize = UIScreen.main.bounds
    private var standartImage: UIImage?
    private var filterApplied = false
    
    private lazy var saveItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "save"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(saveMeme))
    private lazy var addImageItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "image"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addImage))
    
    private lazy var blackAndWhiteFilterItem: UIBarButtonItem = UIBarButtonItem(title: "ч/б фильтр",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(convertToGrayScale))
    private let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.textColor = .textColor
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Al Nile", size: 20)
        textView.showsVerticalScrollIndicator = false
        textView.text = "Вбейте текст"
        textView.sizeToFit()
        textView.textContainer.maximumNumberOfLines = 3
        return textView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.layer.borderColor = UIColor.textColor.cgColor
        imageView.layer.borderWidth = 6
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        view.backgroundColor = .standartColor
        self.navigationItem.rightBarButtonItems = [saveItem, addImageItem, blackAndWhiteFilterItem]
        [backgroundView, imageView, textView].forEach{ view.addSubview($0)}
        
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 0)
        imageViewWidthConstraint = imageView.widthAnchor.constraint(equalToConstant: 0)
        imageViewHeightConstraint?.isActive = true
        imageViewWidthConstraint?.isActive = true
    }
    
    @objc
    private func keyboardWillHide() {
            self.view.frame.origin.y = 0
    }

    @objc
    private func keyboardWillChange(notification: NSNotification) {

        if self.view.frame.origin.y == 0 {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if textView.isFirstResponder {
                    self.view.frame.origin.y = -keyboardSize.height
                }
            }
        }
    }
    
    @objc
    private func saveMeme() {
        guard  imageView.image != nil else { return }
        let image = self.view.asImage()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc
    private func addImage() {
        let alert = UIAlertController(title: "Выбрать изображение", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in self.openCamera() }))
        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in self.openGallery() }))
        alert.addAction(UIAlertAction.init(title: "Отмена", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController,
                                        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.originalImage] as? UIImage {
            
            imageViewHeightConstraint?.constant = pickedImage.size.height
            imageViewWidthConstraint?.constant = pickedImage.size.width
            
            //MARK: -- Могу использовтаь ! так как выше присвоил значение
            while (imageViewHeightConstraint!.constant >= backgroundView.frame.height || imageViewWidthConstraint!.constant >= backgroundView.frame.width) {
                imageViewHeightConstraint?.constant *= 0.98
                imageViewWidthConstraint?.constant *= 0.98
            }
            imageView.image = pickedImage
            standartImage = imageView.image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textView.heightAnchor.constraint(equalToConstant: 100),
            
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundView.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -30),

            imageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            self.view.endEditing(true)
            self.keyboardWillHide()
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension CreateMemViewController {
    
    @objc
    private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Ошибка сохранения", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Сохранено!", message: "Ваше измененное изображение было сохранено в ваших фотографиях.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    private func openGallery() {
       if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
           let imagePicker = UIImagePickerController()
           imagePicker.delegate = self
            imagePicker.isEditing = true
           imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
           self.present(imagePicker, animated: true, completion: nil)
       } else {
           let alert  = UIAlertController(title: "Осторожно", message: "У вас нет разрешения на доступ к галерее.", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
   }
    
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            imagePicker.isEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Осторожно", message: "У вас нет камеры.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc
    func convertToGrayScale() {
        guard let image = imageView.image else { return }
        
        if filterApplied {
            filterApplied = false
            imageView.image = standartImage
            return
        }
        
        filterApplied = true
        
        let imageRect:CGRect = CGRect(x:0, y:0, width:image.size.width, height: image.size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let width = image.size.width
        let height = image.size.height

        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(image.cgImage!, in: imageRect)
        let imageRef = context!.makeImage()

        let newImage = UIImage(cgImage: imageRef!)
        imageView.image = newImage
    }
}
