package com.barry.study.nowcoder.middle;

import com.barry.study.list.ListNode;

/**
 *  链表相加(二)
 *   假设链表中每一个节点的值都在 0 - 9 之间，那么链表整体就可以代表一个整数。
 * 给定两个这种链表，请生成代表两个整数相加值的结果链表。
 * 数据范围：0≤n,m≤10000000 \le n,m \le 10000000≤n,m≤1000000，链表任意值 0≤val≤90 \le val \le 9 0≤val≤9
 * 要求：空间复杂度 O(n)O(n)O(n)，时间复杂度 O(n)O(n)O(n)
 */
public class AddInListDemo {
    public static void main(String[] args) {
        ListNode.printListNode(addInList(ListNode.genListNode4Array(new int[] {9,3,7}),ListNode.genListNode4Array(new int[] {6,3})));
    }

    public static ListNode addInList(ListNode h1,ListNode h2){
        if(h1 == null){
            return h2;
        }
        if(h2 == null){
            return h1;
        }
        ListNode res = new ListNode(-1);
        ListNode cur = res;
        ListNode n1 = reverseList(h1);
        ListNode n2 = reverseList(h2);
        int carry = 0;
        while(n1!=null || n2!=null || carry > 0){
            int n1Val = n1 == null?0:n1.val;
            int n2Val = n2 == null?0:n2.val;
            int sum = n1Val+ n2Val+carry;
            ListNode sumNode = new ListNode(sum % 10);
            carry = sum / 10;
            cur.next = sumNode;
            cur = cur.next;

            if(n1 != null){
                n1 = n1.next;
            }
            if(n2 != null){
                n2 = n2.next;
            }
        }

        return reverseList(res.next);
    }

    private static ListNode reverseList(ListNode head){
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
