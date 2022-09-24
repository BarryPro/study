package com.barry.study.nowcoder.middle;

import com.barry.study.list.ListNode;

/**
 * 链表的奇偶重排
 * 给定一个单链表，请设定一个函数，将链表的奇数位节点和偶数位节点分别放在一起，重排后输出。
 * 注意是节点的编号而非节点的数值。
 */
public class OddEvenListDemo {
    public static void main(String[] args) {
        ListNode.printListNode(oddEvenList(ListNode.genListNode4Array(new int[]{1,2,3,4,5,6})));
    }

    public static ListNode oddEvenList(ListNode head) {
        if(head == null){
            return null;
        }

        ListNode odd = head;
        ListNode even = head.next;
        ListNode evenHead = even;
        while (even != null && even.next != null) {
            odd.next = even.next;
            odd = odd.next;
            even.next = odd.next;
            even = even.next;
        }
        odd.next = evenHead;
        return head;
    }
}
