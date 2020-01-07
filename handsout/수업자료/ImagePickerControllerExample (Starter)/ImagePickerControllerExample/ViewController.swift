//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit
import MobileCoreServices

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction private func pickImage(_ sender: Any) {
        print("\n---------- [ pickImage ] ----------\n")
        //    imagePicker.sourceType = .savedPhotosAlbum
        //    imagePicker.sourceType = .photoLibrary
        //    imagePicker.sourceType = .camera
        present(imagePicker, animated: true)
    }
    
    
    @IBAction private func takePicture(_ sender: Any) {
        print("\n---------- [ takePicture ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        // ["public.image"]
        // imagePicker.sourceType = .camera
        
        // ["public.image", "public.movie"]
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
        imagePicker.mediaTypes = mediaTypes ?? []
        //    imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        
        
        present(imagePicker, animated: true)
    }
    
    @IBAction private func takePictureWithDelay(_ sender: Any) {
        print("\n---------- [ takePictureWithDelay ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeImage as String]
        
        // 딜레이 촬영
        present(imagePicker, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.imagePicker.takePicture()
            })
        }
    }
    
    
    @IBAction private func recordingVideo(_ sender: Any) {
        print("\n---------- [ recordingVideo ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        // Movie 소리포함, Video 영상
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        imagePicker.cameraCaptureMode = .video
        //        imagePicker.cameraDevice = .rear
        
        present(imagePicker, animated: true)
        //        imagePicker.startVideoCapture()
        //        imagePicker.stopVideoCapture()
        imagePicker.videoQuality = .typeHigh
    }
    
    @IBAction private func toggleAllowsEditing(_ sender: Any) {
        print("\n---------- [ toggleAllowsEditing ] ----------\n")
        imagePicker.allowsEditing.toggle()
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedtImage = info[.editedImage] as? UIImage
            let selectedImage = editedtImage ?? originalImage
            imageView.image = selectedImage
            
            if picker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            }
        }
            
        else if UTTypeEqual(mediaType, kUTTypeMovie) {
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path,
                UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
            }
            
        }
        
        picker.dismiss(animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel")
    }
}
