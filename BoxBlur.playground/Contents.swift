import XCTest

/*
 Last night you partied a little too hard. Now there's a black and white photo of you that's about to go viral! You can't let this ruin your reputation, so you want to apply the box blur algorithm to the photo to hide its content.
 https://en.wikipedia.org/wiki/Box_blur
 The pixels in the input image are represented as integers. The algorithm distorts the input image in the following way: Every pixel x in the output image has a value equal to the average value of the pixel values from the 3 × 3 square that has its center at x, including x itself. All the pixels on the border of x are then removed.

 Return the blurred image as an integer, with the fractions rounded down.
 */

/*
[
[7, 4, 0, 3],
[5, 6, 2, 2],
[6, 10, 7, 1],
[1, 4, 2, 0],
[1, 4, 2, 12]
]
*/

// 3x3 Box
struct Box {
    var matrix: [[Int]]
}

func solution(image: [[Int]]) -> [[Int]] {
    // find how many 3x3 box in matrix
    var boxes: [Box] = []
    var result: [[Int]] = []
    let maxColumCount = image.first?.count ?? 0
    let totalBoxes = image.count - 3 + 1
    let totalLarge = image[0].count - 3 + 1
    for colum in 0..<totalLarge {
        for index in 0..<totalBoxes {
            let pos = colum + 3
            let box = Box(matrix: [
                Array(image[index][colum..<pos]),
                Array(image[index + 1][colum..<pos]),
                Array(image[index + 2][colum..<pos]),
            ])
            boxes.append(box)
            if colum == 0 {
                result.append([blurPixel(box:box.matrix)])
            } else {
                result[index].append(blurPixel(box:box.matrix))
            }
        }
    }
    //print(boxes.debugDescription)
    //print(totalBoxes)
    //print(totalLarge)
    return result
}

func blurPixel(box: [[Int]]) -> Int {
    let matrixSize: Int = 9
    let middlePixel: Int = box.reduce(into: 0, { result, value in
        result += value.reduce(0, +)
    })
    //print(middlePixel)
    //print(middlePixel / matrixSize)
    return middlePixel / matrixSize
}

class TestCase: XCTestCase {
    
    func testSolution() {
        XCTAssertEqual(solution(image: [[1,1,1],
                                       [1,7,1],
                                       [1,1,1]]), [[1]])
        XCTAssertEqual(solution(image: [[7,4,0,1],
                                        [5,6,2,2],
                                        [6,10,7,8],
                                        [1,4,2,0]]), [[5,4],
                                                     [4,4]])
        XCTAssertEqual(solution(image: [[36,0,18,9,9,45,27],
                                              [27,0,254,9,0,63,90],
                                              [81,255,72,45,18,27,0],
                                              [0,0,9,81,27,18,45],
                                              [45,45,227,227,90,81,72],
                                              [45,18,9,255,9,18,45],
                                              [27,81,36,127,255,72,81]]), [[82,73,48,25,31],
                                                                           [77,80,57,32,32],
                                                                           [81,106,88,68,42],
                                                                           [44,96,103,89,45],
                                                                           [59,113,137,126,80]])
        XCTAssertEqual(solution(image: [[36,0,18,9],
                                        [27,54,9,0],
                                        [81,63,72,45]]), [[40,30]])
    }
}
TestCase.defaultTestSuite.run()
