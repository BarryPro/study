package com.barry.study.nowcoder.simple;

import com.barry.study.list.ListNode;

/**
 * 判断一个链表是否为回文结构
 *  给定一个链表，请判断该链表是否为回文结构。
 * 回文是指该字符串正序逆序完全一致。
 * 数据范围： 链表节点数 0≤n≤1050 \le n \le 10^50≤n≤105，链表中每个节点的值满足 ∣val∣≤107|val| \le 10^7∣val∣≤107
 */
public class ListPailDemo {
    public static void main(String[] args) {
        System.out.println(isPail(ListNode.genListNode4Array(new int[]{1,2,1})));
    }

    public static boolean isPail(ListNode head){
        if(head == null){
            return true;
        }
        ListNode fast = head;
        ListNode slow = head;
        while (fast != null && fast.next != null){
            slow = slow.next;
            fast = fast.next.next;
        }
        slow = reverse(slow);
        fast = head;
        while(slow != null){
            if(slow.val != fast.val){
                return false;
            }
            slow = slow.next;
            fast = fast.next;
        }
        return true;
    }

    private static ListNode reverse(ListNode head){
        if(head == null){
            return null;
        }

        ListNode cur = head;
        ListNode pre = null;
        while(cur != null){
            ListNode tmp = cur.next;
            cur.next = pre;
            pre = cur;
            cur = tmp;
        }
        return pre;
    }
}
