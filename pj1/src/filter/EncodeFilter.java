package filter;

import javax.servlet.*;

public class EncodeFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("init");
    }

    public void  doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws java.io.IOException, ServletException {
        System.out.println("filter");
        request.setCharacterEncoding("utf8");
        //response.setCharacterEncoding("utf8");
        // 把请求传回过滤链
        chain.doFilter(request,response);
    }
}
