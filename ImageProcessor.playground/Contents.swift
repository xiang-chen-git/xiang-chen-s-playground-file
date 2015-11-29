//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")


class ImageProcessing {
    let image: RGBAImage
    
    init(image: UIImage) {
        self.image = RGBAImage(image: image)!
    }
    
    func processing(filters: [String]) {
        for filter in filters {
            switch filter {
            case "changeRed":
                self.changeRed()
            case "changeGreen":
                self.changeGreen()
            case "filterBlue":
                self.changeBlue()
            case "halfBrightness":
                self.halfBrightness()
            case "doubleBrightness":
                self.doubleBrightness()
            default:
                print("The Filter you specified doesn't exist.")
            }
        }
    }
    
    func changeRed(value: UInt8 = 0) {
        for y in 0..<self.image.height {
            for x in 0..<self.image.width {
                let index = y * self.image.width + x
                var pixel = self.image.pixels[index]
                pixel.red = value;
                self.image.pixels[index] = pixel
            }
        }
    }
    
    func changeGreen(value: UInt8 = 0) {
        for y in 0..<self.image.height {
            for x in 0..<self.image.width {
                let index = y * self.image.width + x
                var pixel = self.image.pixels[index]
                pixel.green = value;
                self.image.pixels[index] = pixel
            }
        }
    }
    
    func changeBlue(value: UInt8 = 0) {
        for y in 0..<self.image.height {
            for x in 0..<self.image.width {
                let index = y * self.image.width + x
                var pixel = self.image.pixels[index]
                pixel.blue = value;
                self.image.pixels[index] = pixel
            }
        }
    }
    
    func halfBrightness() {
        for y in 0..<self.image.height {
            for x in 0..<self.image.width {
                let index = y * self.image.width + x
                var pixel = self.image.pixels[index]
                pixel.red /= 2
                pixel.green /= 2
                pixel.blue /= 2
                self.image.pixels[index] = pixel
            }
        }
    }
    
    func doubleBrightness(){
        for y in 0..<self.image.height {
            for x in 0..<self.image.width {
                let index = y * self.image.width + x
                var pixel = self.image.pixels[index]
                pixel.red = UInt8(max(min(255, Int(pixel.red) * 2), 0))
                pixel.green = UInt8(max(min(255, Int(pixel.green) * 2), 0))
                pixel.blue = UInt8(max(min(255, Int(pixel.blue) * 2), 0))
                self.image.pixels[index] = pixel
            }
        }
    }
    
    func toUIImage() -> UIImage {
        return self.image.toUIImage()!
    }
}

let imageProcessing = ImageProcessing(image: image!)
let filters = ["changeRed", "halfBrightness"]
imageProcessing.processing(filters)
let newImage = imageProcessing.toUIImage()
