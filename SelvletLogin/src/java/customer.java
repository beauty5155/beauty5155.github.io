/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Beauty Kumari
 */
@WebServlet(urlPatterns = {"/customer"})
public class customer extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String bought = request.getParameter("bought");
        String credit = request.getParameter("credit");
        String debit = request.getParameter("debit");
        Connection conn = null;
        Statement stmt = null;

        try (PrintWriter out = response.getWriter()) {

            out.println(id);
            out.println(name);
            out.println(contact);
            out.println(bought);
            out.println(credit);
            out.println(debit); 
            
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/pcms";
            final String USER = "root";
            final String PASS = "";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            int nContact = 0, nId = 0, nBought = 0, nCredit = 0, nDebit = 0;
            String sql;
            out.println("before query");
            sql = ("INSERT INTO `pcms_db`(`Customer ID`, `Name`, `Contact No`, `Purchase(lit / Rs)`, `Credited(Rs)`, `Debited(Rs)`) VALUES ('"+id+"','"+name+"','"+contact+"','"+bought+"','"+credit+"','"+debit+"') ");
           out.println("after query");
            nId = Integer.parseInt(id);
            nContact = Integer.parseInt(contact);
            nBought = Integer.parseInt(bought);
            nCredit = Integer.parseInt(credit);
            nDebit = Integer.parseInt(debit);
            stmt.executeUpdate(sql);

            if (stmt != null) {
                stmt.close();
            }
            
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
