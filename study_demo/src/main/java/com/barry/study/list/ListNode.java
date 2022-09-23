package com.barry.study.list;

/**
 * Definition for singly-linked list.
 * 单链表节点定义
 */
public class ListNode {
    public int val;
    public ListNode next;

    public ListNode() {
    }

    public ListNode(int val) {
        this.val = val;
    }

    public ListNode(int val, ListNode next) {
        this.val = val;
        this.next = next;
    }

    public static ListNode genListNode4Array(int[] array){
        if(null == array){
            return null;
        }
        ListNode head = new ListNode(-1);
        ListNode cur = head;
        for(int a:array){
            cur.next = new ListNode(a);
            cur = cur.next;
        }
        return head.next;
    }

    public static void printListNode(ListNode head){
        if(head == null){
            System.out.println("null");
            return;
        }
        ListNode cur = head;
        while(cur != null){
            if(cur.next == null){
                System.out.print(cur.val);
            } else {
                System.out.print(cur.val+",");
            }
            cur = cur.next;
        }

    }
}
