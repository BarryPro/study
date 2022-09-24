package com.barry.study.nowcoder.simple;

import com.barry.study.list.ListNode;

/**
 *  输入一个长度为 n 的链表，设链表中的元素的值为 ai ，返回该链表中倒数第k个节点。
 * 如果该链表长度小于k，请返回一个长度为 0 的链表。
 */
public class FindKthToTailDemo {
    public static void main(String[] args) {
        ListNode.printListNode(findKthToTail(ListNode.genListNode4Array(new int[]{1,2,3,4,5}),2));
    }

    public static ListNode findKthToTail(ListNode head,int k){
        if(head == null || k <= 0){
            return null;
        }

        ListNode fast = head;
        ListNode slow = head;
        for(int i = 0;i<k;i++){
            if(fast != null){
                fast = fast.next;
            } else {
                // 说明链表长度不够倒数，返回为空
                return null;
            }
        }
        // fast指针和slow指针一直相差k个节点，当fast到达尾部，slow节点就是倒数第k个节点
        while(fast!=null){
            fast = fast.next;
            slow = slow.next;
        }
        return slow;
    }
}
