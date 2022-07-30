class Solution {
    public int[] buildArray(int[] nums) {
//        return outArray(nums);
        return Arrays.stream(nums).map(i->nums[i]).toArray();
        
    }
 /*   static int[] outArray(int[] nums){
        int[] newArray = new int[nums.length];
        for (int i=0;i<nums.length;i++){
            newArray[i]=nums[nums[i]];
        }
        return newArray;
        
    }*/
}
