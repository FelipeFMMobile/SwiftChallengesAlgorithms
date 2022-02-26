import UIKit

/*
 You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order, and each of their nodes contains a single digit.
 Add the two numbers and return the sum as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    func addNext(_ l1: ListNode) -> ListNode {
        self.next = l1
        return l1
    }
}

//  [2, 4, 3] = 342  [ 5, 6, 4 ] = 465
//  807
//  Result [7, 0, 8]

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var decimalSum = 0
        var resultNode: ListNode?
        var currentNode: ListNode?
        var l1Next: ListNode? = l1
        var l2Next: ListNode? = l2
        while true {
            guard (l1Next != nil || l2Next != nil || decimalSum > 0) else { break }
            let currentSum = sumVal(l1Next,
                                    l2Next,
                                    decimalSum)
            var resultVal = currentSum
            if currentSum >= 10 {
                resultVal = currentSum - 10
                decimalSum = 1
            } else {
                decimalSum = 0
            }
            let thisNode = ListNode(resultVal)
            if resultNode == nil {
                resultNode = thisNode
                currentNode = thisNode
            } else {
                currentNode?.next = thisNode
                currentNode = thisNode
            }
            l1Next = l1Next?.next
            l2Next = l2Next?.next
        }
        
        return resultNode
    }
            
    func sumVal(_ l1: ListNode?, _ l2: ListNode?,
                _ decimalSum: Int) -> Int {
        let val1 = l1?.val ?? 0
        let val2 = l2?.val ?? 0
        return val1 + val2 + decimalSum
    }
}

var node1 = ListNode(2)
node1.addNext(ListNode(4)).addNext(ListNode(3))
var node2 = ListNode(5)
node2.addNext(ListNode(6)).addNext(ListNode(4))
let resultNode = Solution().addTwoNumbers(node1, node2)
