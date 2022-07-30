class Solution {
    public int numIdenticalPairs(int[] nums) {
      //  return goodPairs(nums);
        int ans = 0;
        int[] count = new int[101];
        
        for(int n: nums)
            count[n]++;
        
        for(int n: count)
            ans += (n * (n - 1))/2;
        
        return ans;
        
    }
 /*   static int goodPairs(int[] a){
        int c =0;
        for (int i=0;i<a.length;i++) for(int j=i+1;j<a.length;j++) if(a[i]==a[j]) c+=1;       
        return c;
    }*/
}
