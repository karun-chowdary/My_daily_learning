import java.util.*;
class Solution {
    public int findNumbers(int[] nums) {
        int c =0;
       String[] a = new String[nums.length];
        for(int i=0;i<nums.length;i++){
            a[i]=String.valueOf(nums[i]);
        }
        for(int i=0;i<a.length;i++){
            if(a[i].length()%2==0) c+=1;
        }
       return c;
        
    }
}
