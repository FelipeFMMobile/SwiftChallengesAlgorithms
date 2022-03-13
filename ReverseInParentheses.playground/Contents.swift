import XCTest

/*
 Write a function that reverses characters in (possibly nested) parentheses in the input string.

 Input strings will always be well-formed with matching ()s.

 Example

 For inputString = "(bar)", the output should be
 solution(inputString) = "rab";
 For inputString = "foo(bar)baz", the output should be
 solution(inputString) = "foorabbaz";
 For inputString = "foo(bar)baz(blim)", the output should be
 solution(inputString) = "foorabbazmilb";
 For inputString = "foo(bar(baz))blim", the output should be
 solution(inputString) = "foobazrabblim".
 Because "foo(bar(baz))blim" becomes "foo(barzab)blim" and then "foobazrabblim".
 Input/Output

 [execution time limit] 6 seconds (swift)

 [input] string inputString

 A string consisting of lowercase English letters and the characters ( and ). It is guaranteed that all parentheses in inputString form a regular bracket sequence.

 Guaranteed constraints:
 0 ≤ inputString.length ≤ 50.

 [output] string

 Return inputString, with all the characters that were in parentheses reversed.
 
 */

func solution(inputString: String) -> String {
    let open: Character = "("
    let close: Character = ")"
    guard inputString.count > 0 else { return "" }
    //foo(bar(baz))blim
    //foo(bar(baz))blim
    // O(n2) = O(len(reverseBuffer(input)) | Space O(n)
    func reverseBuffer(_ input: [Character], _ opened: Bool = false) -> String {
        let openIndex = input.firstIndex(where: { $0 == open }) ?? -1
        let closeIndex = input.firstIndex(where: { $0 == close }) ?? -1
        if openIndex == -1 && closeIndex == -1 { return String(input) }
        //print(String(input))
        if openIndex >= 0 && openIndex < closeIndex {
            let leftString = String(input.prefix(openIndex))
            let ritghString = Array(input.dropFirst(openIndex + 1))
            if closeIndex >= 0 {
                return reverseBuffer(Array(leftString + reverseBuffer(ritghString)))
            }
            return leftString + reverseBuffer(ritghString, false)
        }
        if closeIndex >= 0 {
            let leftString = String(input.prefix(closeIndex)).reversed()
            let ritghString = Array(input.dropFirst(closeIndex + 1))
            return leftString + String(ritghString)
        }
        return String(input)
   }
    return reverseBuffer(Array(inputString))
}

//XCTAssertEqual(solution(inputString: "(bar)"), "rab")
XCTAssertEqual(solution(inputString: "foo(bar(baz))blim"), "foobazrabblim")
//XCTAssertEqual(solution(inputString: "(abc)d(efg)"), "cbadgfe")
//XCTAssertEqual(solution(inputString: "foo(bar)baz(blim)"), "foorabbazmilb")
