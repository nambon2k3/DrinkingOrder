//package Utils;
//
//import Model.Staff;
//import Model.User;
//import java.io.IOException;
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebFilter("/*")
//public class Authorization implements Filter {
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//
//        // get request response
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//
//        // lay thong tin staff
//        Staff staff = SessionUserInfo.getStaffSession(httpRequest);
//        User user = SessionUserInfo.getUserSession(httpRequest);
//
//        // Get the requested URL
//        String url = httpRequest.getRequestURI();
//
//        // Check if the user is authenticated
//        int role = staff == null ? -1 : staff.getRole();
//        // Check URL and user roles
//        if (url.contains("/admin/") && role != 1) {
//            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
//            return;
//        } else if (url.contains("/teastaff/") && role != 2) {
//            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
//            return;
//        }
//        if ((url.contains("public/cart") || url.contains("customer/my-order") || url.contains("common/profile")) && user == null) {
//            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
//            return;
//        }
//
//        chain.doFilter(request, response);
//    }
//
//    @Override
//    public void destroy() {
//    }
//
//}
