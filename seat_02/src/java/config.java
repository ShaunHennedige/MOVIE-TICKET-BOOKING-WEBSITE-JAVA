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

@WebServlet(urlPatterns = {"/config"})
public class config extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        PrintWriter out = response.getWriter();
        
        String[] seatArray = request.getParameterValues("seat");;    
        
        String selectedDate = (String) request.getAttribute("selectedDate");
        String selectedTime = (String) request.getAttribute("selectedTime");
        
        Connection con = null;
        
        Statement st= null;
        
        
        String[] selectedSeats = request.getParameterValues("selectedSeats");
//        String[] selectedSeats = request.getParameterValues("seat");
//        int count = selectedSeats.length;

 
        if (seatArray != null) {
            for (String color : seatArray) {
                out.println(color);
            }
        }


        
        try {
            
            Class.forName("com.mysql.jdbc.Driver"); 
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/seat_01","root","");
            st = con.createStatement();
           // String hello = "Venura01";
            String qry = "INSERT INTO seat_table2 (seat, time, date) VALUES (?, ?, ?)";
            
            PreparedStatement statement = con.prepareStatement(qry);
            
            if (seatArray != null) {
                // Step 3: Execute the statement for each selected seat
                for (String seat : seatArray) {
                    statement.setString(1, seat);
                    statement.setString(2, selectedDate);
                    statement.setString(3, selectedTime);
                    statement.executeUpdate();
                }
            }
            
            response.sendRedirect("seatDetails.html");
            
            
           

       
           // out.print("{\"status\":\"success\", \"message\":\"Data received and processed successfully\"}");
           // out.flush();
        } catch (Exception e) {
            out.print(e);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
