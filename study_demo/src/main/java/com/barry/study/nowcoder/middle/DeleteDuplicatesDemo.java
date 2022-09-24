package com.barry.study.nowcoder.middle;

import com.barry.study.list.ListNode;

/**
 *
 * 删除有序链表中重复的元素-II
 *
 *  给出一个升序排序的链表，删除链表中的所有重复出现的元素，只保留原链表中只出现一次的元素。
 * 例如：
 * 给出的链表为1→2→3→3→4→4→51 \to 2\to 3\to 3\to 4\to 4\to51→2→3→3→4→4→5, 返回1→2→51\to 2\to51→2→5.
 * 给出的链表为1→1→1→2→31\to1 \to 1\to 2 \to 31→1→1→2→3, 返回2→32\to 32→3.
 *
 * 数据范围：链表长度 0≤n≤100000 \le n \le 100000≤n≤10000，链表中的值满足 ∣val∣≤1000|val| \le 1000∣val∣≤1000
 * 要求：空间复杂度 O(n)O(n)O(n)，时间复杂度 O(n)O(n)O(n)
 * 进阶：空间复杂度 O(1)O(1)O(1)，时间复杂度 O(n)O(n)O(n)
 */
public class DeleteDuplicatesDemo {
    public static void main(String[] args) {
        ListNode.printListNode(deleteDuplicates(ListNode.genListNode4Array(new int[]{1,2,2,2,3,3,4,5})));
    }

    public static ListNode deleteDuplicates(ListNode head) {
        if(head ==null){
            return null;
        }
        ListNode res = new ListNode(-1);
        res.next = head;
        ListNode cur = res;
        while(cur.next != null && cur.next.next != null){
            if(cur.next.val == cur.next.next.val){
                int tmp = cur.next.val;
                // 删除所有相同的节点
                while(cur.next != null && cur.next.val == tmp){
                    cur.next = cur.next.next;
                }
            } else {
                cur = cur.next;
            }
        }
        return res.next;
    }
}
