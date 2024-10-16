package com.projeto.upload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

/**
 * Servlet implementation class UploadDeArquivo
 */

@MultipartConfig
public class UploadDeArquivo extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadDeArquivo() {
    	
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  // TODO Auto-generated method stub
    	  //doGet(request, response);
    	  //String path = CAMINHO_FIXO; // caso deseje criar um path fixo
    	  String msg = "Arquivo enviado com sucesso";
    	  String path = getServletContext().getRealPath("produto/imagem");
    	  String arquivo = null;
    	  String prodId = request.getParameter("id");
    	  
    	  try {
    	    for (Part part : request.getParts()) {
    	             if (part.getName().equals("file")) {
    	                 // Verificar o tamanho do arquivo
    	                 if (part.getSize() > 2 * 1024 * 1024) { // 2 MB em bytes
    	                     msg = "O arquivo excede o tamanho máximo permitido (2 MB)";
    	                 } else {
    	                     // Verificar o tipo de arquivo
    	                     String contentType = part.getContentType();
    	                     if (contentType.equals("image/jpeg") || contentType.equals("image/png")) {
    	                         part.write(path + File.separator + part.getSubmittedFileName());
    	                         arquivo = part.getSubmittedFileName();
    	                     } else {
    	                         msg = "Tipo de arquivo não suportado. Apenas arquivos JPEG e PNG são permitidos.";
    	                     }
    	                 }
    	             }
    	         }
    	  } catch(Exception e) {
    	    System.out.println(e.getMessage());
    	    msg = "Erro ao enviar o arquivo";
    	  }
    	  request.setAttribute("msg", msg);
    	  request.setAttribute("arquivo", arquivo);
    	  request.setAttribute("prodId", prodId);
    	  request.getRequestDispatcher("arquivo.jsp").forward(request, response);
    	  
    	}

}
