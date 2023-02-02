
import java.io.*;
import java.sql.*;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "sendEmail", urlPatterns = {"/sendMail"})
public class sendMail extends HttpServlet {

    String name, phnum, email, feedb, dates, times;
    String[] seats;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String Name = request.getParameter("name");

        String Email = request.getParameter("email");

        String pnumber = request.getParameter("phoneNumber");

        String feedback = request.getParameter("feedback");
        
        String date = request.getParameter("card-text-date");
        
        String time = request.getParameter("card-text-time");
        
        String[] seatArray = request.getParameterValues("selected-seats");

        Connection con = null;

        Statement st = null;

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        name = request.getParameter("name");
        email = request.getParameter("email");
        phnum = request.getParameter("phoneNumber");
        feedb = request.getParameter("feedback");
        dates = request.getParameter("date");
        times = request.getParameter("time");
        seats = request.getParameterValues("seatArray");
        

        final String username = "vodeegalla@students.nsbm.ac.lk";//your email id
        final String password = "Yvt0#vod";// your password
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.outlook.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/seat_01", "root", "");
            st = con.createStatement();

            String qry = "insert into user_details values('" + Name + "','" + Email + "','" + pnumber + "','" + feedback + "')";

            st.executeUpdate(qry);
            
            
            
            
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
            MimeBodyPart textPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            String final_Text = "Name: " + name + "    " + "Email: " + email + "    " + "Phone Number: " + phnum + "    " + "Feedback: " + feedb + "    Seat No : "+ seats +"  Time : "+ times +"  Date :"+ dates +"" ;
            textPart.setText(final_Text);
            message.setSubject(feedb);
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
            message.setSubject("Contact Details");
            //out.println("Sending");
            Transport.send(message);
            out.println("<center><h2 style='color:green;'>Email Sent Successfully.</h2>");
            out.println("Thank you for booking with ABC Cinema " + name + ", your booking details have been sent to your mail.</center>");
        } catch (Exception e) {
            out.println(e);
        }

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
