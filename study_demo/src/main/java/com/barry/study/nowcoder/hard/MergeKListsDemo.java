package com.barry.study.nowcoder.hard;

import com.barry.study.list.ListNode;
import com.google.common.collect.Lists;

import java.util.ArrayList;

/**
 *  合并k个已排序的链表
 *
 *   合并 k 个升序的链表并将结果作为一个升序的链表返回其头节点。
 *
 * 数据范围：节点总数 0≤n≤50000 \le n \le 50000≤n≤5000，每个节点的val满足 ∣val∣<=1000|val| <= 1000∣val∣<=1000
 * 要求：时间复杂度 O(nlogn)O(nlogn)O(nlogn)
 */
public class MergeKListsDemo {
    public static void main(String[] args) {
        ArrayList<ListNode> list = new ArrayList<>();
        list.add(ListNode.genListNode4Array(new int[]{1,2}));
        list.add(ListNode.genListNode4Array(new int[]{1,4,5}));
        list.add(ListNode.genListNode4Array(new int[]{6}));
        ListNode.printListNode(mergeKLists(list));
    }

    /**
     * 两个链表合并
     * @return 合并后的链表
     */
    private static ListNode merge(ListNode l1,ListNode l2){
        if(l1 == null){
            return l2;
        }
        if(l2 == null){
            return l1;
        }
        ListNode head = new ListNode(-1);
        ListNode cur = head;
        while(l1 != null && l2 != null){
            if(l1.val <= l2.val){
                cur.next = l1;
                l1 = l1.next;
            } else {
                cur.next = l2;
                l2 = l2.next;
            }
            cur = cur.next;
        }
        if(l1 != null){
            cur.next = l1;
        } else {
            cur.next = l2;
        }
        return head.next;
    }

    /**
     * 多个链表拆分，两个两个合并
     * @return 合并后的链表头
     */
    private static ListNode divideMerge(ArrayList<ListNode> list,int left,int right){
        if(left > right){
            return null;
        } else if(left == right){
            return list.get(left);
        }
        int mid = (left + right) / 2;
        return merge(divideMerge(list,left,mid),divideMerge(list,mid+1,right));
    }

    public static ListNode mergeKLists(ArrayList<ListNode> list){
        return divideMerge(list,0,list.size()-1);
    }


}
