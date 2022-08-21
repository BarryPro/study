package com.barry.study.leetcode;

import com.barry.study.list.ListNode;

public class MergeTwoListsDemo {
    public static void main(String[] args) {
        System.out.println(mergeTwoLists(null, null));
    }

    public static ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        ListNode root = new ListNode(0);
        ListNode cursor = root;
        while (list1 != null || list2 != null) {
            if(list1 == null){
                cursor.next = list2;
                break;
            }
            if(list2 == null){
                cursor.next = list1;
                break;
            }

            if(list1.val < list2.val){
                cursor.next = list1;
                // 当前合并链表也向后移动
                cursor = cursor.next;
                // 原链表也向后移动
                list1 = list1.next;
            } else {
                cursor.next = list2;
                cursor = cursor.next;
                list2 = list2.next;
            }
        }

        // 跳过表头，因为表头是0，只是为了链接整个链表使用
        return root.next;
    }
}
