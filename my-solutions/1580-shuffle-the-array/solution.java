class Solution {
    public int[] shuffle(int[] nums, int n) {
        int[] ar = new int[2*n];
        int c=0;
        for(int i =0;i<n;i++){
            ar[c]=nums[i];
            c=c+2;
        }
        c=1;
        for(int i =n;i<2*n;i++){
            ar[c]=nums[i];
            c=c+2;
        }
        return ar;
        
    }
}
