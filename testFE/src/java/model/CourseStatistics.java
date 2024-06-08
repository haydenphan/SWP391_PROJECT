package model;

import java.util.ArrayList;
import java.util.List;
import utils.NumberUtils;

public class CourseStatistics {
    private List<Integer> NumberOfStarRatingList = new ArrayList<>();
    private Integer getTotalNumberOfRating(){
        int sum = 0;
        for (int i = 0; i < this.NumberOfStarRatingList.size(); i++) {
            sum += this.NumberOfStarRatingList.get(i);
        }
        return sum;
    }
    private Integer getNumberOfNStarRating(int n){
        return NumberOfStarRatingList.get(n-1);
    }
    private double getPercentageOfNStarRating(int n){
        double value = this.getNumberOfNStarRating(n)/this.getTotalNumberOfRating()*100;
        return NumberUtils.round(value, 2);
    }
    
    
}