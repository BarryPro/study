package com.barry.study.nowcoder.simple;

import com.barry.study.list.ListNode;

/**
 * 删除有序链表中重复的元素-I
 */
public class DeleteDuplicatesDemo {
    public static void main(String[] args) {
        ListNode.printListNode(deleteDuplicates(ListNode.genListNode4Array(new int[]{1,1,2,3,3,4})));
    }

    public static ListNode deleteDuplicates(ListNode head){
        if(head == null){
            return null;
        }
        ListNode cur = head;
        while(cur !=null && cur.next!= null){
            if(cur.val == cur.next.val){
                cur.next = cur.next.next;
            } else {
                cur = cur.next;
            }
        }
        return head;
    }
}
