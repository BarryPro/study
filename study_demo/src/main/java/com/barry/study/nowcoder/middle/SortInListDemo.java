package com.barry.study.nowcoder.middle;

import com.barry.study.list.ListNode;

public class SortInListDemo {
    public static void main(String[] args) {
        ListNode.printListNode(sortInList(ListNode.genListNode4Array(new int[]{-1,0,-2,3})));
    }

    public static ListNode sortInList(ListNode head){
        if(head == null || head.next == null){
            return head;
        }
        ListNode left = head;
        ListNode mid = head.next;
        ListNode right = head.next.next;
        while(right != null && right.next != null){
            left = left.next;
            mid = mid.next;
            // 一次移动两步
            right = right.next.next;
        }
        left.next = null;
        return merge(sortInList(head), sortInList(mid));
    }

    private static ListNode merge(ListNode h1,ListNode h2){
        if(h1 == null){
            return h2;
        }
        if(h2 == null){
            return h1;
        }
        ListNode res = new ListNode(-1);
        ListNode cur = res;
        while(h1 != null && h2 != null){
            if(h1.val <= h2.val){
                cur.next = h1;
                h1 = h1.next;
            } else {
                cur.next = h2;
                h2 = h2.next;
            }
            cur = cur.next;
        }
        if(h1 != null){
            cur.next = h1;
        } else {
            cur.next = h2;
        }
        return res.next;
    }


}
