package com.barry.study.nowcoder.middle;

import com.barry.study.list.ListNode;

/**
 * BM3 链表中的节点每k个一组翻转
 * 将给出的链表中的节点每 k 个一组翻转，返回翻转后的链表
 * 如果链表中的节点数不是 k 的倍数，将最后剩下的节点保持原样
 * 你不能更改节点中的值，只能更改节点本身。
 */
public class ReverseKGroupDemo {
    public static void main(String[] args) {
        int[] array = {1,2,3,4,5};
        ListNode head = ListNode.genListNode4Array(array);
        ListNode.printListNode(reverseKGroup(head, 2));
    }

    public static ListNode reverseKGroup(ListNode head, int k){
        // 找到每次反转的尾部
        ListNode tail = head;
        // 遍历K次到尾部
        for(int i = 0;i<k;i++){
            // 如果不足k到了链表尾，直接返回，不反转
            if(tail == null){
                return head;
            }
            tail = tail.next;
        }
        ListNode pre = null;
        ListNode cur = head;
        // 在到达当前段尾节点前
        while(cur != tail){
            ListNode tmp = cur.next;
            cur.next = pre;
            pre = cur;
            cur = tmp;
        }
        // 当前尾指向下一段要反转的链表
        head.next = reverseKGroup(tail, k);
        return pre;
    }
}
