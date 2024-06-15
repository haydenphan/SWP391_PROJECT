/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Question;

/**
 *
 * @author tuan6
 */
public class QuestionDAO extends DBContext {

    public int[] insertMany(List<Question> questions) {
        int[] results = null;
        String sql = "INSERT INTO [OnlineLearningV3].[dbo].[NewQuestion] ([AnswerA], [AnswerB], [AnswerC], [AnswerD], [CorrectAnswer], [CourseID], [QuestionDetail])"
                + " VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            // Thêm tất cả các câu lệnh vào batch
            for (Question t : questions) {
                st.setString(1, t.getAnswerA());
                st.setString(2, t.getAnswerB());
                st.setString(3, t.getAnswerC());
                st.setString(4, t.getAnswerD());
                st.setString(5, t.getCorrectAnswer());
                st.setInt(6, t.getCourseID());
                st.setString(7, t.getQuestionDetail());
                st.addBatch(); // Thêm câu lệnh vào batch
            }

            // Thực thi batch
            results = st.executeBatch();

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return results;
    }

    public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();

        // Tạo danh sách các đối tượng Question
        List<Question> questions = new ArrayList<>();

        Question ques1 = new Question();
        ques1.setAnswerA("1");
        ques1.setAnswerB("2");
        ques1.setAnswerC("3");
        ques1.setAnswerD("4");
        ques1.setCorrectAnswer("1");
        ques1.setCourseID(1);
        ques1.setQuestionDetail("Chọn 1 số đúng");

        // Thêm đối tượng Question vào danh sách
        questions.add(ques1);

        // Tạo thêm một vài đối tượng Question để chèn nhiều giá trị
        Question ques2 = new Question();
        ques2.setAnswerA("5");
        ques2.setAnswerB("6");
        ques2.setAnswerC("7");
        ques2.setAnswerD("8");
        ques2.setCorrectAnswer("5");
        ques2.setCourseID(2);
        ques2.setQuestionDetail("Chọn 1 số đúng tiếp theo");

        questions.add(ques2);

        Question ques3 = new Question();
        ques3.setAnswerA("9");
        ques3.setAnswerB("10");
        ques3.setAnswerC("11");
        ques3.setAnswerD("12");
        ques3.setCorrectAnswer("9");
        ques3.setCourseID(3);
        ques3.setQuestionDetail("Chọn 1 số đúng nữa");

        questions.add(ques3);

        // Insert the questions
        int[] result = dao.insertMany(questions);

        // Print the result
        if (result != null) {
            System.out.println("Insert successful! Number of rows affected: " + result.length);
        } else {
            System.out.println("Insert failed!");
        }
    }

}

