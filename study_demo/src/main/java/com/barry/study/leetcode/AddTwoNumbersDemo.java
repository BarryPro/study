package com.barry.study.leetcode;

import com.barry.study.list.ListNode;

public class AddTwoNumbersDemo {
    public static void main(String[] args) {
        System.out.println(addTwoNumbers(null, null));
    }

    public static ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode root = new ListNode(0);
        // 异常case检查
        if (l1 == null || l2 == null) {
            return root.next;
        }
        // 从头开始遍历
        ListNode cursor = root;
        // 进位标识
        int carry = 0;
        while (l1 != null || l2 != null || carry != 0) {
            int l1var = l1 != null ? l1.val : 0;
            int l2var = l2 != null ? l2.val : 0;
            int sum = l1var + l2var + carry;
            carry = sum / 10;

            ListNode sumNode = new ListNode(sum % 10);
            // 链接节点操作
            cursor.next = sumNode;
            // 游标赋值
            cursor = sumNode;
            // 移动游标
            if (l1 != null) {
                l1 = l1.next;
            }
            if (l2 != null) {
                l2 = l2.next;
            }
        }

        return root.next;
    }
}
