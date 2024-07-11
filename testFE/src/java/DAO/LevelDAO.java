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
    
    public static ArrayList<String> getAllLevelName() throws Exception {
        ArrayList<String> list = new ArrayList<>();
        String sql = "SELECT LevelName FROM CourseLevels";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    list.add(rs.getString("LevelName"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, e);
        }
        return list;
    }

    public static int getLevelIdByName(String levelName) {
        int levelId = -1;
        String sql = "SELECT LevelID FROM CourseLevels WHERE LevelName = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, levelName);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    levelId = resultSet.getInt("LevelID");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(LevelDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        return levelId;
    }
    
    public static String getLevelNameByID(int id) {
        String name = "";
        String sql = "SELECT LevelName FROM CourseLevels WHERE LevelID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    name = resultSet.getString("LevelName");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(LevelDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        return name;
    }

    public static void main(String[] args) {
        System.out.println(LevelDAO.getLevelNameByID(1));
    }
}
