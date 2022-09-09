package com.barry.study.algorithm.dp;

/**
 * 描述
 * 给定数组arr，arr中所有的值都为正整数且不重复。每个值代表一种面值的货币，
 * 每种面值的货币可以使用任意张，再给定一个aim，代表要找的钱数，
 * 求组成aim的最少货币数。
 *
 * 如果无解，请返回-1.
 *
 * 数据范围：数组大小满足 0≤n≤100000 \le n \le 10000 0≤n≤10000 ，
 * 数组中每个数字都满足 0<val≤100000 < val \le 10000 0<val≤10000，0≤aim≤50000 \le aim \le 50000≤aim≤5000
 *
 * 要求：时间复杂度 O(n×aim)O(n \times aim)O(n×aim) ，空间复杂度 O(aim)O(aim)O(aim)。
 */
public class DpMinMoney_M {
    public static void main(String[] args) {
        int[] arr = {5,2,3};
        int aim = 10;
        System.out.println(minMoney(arr, aim));
    }

    /**
     * 最少货币数
     * @param arr 所有面币的集合，不重复
     * @param aim 要找的钱数
     * @return 组成aim最少的币种数
     */
    private static int minMoney(int[] arr,int aim){
        // 第1步：确定状态（最后一步、化解子问题）
        // 1.1最后一步，最后一个面值是ak，前面的面值和就是aim-ak
        // 1.2化解子问题，最少多少面值可以组成aim-ak

        // 第2步：确定转移方程
        // ak:5,f(aim)=f(aim-5)+1
        // ak:2,f(aim)=f(aim-2)+1
        // ak:3,f(aim)=f(aim-3)+1
        // f(aim)=min{f(aim-5)+1,f(aim-2)+1,f(aim-3)+1}

        // 第3步：确认开始和边界条件
        // 3.1开始，f(0)=0
        // 3.2边界问题，f(aim)=min{f(aim-5)+1,f(aim-2)+1,f(aim-3)+1}  aim-5、aim-2、aim-3小于0怎么处理？如果凑不出来怎么处理？正无穷

        // 第4步：计算顺序
        // 4.1 凑aim需要最少面值数 f(x)=min{f(aim-5)+1,f(aim-2)+1,f(aim-3)+1}
        // 4.2 初始条件 f(0)=0
        // 4.3 然后计算 f(1)、f(2)、……f(aim)
        // 4.4 当我们计算到f(aim)时，f(aim-3)、f(aim-2)、f(aim-5)都已经得到结果了

        // 初始化动态规划表，要找面额的长度+1
        int[] f = new int[aim + 1];
        // 开始状态
        f[0] = 0;
        // 从第2个数开始算，一直算到aim为止
        for(int i = 1;i<=aim; i++){
            // 边界条件设置，默认为抽不出来，正无穷
            f[i] = Integer.MAX_VALUE;
            // 解决子问题
            // f(aim)=min{f(aim-5)+1,f(aim-2)+1,f(aim-3)+1}
            // 遍历所有面值进行组合
            for(int j = 0;j<arr.length;j++){
                // 转移方程，ak:5,f(aim)=f(aim-5)+1
                // 边界条件 要凑的金额要比面值大且，当前金额减去当前面值有解（是能凑出来的）
                if(i >= arr[j] && f[i-arr[j]] != Integer.MAX_VALUE){
                    f[i] = Math.min(f[i - arr[j]] + 1, f[i]);
                }
            }
        }
        // 如果最后aim没有凑出来返回-1
        if(f[aim] == Integer.MAX_VALUE){
            return -1;
        }
        // 打印动态规划表内容
        // System.out.println(Arrays.toString(f));
        // aim下标对应的就是最少的币总数
        return f[aim];
    }
}
