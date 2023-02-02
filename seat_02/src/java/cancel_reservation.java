import java.io.*;
import java.sql.*;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Arrays;



@WebServlet(urlPatterns = {"/cancel_reservation"})
public class cancel_reservation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
     
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            
        String[] seatArray = request.getParameterValues("seat");

        Connection con = null;
        Statement st = null;

        if (seatArray != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/seat_01", "root", "");
                st = con.createStatement();

                // Iterate through the selected seats and delete them from the database
                for (String seat : seatArray) {
                    st.executeUpdate("DELETE FROM seat_table2 WHERE seat = '" + seat + "'");
                }
            } catch (Exception e) {
                // Handle the exception
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(config.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        
        
        
        
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
