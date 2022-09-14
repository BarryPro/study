package com.barry.study.nowcoder.simple;

import com.barry.study.tree.TreeNode;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 二叉树先序遍历
 */
public class PreOrderTraversalDemo {
    public static void main(String[] args) {
        TreeNode root = new TreeNode(1);
        TreeNode right = new TreeNode(2);
        TreeNode left = new TreeNode(3);
        root.right = right;
        right.left = left;
        System.out.println(Arrays.toString(preorderTraversal(root)));
    }

    public static int[] preorderTraversal(TreeNode root){
        List<Integer> list = new ArrayList<>();
        preorder(root, list);
        int[] res = new int[list.size()];
        for(int i = 0;i<list.size();i++){
            res[i] = list.get(i);
        }
        return res;
    }

    private static void preorder(TreeNode root, List<Integer> list) {
        if(root == null){
            return;
        }
        // 先遍历根节点
        list.add(root.val);
        // 再遍历左节点
        preorder(root.left,list);
        // 最后遍历右节点
        preorder(root.right,list);
    }
}
