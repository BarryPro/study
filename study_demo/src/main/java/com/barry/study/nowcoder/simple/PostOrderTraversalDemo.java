package com.barry.study.nowcoder.simple;

import com.barry.study.tree.TreeNode;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 二叉树的后序遍历
 *  给定一个二叉树，返回他的后序遍历的序列。
 *
 * 后序遍历是值按照 左节点->右节点->根节点 的顺序的遍历。
 *
 * 数据范围：二叉树的节点数量满足 1≤n≤100 1 \le n \le 100 \ 1≤n≤100  ，
 * 二叉树节点的值满足 1≤val≤100 1 \le val \le 100 \ 1≤val≤100  ，树的各节点的值各不相同
 */
public class PostOrderTraversalDemo {
    public static void main(String[] args) {
        TreeNode root = new TreeNode(1);
        TreeNode right = new TreeNode(2);
        TreeNode left = new TreeNode(3);
        root.right = right;
        right.left = left;
        System.out.println(Arrays.toString(postorderTraversal(root)));
    }

    public static int[] postorderTraversal(TreeNode root) {
        List<Integer> list = new ArrayList<>();
        postOrder(root, list);
        int[] res = new int[list.size()];
        for (int i = 0; i < list.size(); i++) {
            res[i] = list.get(i);
        }
        return res;
    }

    private static void postOrder(TreeNode root, List<Integer> list) {
        if (root == null) {
            return;
        }
        // 再遍历左节点
        postOrder(root.left, list);
        // 最后遍历右节点
        postOrder(root.right, list);
        // 先遍历根节点
        list.add(root.val);
    }
}
