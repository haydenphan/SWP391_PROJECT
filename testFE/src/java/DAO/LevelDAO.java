package DAO;

import model.Level;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class LevelDAO extends DAO<Level> {

    @Override
    public int insert(Level level) {
        int result = 0;
        String sql = "INSERT INTO Levels (level_name) VALUES (?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, level.getLevelName());
            result = statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(LevelDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        return result;
    }

    public List<Level> getAllLevels() {
        List<Level> levels = new ArrayList<>();
        String sql = "SELECT levelID, levelName FROM CourseLevels";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement statement = con.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int levelId = resultSet.getInt("levelID");
                String levelName = resultSet.getString("levelName");
                levels.add(new Level(levelId, levelName));
            }
        } catch (SQLException | ClassNotFoundException e) {

        } catch (Exception ex) {

        }

        return levels;
    }

    public static void main(String[] args) {
        // Test insert method
        LevelDAO levelDAO = new LevelDAO();
        // Test getAllLevels method
        List<Level> allLevels = levelDAO.getAllLevels();
        System.out.println("All levels:");
        for (Level level : allLevels) {
            System.out.println(level.getLevelName());
        }
    }
}
