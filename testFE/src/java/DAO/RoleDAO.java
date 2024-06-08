package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

public class RoleDAO extends DAO<Role>{

    @Override
    public int insert(Role t) {
        int res = 0;
        String sql = "INSERT INTO Roles (RoleName) VALUES (?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, t.getRoleName());

            res = st.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return res;
    }
    
    public static void main(String[] args) {
        RoleDAO r = new RoleDAO();
        r.insert(new Role("Learner"));
        r.insert(new Role("Lecturer"));
        r.insert(new Role("Admin"));
    }
    
}
