package org.apache.jsp.admin.views.voucher;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.util.Date;

public final class report2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                background-color: #FAFAFA;\n");
      out.write("                font: 12pt \"Tohoma\";\n");
      out.write("            }\n");
      out.write("            * {\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                -moz-box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("            .page {\n");
      out.write("                width: 21cm;\n");
      out.write("                overflow:hidden;\n");
      out.write("                min-height:297mm;\n");
      out.write("                padding: 2.5cm;\n");
      out.write("                margin-left:auto;\n");
      out.write("                margin-right:auto;\n");
      out.write("                background: white;\n");
      out.write("                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("            .subpage {\n");
      out.write("                padding: 1cm;\n");
      out.write("                border: 5px red solid;\n");
      out.write("                height: 237mm;\n");
      out.write("                outline: 2cm #FFEAEA solid;\n");
      out.write("            }\n");
      out.write("            @page {\n");
      out.write("                size: A4;\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("            button {\n");
      out.write("                width:100px;\n");
      out.write("                height: 24px;\n");
      out.write("            }\n");
      out.write("            .header {\n");
      out.write("                overflow:hidden;\n");
      out.write("            }\n");
      out.write("            .logo {\n");
      out.write("                background-color:#FFFFFF;\n");
      out.write("                text-align:left;\n");
      out.write("                float:left;\n");
      out.write("            }\n");
      out.write("            .company {\n");
      out.write("                padding-top:24px;\n");
      out.write("                text-transform:uppercase;\n");
      out.write("                background-color:#FFFFFF;\n");
      out.write("                text-align:right;\n");
      out.write("                float:right;\n");
      out.write("                font-size:16px;\n");
      out.write("            }\n");
      out.write("            .title {\n");
      out.write("                text-align:center;\n");
      out.write("                position:relative;\n");
      out.write("                color:#0000FF;\n");
      out.write("                font-size: 24px;\n");
      out.write("                top:1px;\n");
      out.write("            }\n");
      out.write("            .footer-left {\n");
      out.write("                text-align:center;\n");
      out.write("                text-transform:uppercase;\n");
      out.write("                padding-top:24px;\n");
      out.write("                position:relative;\n");
      out.write("                height: 150px;\n");
      out.write("                width:50%;\n");
      out.write("                color:#000;\n");
      out.write("                float:left;\n");
      out.write("                font-size: 12px;\n");
      out.write("                bottom:1px;\n");
      out.write("            }\n");
      out.write("            .footer-right {\n");
      out.write("                text-align:center;\n");
      out.write("                text-transform:uppercase;\n");
      out.write("                padding-top:24px;\n");
      out.write("                position:relative;\n");
      out.write("                height: 150px;\n");
      out.write("                width:50%;\n");
      out.write("                color:#000;\n");
      out.write("                font-size: 12px;\n");
      out.write("                float:right;\n");
      out.write("                bottom:1px;\n");
      out.write("            }\n");
      out.write("            .TableData {\n");
      out.write("                background:#ffffff;\n");
      out.write("                font: 11px;\n");
      out.write("                width:100%;\n");
      out.write("                border-collapse:collapse;\n");
      out.write("                font-family:Verdana, Arial, Helvetica, sans-serif;\n");
      out.write("                font-size:12px;\n");
      out.write("                border:thin solid #d3d3d3;\n");
      out.write("            }\n");
      out.write("            .TableData TH {\n");
      out.write("                background: rgba(0,0,255,0.1);\n");
      out.write("                text-align: center;\n");
      out.write("                font-weight: bold;\n");
      out.write("                color: #000;\n");
      out.write("                border: solid 1px #ccc;\n");
      out.write("                height: 24px;\n");
      out.write("            }\n");
      out.write("            .TableData TR {\n");
      out.write("                height: 24px;\n");
      out.write("                border:thin solid #d3d3d3;\n");
      out.write("            }\n");
      out.write("            .TableData TR TD {\n");
      out.write("                padding-right: 2px;\n");
      out.write("                padding-left: 2px;\n");
      out.write("                border:thin solid #d3d3d3;\n");
      out.write("            }\n");
      out.write("            .TableData TR:hover {\n");
      out.write("                background: rgba(0,0,0,0.05);\n");
      out.write("            }\n");
      out.write("            .TableData .cotSTT {\n");
      out.write("                text-align:center;\n");
      out.write("                width: 10%;\n");
      out.write("            }\n");
      out.write("            .TableData .cotTenSanPham {\n");
      out.write("                text-align:left;\n");
      out.write("                width: 40%;\n");
      out.write("            }\n");
      out.write("            .TableData .cotHangSanXuat {\n");
      out.write("                text-align:left;\n");
      out.write("                width: 20%;\n");
      out.write("            }\n");
      out.write("            .TableData .cotGia {\n");
      out.write("                text-align:right;\n");
      out.write("                width: 120px;\n");
      out.write("            }\n");
      out.write("            .TableData .cotSoLuong {\n");
      out.write("                text-align: center;\n");
      out.write("                width: 50px;\n");
      out.write("            }\n");
      out.write("            .TableData .cotSo {\n");
      out.write("                text-align: right;\n");
      out.write("                width: 120px;\n");
      out.write("            }\n");
      out.write("            .TableData .tong {\n");
      out.write("                text-align: right;\n");
      out.write("                font-weight:bold;\n");
      out.write("                text-transform:uppercase;\n");
      out.write("                padding-right: 4px;\n");
      out.write("            }\n");
      out.write("            .TableData .cotSoLuong input {\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            @media print {\n");
      out.write("                @page {\n");
      out.write("                    margin: 0;\n");
      out.write("                    border: initial;\n");
      out.write("                    border-radius: initial;\n");
      out.write("                    width: initial;\n");
      out.write("                    min-height: initial;\n");
      out.write("                    box-shadow: initial;");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
