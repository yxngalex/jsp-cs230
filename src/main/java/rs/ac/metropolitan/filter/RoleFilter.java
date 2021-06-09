package rs.ac.metropolitan.filter;

import rs.ac.metropolitan.database.entity.Role;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Set;

@WebFilter("/admin/user/*")
public class RoleFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        boolean loggedIn = (session != null && session.getAttribute("username") != null && session.getAttribute("id") != null);

        if (loggedIn) {
            Set<Role> roles = (Set<Role>) session.getAttribute("roles");
            boolean allowed = (roles != null) && roles.stream().anyMatch(r -> r.getRole().equals("ADMIN"));
            if (allowed) {
                chain.doFilter(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/admin.jsp");

            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        }

    }

    @Override
    public void destroy() {
    }
}
