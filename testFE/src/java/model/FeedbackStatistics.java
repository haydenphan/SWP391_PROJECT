package model;

import DAO.InstructorFeedbackDAO;
import java.util.ArrayList;
import java.util.List;
import utils.NumberUtils;

public class FeedbackStatistics {

    private List<Integer> NumberOfStarRatingList = new ArrayList<>();

    public List<Integer> getNumberOfStarRatingList() {
        return NumberOfStarRatingList;
    }

    public void setNumberOfStarRatingList(List<Integer> NumberOfStarRatingList) {
        this.NumberOfStarRatingList = NumberOfStarRatingList;
    }

    public Integer getTotalNumberOfRating() {
        int sum = 0;
        for (int i = 0; i < this.NumberOfStarRatingList.size(); i++) {
            sum += this.NumberOfStarRatingList.get(i);
        }
        return sum;
    }

    public Integer getNumberOfNStarRating(int n) {
        return NumberOfStarRatingList.get(n - 1);
    }

    public double getPercentageOfNStarRating(int n) {
        double value;
        if (this.getTotalNumberOfRating() == 0) {
            value = 0;
        }
        value = (double) this.getNumberOfNStarRating(n) / (double) this.getTotalNumberOfRating() * 100;
        return NumberUtils.round(value, 2);
    }

    public static void main(String args[]) {
        String instructorID = "3";
        InstructorFeedbackDAO instFbDAO = new InstructorFeedbackDAO();
        FeedbackStatistics instStats = new FeedbackStatistics();
        instStats.setNumberOfStarRatingList(instFbDAO.getStarRatingsCount(instructorID));
        System.out.print(instStats.getNumberOfStarRatingList());
        System.out.print(instStats.getTotalNumberOfRating());
    }
}