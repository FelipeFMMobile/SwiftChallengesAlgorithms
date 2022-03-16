import XCTest

/*
 Given a string, find out if its characters can be rearranged to form a palindrome.

 Example

 For inputString = "aabb", the output should be
 solution(inputString) = true.

 We can rearrange "aabb" to make "abba", which is a palindrome.
 
 
 A string that doesn't changed when reversed (it reads the same backward and forward).

 Examples:

 "eye" is a palindrome
 "noon" is a palindrome
 "decaf faced" is a palindrome
 "taco cat" is not a palindrome (backwards it spells "tac ocat")
 "racecars" is not a palindrome (backwards it spells "sracecar")
 
 
 */

func solution(inputString: String) -> Bool {
    var chars: [Character] = []
    for c in inputString {
        if chars.contains(c) {
            chars.removeAll(where: { $0 == c })
            continue
        }
        chars.append(c)
    }
    return chars.count <= 1
}

class TestCase: XCTestCase {
    
    func testSolution() {
        XCTAssertEqual(solution(inputString: "abbcabb"), true)
        XCTAssertEqual(solution(inputString: "babcbab"), true)
        XCTAssertEqual(solution(inputString: "abbcabb"), true)
        XCTAssertEqual(solution(inputString: "abcad"), false)
    }
}

TestCase.defaultTestSuite.run()
