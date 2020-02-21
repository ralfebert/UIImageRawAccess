import UIKit

let image = UIImage(named: "rgb.png")!

guard let cgImage = image.cgImage, let data = cgImage.dataProvider?.data, let bytes = CFDataGetBytePtr(data) else {
    fatalError("Couldn't access image data")
}
assert(cgImage.colorSpace?.model == .rgb)

let bytesPerPixel = cgImage.bitsPerPixel / cgImage.bitsPerComponent
for y in 0 ..< cgImage.height {
    for x in 0 ..< cgImage.width {
        let offset = (y * cgImage.bytesPerRow) + (x * bytesPerPixel)
        let components = (r: bytes[offset], g: bytes[offset + 1], b: bytes[offset + 2])
        print("[x:\(x), y:\(y)] \(components)")
    }
    print("---")
}
