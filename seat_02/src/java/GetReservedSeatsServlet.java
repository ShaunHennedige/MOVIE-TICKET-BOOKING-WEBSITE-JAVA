/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.*;
import java.sql.*;
import java.sql.SQLException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Arrays;



@WebServlet(urlPatterns = {"/GetReservedSeatsServlet"})
public class GetReservedSeatsServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
    }

    
     
    
    protected void doPOST(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Initialize variables
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<String> reservedSeats = new ArrayList<>();

        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seat_01", "root", "");

            // Execute SQL query
            String sql = "SELECT seat FROM seat_table2";
            statement = con.prepareStatement(sql);
            resultSet = statement.executeQuery();

            // Extract data from result set
            while (resultSet.next()) {
                reservedSeats.add(resultSet.getString("seat"));
            }

            // Respond with a JSON object containing the reserved seats
            JSONArray jsonArray = new JSONArray(reservedSeats);
            JSONObject jsonObject = new JSONObject();
          //  jsonObject.put("reservedSeats", jsonArray);
            response.setContentType("application/json");
            response.getWriter().write(jsonObject.toString());

        } catch (SQLException | ClassNotFoundException e) {
            // Handle errors for JDBC
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (con != null) {
                    con.close();
                }
            }
            catch (SQLException e) {
                e.printStackTrace();
}
}
}
}
                
    

   
    
