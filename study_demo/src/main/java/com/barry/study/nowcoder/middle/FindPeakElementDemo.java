package com.barry.study.nowcoder.middle;

/**
 * 寻找峰值
 *
 *  给定一个长度为n的数组nums，请你找到峰值并返回其索引。数组可能包含多个峰值，在这种情况下，返回任何一个所在位置即可。
 * 1.峰值元素是指其值严格大于左右相邻值的元素。严格大于即不能有等于
 * 2.假设 nums[-1] = nums[n] = −∞-\infty−∞
 * 3.对于所有有效的 i 都有 nums[i] != nums[i + 1]
 * 4.你可以使用O(logN)的时间复杂度实现此问题吗？
 */
public class FindPeakElementDemo {
    public static void main(String[] args) {
        int[] array = {2,4,1,2,7,8,4};
        System.out.println(findPeakElement(array));
    }

    private static int findPeakElement(int[] array){
        int left = 0;
        int right = array.length - 1;
        while(left < right){
            // 移动右边
            int mid = (left+right)/2;
            // 中间值大于右面的值，右面是下降的不一定有峰值，往左找
            if(array[mid] > array[right]){
                // 中间的值当做最右边的值
                right = mid;
            } else {
                // 中间值小于右面的值，右面是上升的，存在峰值，往右找
                left = mid + 1;
            }
        }
        // 其中一个波峰
        return right;
    }
}
