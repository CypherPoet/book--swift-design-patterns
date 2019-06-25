import UIKit

/**
    Demonstrating the facade pattern by recreating the ability of a
    `UIColor` instance to hold colors or images -- without users knowing which is which
    during its use.
 
    One example usage: assigning a `UIColor` instance to a view's background image,
    regardless of whether the instance is a color or an image.
 */

struct ImageOrColor {
    private var image: UIImage?
    private var color: UIColor?
    
    
    init(image: UIImage) {
        self.image = image
    }
    
    init(color: UIColor) {
        self.color = color
    }
}


extension ImageOrColor {
    
    func fill(rect: CGRect, in context: UIGraphicsImageRendererContext) {
        if let image = image {
            image.draw(in: rect)
            
        } else if let color = color {
            color.setFill()
            context.fill(rect)
        }
    }
}


let rect = CGRect(x: 0, y: 0, width: 512, height: 256)
let pinkContainer = ImageOrColor(color: UIColor.systemPink)
let renderer = UIGraphicsImageRenderer(bounds: rect)

let finalImage = renderer.image { (context) in
    pinkContainer.fill(rect: rect, in: context)
}

finalImage
