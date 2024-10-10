//
//  FormEntryVC.swift
//  KPUmemory
//
//  Created by Ferry jati on 28/08/23.
//

import UIKit
import Photos
import AVFoundation
class FormEntryVC: UIViewController {
  
  @IBOutlet weak var navigationBar: NavigationBar!
  
  @IBOutlet weak var vwNIK: InputTextField!
  
  
  @IBOutlet weak var vwName: InputTextField!
  
  @IBOutlet weak var vwPhoneNumber: InputTextField!
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  
  @IBOutlet weak var vwDate: InputTextField!
  
  
  @IBOutlet weak var vwAddress: InputTextField!
  
  @IBOutlet weak var btnSelMale: UIButton!
  
  @IBOutlet weak var imgSelMale: UIImageView!
  
  @IBOutlet weak var lblMale: UILabel!
  
  
  @IBOutlet weak var btnSelFemale: UIButton!
  
  @IBOutlet weak var imgSelFemale: UIImageView!
  
  @IBOutlet weak var lblFemale: UILabel!
  
  
  @IBOutlet weak var btnShowLocation: UIButton!
  
  
  @IBOutlet weak var lblImage: UILabel!
  
  @IBOutlet weak var imgView: UIImageView!
  
  
  @IBOutlet weak var btnCapture: UIButton!
  
  @IBOutlet weak var btnSelectFile: UIButton!
  
  
  @IBOutlet weak var btnSubmit: UIButton!
  // Variabel untuk status
  var presenter: VTPFormEntryProtocol?
  var maps = PopUpMaps()
  
  var isMale = false
  var isFemale = false
  
  var nik: String?
  var name: String?
  var phoneNumb: String?
  var date: String?
  var address: String?
  var gender: String?
  var imageData: String?
  var isInputted = false
  
  var data = formEntryModel()

  override func viewDidLoad() {
      super.viewDidLoad()
      setUpView()
      setUpAction()
      setUpData()
     
  }
  //Mengatur Tampilan Aplikasi
  func setUpView(){
      self.navigationController?.isNavigationBarHidden = true
      navigationBar.setTitle("Formulir")
      navigationBar.delegate = self
      vwNIK.setText("", "NIK")
      vwName.setText("", "Name")
      vwPhoneNumber.setText("", "No Telp")
      vwDate.setText("", "Tempat Tanggal Lahir")
      vwAddress.setText("", "Alamat")
      
      btnSelMale.setTitle("", for: .normal)
      btnSelFemale.setTitle("", for: .normal)
      
      imgSelMale.image = UIImage(named: "Off")
      imgSelFemale.image = UIImage(named: "Off")
      
      lblMale.text = "Laki-Laki"
      lblFemale.text = "Perempuan"
      
      btnShowLocation.setTitle("Cek Lokasi", for: .normal)
    btnShowLocation.tintColor = .white
    btnShowLocation.backgroundColor = .systemOrange
    
      btnCapture.setTitle("Ambil Foto", for: .normal)
      btnCapture.tintColor = .white
      btnCapture.backgroundColor = .systemOrange
      btnCapture.layer.cornerRadius = 10
      btnSelectFile.setTitle("Pilih Foto", for: .normal)
      btnSelectFile.tintColor = .white
      btnSelectFile.backgroundColor = .systemOrange
      btnSelectFile.layer.cornerRadius = 10
      
      lblImage.text = "Gambar"
      
      btnSubmit.setTitle("Simpan", for: .normal)
      btnSubmit.tintColor = .white
      btnSubmit.backgroundColor = .systemOrange
      btnSubmit.layer.cornerRadius = 20
      
      
  }
  // mengatur defenisi fungsi Tombol
  func setUpAction(){
      btnSelMale.addTarget(self, action: #selector(male), for: .touchUpInside)
      btnSelFemale.addTarget(self, action: #selector(female), for: .touchUpInside)
      btnShowLocation.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)
      btnCapture.addTarget(self, action: #selector(capture), for: .touchUpInside)
      btnSelectFile.addTarget(self, action: #selector(selectFile), for: .touchUpInside)
      if isInputted == false {
          btnSubmit.addTarget(self, action: #selector(submit), for: .touchUpInside)
      } else if isInputted == true {
          btnSubmit.addTarget(self, action: #selector(updateData), for: .touchUpInside)
      }
      
  }
  
  func setUpData(){
      if let navigation = navigationController{
          presenter?.startReadData(nav: navigation)
      }
  }
  // Metode yang dipanggil saat tombol ditekan
  
  @objc func male(){
      if isMale == false {
          isMale = true
          isFemale = false
          imgSelMale.image = UIImage(named: "On")
          imgSelFemale.image = UIImage(named: "Off")
          gender = "Laki-Laki"
          print(gender)
      }
      
  }
  
  @objc func female(){
      if isFemale == false {
          isMale = false
          isFemale = true
          imgSelMale.image = UIImage(named: "Off")
          imgSelFemale.image = UIImage(named: "On")
          gender = "Perempuan"
          print(gender)
      }
      
  }
  
  @objc func selectLocation(){
      maps.modalPresentationStyle = .overCurrentContext
      maps.delegate = self
      self.present(maps, animated: true)
  }
  
  @objc func capture(){
      if UIImagePickerController.isSourceTypeAvailable(.camera) {
          let imagePicker = UIImagePickerController()
          imagePicker.delegate = self
          imagePicker.sourceType = .camera
          present(imagePicker, animated: true, completion: nil)
      } else {
          print("Camera not available.")
      }
  }
  
  @objc func selectFile(){
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .photoLibrary
      present(imagePicker, animated: true, completion: nil)
      
  }
  
  @objc func submit(){
      nik = vwNIK.getEnteredText()
      name = vwName.getEnteredText()
      date = vwDate.getEnteredText()
      address = vwAddress.getEnteredText()
      phoneNumb = vwPhoneNumber.getEnteredText()
      
      data.nik = nik
      data.name = name
      data.date = date
      data.gender = gender
      data.address = address
      data.phoneNumb = phoneNumb
      data.image = imageData
      
      if let navigation = navigationController {
          presenter?.startFetchData(data: data, nav: navigation)
      }
  }
  
  @objc func updateData(){
      nik = vwNIK.getEnteredText()
      name = vwName.getEnteredText()
      date = vwDate.getEnteredText()
      address = vwAddress.getEnteredText()
      phoneNumb = vwPhoneNumber.getEnteredText()
      
      data.nik = nik
      data.name = name
      data.date = date
      data.address = address
      data.phoneNumb = phoneNumb
      data.gender = gender
      data.image = imageData
      print(gender)
      
      if let navigation = navigationController {
          presenter?.startUpdateData(data: data, nav: navigation)
      }
  }


 
}

extension FormEntryVC: PTVFormEntryProtocol{
  func success(message: String) {
      Alert.showGeneralAlert(title: "Success", message: message, viewController: self)
  }
  
  func failed(message: String) {
      Alert.showGeneralAlert(title: "Failed", message: message, viewController: self)
  }
  
  func alreadyInput(data: formEntryModel) {
      nik = data.nik
      name = data.name
      phoneNumb = data.phoneNumb
      date = data.date
      address = data.address
      gender = data.gender
      imageData = data.image
      isInputted = data.inputted ?? true
      
      vwNIK.setInputText(text: nik ?? "")
      vwName.setInputText(text: name ?? "")
      vwPhoneNumber.setInputText(text: phoneNumb ?? "")
      vwDate.setInputText(text: date ?? "")
      vwAddress.setInputText(text: address ?? "")
      print(gender)
      if gender == "Laki-Laki" {
          isMale = true
          isFemale = false
          imgSelMale.image = UIImage(named: "On")
          imgSelFemale.image = UIImage(named: "Off")
      } else if gender == "Perempuan" {
          isMale = false
          isFemale = true
          imgSelMale.image = UIImage(named: "Off")
          imgSelFemale.image = UIImage(named: "On")
      }
      
      if let stringToImage = stringToImage(imageData ?? "") {
          imgView.image = stringToImage
      }
      
      
      
  }
  
  func notInput() {
      print("OK")
  }
  
  
  
}

extension FormEntryVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
      
      if let selectedImage = info[.originalImage] as? UIImage {
          imageData = imageToString(selectedImage)
          imgView.image = selectedImage
          if let image = imgView.image {
              if let base64String = imageToString(imgView.image!) {
                  imageData = base64String
              } else {
                  Alert.showGeneralAlert(title: "Error", message: "Failed to Convert Image", viewController: self)
              }
          } else {
              Alert.showGeneralAlert(title: "Error", message: "No Image to Convert", viewController: self)
          }
      }
      picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      picker.dismiss(animated: true, completion: nil)
  }
}

extension FormEntryVC: NavigationBarDelegate, PopUpMapsDelegate{
  func pressBack() {
      self.navigationController!.popViewController(animated: true)
  }
  
  func actConfirm(loc: String) {
      address = loc
      vwAddress.setInputText(text: loc)
      self.dismiss(animated: true)
  }
  
  func actBack() {
      self.dismiss(animated: true)
  }
  
  
  
}
