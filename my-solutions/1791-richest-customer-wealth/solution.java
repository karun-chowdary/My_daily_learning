class Solution {
    public int maximumWealth(int[][] accounts) {
        int s = 0;
        int c= 0;
        for (int[] i : accounts){
            for(int j :i){
                c+=j;
            }
            if(c>s){
                s=c;
            }
            c=0;
        }
        return s;
        
    }
}
