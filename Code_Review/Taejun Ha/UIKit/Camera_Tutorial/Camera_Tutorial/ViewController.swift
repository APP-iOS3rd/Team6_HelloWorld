//
//  ViewController.swift
//  Camera_Tutorial
//
//  Created by Taejun Ha on 11/24/23.
//

import UIKit

import MobileCoreServices
import UniformTypeIdentifiers

import AVKit
import AVFoundation

// UINavigationControllerDelegate는 카메라 화면으로 넘어갔다가 다시 돌아와야 하니 한거임
class ViewController: UIViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
  
    @IBOutlet var imageView: UIImageView!
    
    var newMedia: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func useCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            
            newMedia = true
        }
    }
    
    @IBAction func useCameraRoll(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
            
            newMedia = false
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // UIImagePickerController.InfoKey.mediaType
        let mediaType = info[.mediaType] as! NSString
        
        self.dismiss(animated: true, completion: nil)
        
        if mediaType.isEqual(to: UTType.image.identifier) {
            let image = info[.originalImage] as! UIImage
            
            imageView.image = image
            
            // 카메라로 촬영했을 때는 새로운 사진이니까 그걸 앨범에 저장하는거임
            if newMedia ?? false {
                // 오류가 발생하면 경고 상자를 통해 사용자에게 보고하고 싶은 경우
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.image(image: didFinishSavingWithError:contextInfo:)), nil)
                
                // 이렇게 #selector도 nil로 줘도 됨 강사님은 에러메시지를 가져와서 출력해주고 싶어서 nil로 안 한거임
                // UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
            }
        }
    }
    
    // 오류가 발생하면 경고 상자를 통해 사용자에게 보고
    @objc private func image(image: UIImage,
                             didFinishSavingWithError error: NSErrorPointer,
                             contextInfo: UnsafeRawPointer) {
        
        if error != nil {
            let alert = UIAlertController(title: "Save Failed", message: "Failed to save image", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AVPlayerViewController
//        let url = URL(string: "https://www.youtube.com/watch?v=d5DsQ-f2LQg")
        let url = URL(string: "https://www.ebookfrenzy.com/ios_book/movie/movie.mov")
        
        if let movieURL = url {
            destination.player = AVPlayer(url: movieURL)
        }
    }
}


