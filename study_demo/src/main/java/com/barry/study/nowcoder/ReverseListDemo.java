package com.barry.study.nowcoder;

import com.barry.study.list.ListNode;

/**
 *  给定一个单链表的头结点pHead(该头节点是有值的，比如在下图，它的val是1)，长度为n，反转该链表后，返回新链表的表头。
 *
 * 数据范围： 0≤n≤10000\leq n\leq10000≤n≤1000
 * 要求：空间复杂度 O(1)O(1)O(1) ，时间复杂度 O(n)O(n)O(n) 。
 *
 * 如当输入链表{1,2,3}时，
 * 经反转后，原链表变为{3,2,1}，所以对应的输出为{3,2,1}。
 */
public class ReverseListDemo {
    public static void main(String[] args) {
        System.out.println(reverseList(null));
    }

    public static ListNode reverseList(ListNode head) {
        if(head == null){
            return null;
        }
        ListNode cur = head;
        ListNode pre = null;
        while (cur != null) {
            // 断开链表，要记录后续一个
            ListNode temp = cur.next;
            // 当前的next指向前一个（反转链接开始链接）
            cur.next = pre;
            // 前一个更新为当前（当前节点的
            pre = cur;
            // 当前更新为刚刚记录的后一个
            cur = temp;
        }
        return pre;
    }
}
