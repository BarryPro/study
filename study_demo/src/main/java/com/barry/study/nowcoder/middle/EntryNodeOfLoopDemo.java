package com.barry.study.nowcoder.middle;

import com.barry.study.list.ListNode;

/**
 * 链表中环的入口结点
 *
 *  给一个长度为n链表，若其中包含环，请找出该链表的环的入口结点，否则，返回null。
 *
 * 数据范围： n≤10000n\le10000n≤10000，1<=结点值<=100001<=结点值<=100001<=结点值<=10000
 * 要求：空间复杂度 O(1)O(1)O(1)，时间复杂度 O(n)O(n)O(n)
 *
 * 例如，输入{1,2},{3,4,5}时，对应的环形链表如下图所示：
 *
 * 可以看到环的入口结点的结点值为3，所以返回结点值为3的结点。
 * 输入描述：
 * 输入分为2段，第一段是入环前的链表部分，第二段是链表环的部分，后台会根据第二段是否为空将这两段组装成一个无环或者有环单链表
 * 返回值描述：
 * 返回链表的环的入口结点即可，我们后台程序会打印这个结点对应的结点值；若没有，则返回对应编程语言的空结点即可。
 */
public class EntryNodeOfLoopDemo {
    public static void main(String[] args) {
        ListNode.printListNode(entryNodeOfLoop(ListNode.genListNode4Array(new int[]{1,2,3,4})));
    }

    /**
     * 如果有环，返回快慢指针相遇的节点
     * @return 相遇节点
     */
    private static ListNode hasCycle(ListNode head){
        if(head == null){
            return null;
        }

        ListNode fast = head;
        ListNode slow = head;
        while(fast != null && fast.next!=null){
            fast = fast.next.next;
            slow = slow.next;
            if(slow == fast){
                return slow;
            }
        }

        return null;
    }

    public static ListNode entryNodeOfLoop(ListNode head){
        ListNode slow = hasCycle(head);
        // 如果没有返回slow指针说明没有环
        if(slow == null){
            return null;
        }
        ListNode fast = head;
        // 找到再次相遇的节点就是环的入口
        while(fast != slow){
            fast = fast.next;
            slow = slow.next;
        }
        return slow;
    }
}
