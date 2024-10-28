/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.ToppingDAO;
import Model.Topping;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet(name="AdminToppingController", urlPatterns={"/admin/topping"})
public class AdminToppingController extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ToppingDAO toppingDAO = new ToppingDAO();
        List<Topping> toppings = toppingDAO.getAllToppingsWithDeleted();        
        request.setAttribute("toppings", toppings);
        request.getRequestDispatcher("../admin-topping.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    addTopping(request, response);
                    break;
                case "update":
                    updateTopping(request, response);
                    break;
            }
        } else {
            // Handle missing action parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void addTopping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String toppingImage = request.getParameter("toppingImage");
        String toppingName = request.getParameter("toppingName").trim();
        double toppingPrice = Double.parseDouble(request.getParameter("toppingPrice"));
        
        Topping topping = new Topping();
        topping.setImg(toppingImage);
        topping.setToppingName(toppingName);
        topping.setPrice(toppingPrice);
        topping.setDeleted(false);
        
        new ToppingDAO().addTopping(topping);
        
        response.sendRedirect("topping?success");
    }
    
    private void updateTopping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int toppingId = Integer.parseInt(request.getParameter("toppingId"));
        String toppingImage = request.getParameter("toppingImage");
        String toppingName = request.getParameter("toppingName").trim();
        double toppingPrice = Double.parseDouble(request.getParameter("toppingPrice"));
        boolean toppingStatus = Boolean.parseBoolean(request.getParameter("toppingStatus"));
        
        Topping topping = new Topping();
        topping.setId(toppingId);
        topping.setImg(toppingImage);
        topping.setToppingName(toppingName);
        topping.setPrice(toppingPrice);
        topping.setDeleted(toppingStatus);
        
        new ToppingDAO().updateTopping(topping);
        
        response.sendRedirect("topping?success");
    }

}
