package com.barry.study.nowcoder.simple;

import com.barry.study.list.ListNode;

/**
 *  两个链表的第一个公共结点
 *  输入两个无环的单向链表，找出它们的第一个公共结点，如果没有公共节点则返回空。
 *  （注意因为传入数据是链表，所以错误测试数据的提示是用其他方式显示的，保证传入数据是正确的）
 *
 * 数据范围： n≤1000n \le 1000n≤1000
 * 要求：空间复杂度 O(1)O(1)O(1)，时间复杂度 O(n)O(n)O(n)
 */
public class FindFirstCommonNodeDemo {
    public static void main(String[] args) {
        System.out.println(findFirstCommonNode(null, null));
    }

    public static ListNode findFirstCommonNode(ListNode pHead1, ListNode pHead2){
        // 比较连个链表长度
        int p1 = listLength(pHead1);
        int p2 = listLength(pHead2);
        if (p1 >= p2) {
            // 先跳过怕p1比p2长出来的链表部分
            // 两个链表一起遍历后移
            return togetherMoveListNode(skipListNode4N(pHead1, p1 - p2), pHead2);
        } else {
            return togetherMoveListNode(pHead1, skipListNode4N(pHead2, p2 - p1));
        }
    }

    /**
     * 两个链表一起遍历
     * @param pHead1 链表1头
     * @param pHead2 链表2头
     */
    private static ListNode togetherMoveListNode(ListNode pHead1, ListNode pHead2){
        while (pHead1 != null && pHead2 != null && pHead1 != pHead2) {
            pHead1 = pHead1.next;
            pHead2 = pHead2.next;
        }
        // 当两链表同时遍历完或者遇到相同的节点，返回一个链表的头就可以
        return pHead1;
    }

    /**
     * 跳过链表head的n个节点
     * @param head 链表头
     * @param n 需要移动
     */
    private static ListNode skipListNode4N(ListNode head,int n){
        if (head == null || n < 0) {
            return head;
        }
        // 移动n次
        for (int i = 0; i < n; i++) {
            head = head.next;
        }
        return head;
    }

    /**
     * 计算链表长度
     * @param head 链表头节点
     * @return 链表长度
     */
    private static int listLength(ListNode head){
        if(head == null){
            return 0;
        }
        ListNode cur = head;
        int n = 0;
        while (cur != null) {
            n++;
            cur = cur.next;
        }
        return n;
    }
}


