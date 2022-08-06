import java.util.Arrays;

class Solution {
    public int maxProductDifference(int[] nums) {
        Arrays.sort(nums);
        int i = nums.length-1;
        return (nums[i]*nums[i-1])-(nums[0]*nums[1]);
        
    }
}
