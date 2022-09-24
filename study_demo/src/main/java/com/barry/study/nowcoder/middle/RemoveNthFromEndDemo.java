package com.barry.study.nowcoder.middle;

import com.barry.study.list.ListNode;

/**
 * 删除链表的倒数第n个节点
 *  给定一个链表，删除链表的倒数第 n 个节点并返回链表的头指针
 * 例如，
 * 给出的链表为: 1→2→3→4→51\to 2\to 3\to 4\to 51→2→3→4→5, n=2n= 2n=2.
 * 删除了链表的倒数第 nnn 个节点之后,链表变为1→2→3→51\to 2\to 3\to 51→2→3→5.
 *
 * 数据范围： 链表长度 0≤n≤10000\le n \le 10000≤n≤1000，链表中任意节点的值满足 0≤val≤1000 \le val \le 1000≤val≤100
 * 要求：空间复杂度 O(1)O(1)O(1)，时间复杂度 O(n)O(n)O(n)
 * 备注：
 * 题目保证 nnn 一定是有效的
 */
public class RemoveNthFromEndDemo {
    public static void main(String[] args) {
        ListNode.printListNode(removeNthFromEnd(ListNode.genListNode4Array(new int[]{1,2}),2));
    }

    public static ListNode removeNthFromEnd(ListNode head, int n){
        if(head == null || n <= 0){
            return head;
        }
        ListNode res = new ListNode(-1);
        res.next = head;
        ListNode fast = head;
        ListNode slow = head;
        // 记住前一个节点，找到第n个节点的前一个节点
        ListNode pre = res;
        for(int i = 0;i<n;i++){
            if(fast != null){
                fast = fast.next;
            } else {
                return head;
            }
        }
        while(fast != null){
            fast = fast.next;
            pre = slow;
            slow = slow.next;
        }
        // 删除第n个节点
        pre.next = slow.next;
        return res.next;
    }
}
