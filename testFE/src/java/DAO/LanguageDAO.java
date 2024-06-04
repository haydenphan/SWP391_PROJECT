package DAO;

import model.Language;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LanguageDAO extends DAO<Language> {

    @Override
    public int insert(Language language) {
        int result = 0;
        String sql = "INSERT INTO Languages (language_name) VALUES (?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, language.getLanguageName());
            result = statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error: " + e.getMessage());
            Logger.getLogger(LanguageDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(LanguageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public List<Language> getAllLanguages() {
        List<Language> languages = new ArrayList<>();
        String sql = "SELECT languageID, languageName FROM CourseLanguages";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement statement = con.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int languageId = resultSet.getInt("languageID");
                String languageName = resultSet.getString("languageName");
                languages.add(new Language(languageId, languageName));
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error: " + e.getMessage());
            Logger.getLogger(LanguageDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(LanguageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return languages;
    }
        public static void main(String[] args) {
        // Test insert method
        LanguageDAO languageDAO = new LanguageDAO();

        // Test getAllLanguages method
        List<Language> allLanguages = languageDAO.getAllLanguages();
        System.out.println("All languages:");
        for (Language language : allLanguages) {
            System.out.println(language.getLanguageName());
        }
    }
    // Additional methods for language-related operations can be added here
}
