package com.barry.study.list;

/**
 * 链表插入排序
 */
public class InsertSort4ListNodeDemo {
    public static void main(String[] args) {
        int[] a = {3,4,2,1,3,5,67,23,3};
        ListNode.printListNode(insertSort(ListNode.genListNode4Array(a)));
    }

    private static ListNode insertSort(ListNode head){
        if(head == null){
            return null;
        }
        ListNode res = new ListNode(-1);
        ListNode cur = head;
        ListNode pre = null;
        while(cur != null){
            // 保存当前节点的下一个节点，因为后序当前节点的下一个节点会变
            ListNode next = cur.next;
            pre = res;
            // 寻找当前节点正确位置的一个节点
            while(pre.next != null && pre.next.val < cur.val){
                pre = pre.next;
            }
            // 当前节点加入新链表中
            cur.next = pre.next;
            pre.next = cur;
            // 处理下一个节点
            cur = next;
        }
        return res.next;
    }
}
