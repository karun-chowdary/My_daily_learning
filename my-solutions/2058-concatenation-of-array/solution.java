class Solution {
    public int[] getConcatenation(int[] nums) {
      //  return concatenation(nums);
        int[] result = new int[nums.length * 2];
	for(int i=0;i<nums.length;i++)
		result[i + nums.length] = result[i] = nums[i];
	return result;
        
    }
   /* static int[] concatenation(int[] nums){
        int[] ans = new int[2*nums.length];
        for( int i = 0; i< 2*nums.length;i++){
            if(i<nums.length){
                ans[i]=nums[i];
            }
            else{
                ans[i]=nums[i-nums.length];
            }
        }
        return ans;
    }*/
}
