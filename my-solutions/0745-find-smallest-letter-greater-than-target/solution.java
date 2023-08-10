class Solution {
    public char nextGreatestLetter(char[] letters, char target) {
       char a =  smallest(letters,target);
       return a;
    }
   public char smallest(char[] arr, char target){
        int start =0;
        int end = arr.length-1;
        while(start<=end){
            int mid = start+(end - start)/2;
            if(arr[mid]> target){
                end = mid-1;
            }else{
                start = mid+1;
            }
        }
        return arr[start%arr.length];
    }
}
