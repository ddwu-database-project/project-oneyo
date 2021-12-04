package controller.admin;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import controller.Controller;
import model.dao.MealkitDAO;
import model.dto.Category;
import model.dto.Mealkit;

public class AdminAddMealkitController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MealkitDAO mkDAO = new MealkitDAO();
		if (request.getMethod().equals("GET")) {
			List<Category> catList = mkDAO.findAllCategory();
			request.setAttribute("categories", catList);
			return "/admin/addMealkit.jsp";
		}
				
		String name = null;
		String calorie = null;
		String price = null;
		String fullintro = null;
		String shortintro = null;
		File dir = null;
		String filename = null;
		
		boolean check = ServletFileUpload.isMultipartContent(request);
		//���۵� �������� ���ڵ� Ÿ���� multipart ���� ���θ� üũ�Ѵ�.
		//���� multipart�� �ƴ϶�� ���� ������ ó������ �ʴ´�.
		
		if(check) {//���� ������ ���Ե� ���°� �´ٸ�
			
			// �Ʒ��� ���� �ϸ� Tomcat ���ο� ����� ������Ʈ�� ���� �ؿ� upload ������ ������ 
			ServletContext context = request.getServletContext();
			String path = context.getRealPath("/upload");
			dir = new File(path);
			
			// Tomcat �ܺ��� ������ �����Ϸ��� �Ʒ��� ���� ���� ��η� ���� �̸��� ������
			// File dir = new File("C:/Temp");
			
			if(!dir.exists()) dir.mkdir();
			//���۵� ������ ������ ���� ��θ� �����.
			
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
                //���� ���ۿ� ���� �⺻���� ���� Factory Ŭ������ �����Ѵ�.
                factory.setSizeThreshold(10 * 1024);
                //�޸𸮿� �ѹ��� ������ �������� ũ�⸦ �����Ѵ�.
                //10kb �� �޸𸮿� �����͸� �о� ���δ�.
                factory.setRepository(dir);
                //���۵� �������� ������ ������ �ӽ� ������ �����Ѵ�.                
    
                ServletFileUpload upload = new ServletFileUpload(factory);
                //Factory Ŭ������ ���� ���� ���ε� �Ǵ� ������ ó���� ��ü�� �����Ѵ�.
                upload.setSizeMax(10 * 1024 * 1024);
                //���ε� �� ������ �ִ� �뷮�� 10MB���� ���� ����Ѵ�.
                upload.setHeaderEncoding("UTF-8");
                //���ε� �Ǵ� ������ ���ڵ��� �����Ѵ�.
                                
                List<FileItem> items = (List<FileItem>)upload.parseRequest(request);
                
                //upload ��ü�� ���۵Ǿ� �� ��� �����͸� Collection ��ü�� ��´�.
                for(int i = 0; i < items.size(); ++i) {
                	FileItem item = (FileItem)items.get(i);
                	//commons-fileupload�� ����Ͽ� ���۹����� 
                	//��� parameter�� FileItem Ŭ������ �ϳ��� ����ȴ�.
                	
                	String value = item.getString("UTF-8");
                	//�Ѿ�� ���� ���� �ѱ� ó���� �Ѵ�.
                	
                	if(item.isFormField()) {//�Ϲ� �� �����Ͷ��...                		
                		if(item.getFieldName().equals("name")) name = value;
                		//key ���� name�̸� name ������ ���� �����Ѵ�.
                		else if(item.getFieldName().equals("calorie")) calorie = value;
                		//key ���� id�̸� id ������ ���� �����Ѵ�.
                		else if(item.getFieldName().equals("price")) price = value;
                		//key ���� pw�̸� pw ������ ���� �����Ѵ�.
                		else if(item.getFieldName().equals("fullintro")) fullintro = value;
                		else if(item.getFieldName().equals("shortintro")) shortintro = value;
                	}
                	else {//�����̶��...
                		if(item.getFieldName().equals("uploadfile")) {
                		//key ���� picture�̸� ���� ������ �Ѵ�.
                			filename = item.getName();//���� �̸� ȹ�� (�ڵ� �ѱ� ó�� ��)
                			if(filename == null || filename.trim().length() == 0) continue;
                			//������ ���۵Ǿ� ���� �ʾҴٸ� �ǳ� �ڴ�.
                			filename = filename.substring(filename.lastIndexOf("\\") + 1);
                			//���� �̸��� ������ ��ü ��α��� �����ϱ� ������ �̸� �κи� �����ؾ� �Ѵ�.
                			//���� C:\Web_Java\aaa.gif��� �ϸ� aaa.gif�� �����ϱ� ���� �ڵ��̴�.
                			File file = new File(dir, filename);
                			item.write(file);
                			//������ upload ��ο� ������ �����Ѵ�.
                			//FileItem ��ü�� ���� �ٷ� ��� ������ �� �ִ�.
                		}
                	}
                }
                
			}catch(SizeLimitExceededException e) {
			//���ε� �Ǵ� ������ ũ�Ⱑ ������ �ִ� ũ�⸦ �ʰ��� �� �߻��ϴ� ����ó��
				e.printStackTrace();           
            }catch(FileUploadException e) {
            //���� ���ε�� ���õǾ� �߻��� �� �ִ� ���� ó��
                e.printStackTrace();
            }catch(Exception e) {            
                e.printStackTrace();
            }
			
			request.setAttribute("name", name);
			request.setAttribute("calorie", calorie);
			request.setAttribute("price", price);
			request.setAttribute("fullintro", fullintro);
			request.setAttribute("shortintro", shortintro);
			request.setAttribute("dir", dir);
			HttpSession session = request.getSession();
			session.setAttribute("dir", dir);
			request.setAttribute("filename", filename);
		}
		System.out.println("dir = "+ dir.getPath());
		System.out.println("filename = "+filename);
		System.out.println("name = " + name);
		System.out.println("cal = "+calorie);
		System.out.println("full " +fullintro);
		Category categ = new Category(Integer.parseInt(request.getParameter("category")));
		System.out.println("categ = " + request.getParameter("category"));
		System.out.println("sh = " + shortintro);
		
		Mealkit mealkit;
		mealkit = new Mealkit(request.getParameter("name"),
				Integer.parseInt(request.getParameter("calorie")),
				Integer.parseInt(request.getParameter("price")),
				new Category(Integer.parseInt(request.getParameter("category"))),
				request.getParameter("fullintro"),
				request.getParameter("shortintro"),
				dir.getPath(), filename
				);
		mkDAO.create(mealkit);
		
		return "redirect:/admin/mealkit/list";
		
	}

}
