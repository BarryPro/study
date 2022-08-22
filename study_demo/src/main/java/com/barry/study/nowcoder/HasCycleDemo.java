package com.barry.study.nowcoder;

import com.barry.study.list.ListNode;

public class HasCycleDemo {
    public static void main(String[] args) {
        System.out.println(hasCycle(null));
    }

    /**
     * 通过创建两个指针，一个走的快一个走的慢，如果有环一定会相遇，
     * 无论是偶数个节点还是奇数个节点
     * @param head 头节点
     * @return true：有环，false：无环
     */
    public static boolean hasCycle(ListNode head) {
        if(head == null){
            return false;
        }
        ListNode fast = head;
        ListNode slow = head;
        // 使用快的判断，因为快的走两步
        while (fast != null && fast.next != null) {
            // 一次走两步
            fast = fast.next.next;
            // 一次走一步
            slow = slow.next;
            // 比较索引，不能比较值，因为不同节点值可能相同，因为出现环时指向的时同一个节点
            if(fast == slow){
                return true;
            }
        }
        return false;
    }
}
