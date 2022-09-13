package com.barry.study.list;

public class MergeListNodeDemo {

    public ListNode merge(ListNode list1, ListNode list2) {
        ListNode head = new ListNode(0);
        ListNode cur = head;

        while (list1 != null && list2 != null){
            if(list1.val > list2.val){
                cur.next = list2;
                list2 = list2.next;
            } else {
                cur.next = list1;
                list1 = list1.next;
            }
            // 移动当前节点
            cur = cur.next;
        }

        if(list1 != null){
            cur.next = list1;
        }
        if(list2 != null){
            cur.next = list2;
        }
        return head.next;
    }
}
