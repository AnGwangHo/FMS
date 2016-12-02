package com.cz.fms.member.controller;

public class registImageController {

/**//** 파일 저장 위치 *//*
	// private String fileRepository =
	// "E:/KOSTA126/workspace/Project_ShoppingMall/WebContent/product_images";
	private String fileRepository;
	private ProductService productService = ProductServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();

		fileRepository = this.getClass().getResource("/").getPath();
		// fileRepository = fileRepository.substring(0,
		// fileRepository.indexOf("WEB-INF")) + "product_images/";
		fileRepository = fileRepository.substring(0, fileRepository.indexOf(".metadata"))
				+ "Project_ShoppingMall/WebContent/product_images/";

		System.out.println(fileRepository);
		// 아파치 파일 업로드 API를 이용한 파일 수신 및 서버 디렉토리에 저장
		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		fileUpload.setSizeMax(15 * 1024 * 1024); // 업로드 파일 용량 제한

		List<FileItem> fileList = null;
		Product product = new Product();

		try {
			fileList = fileUpload.parseRequest(request);

			// 파일 경로 먼저 찾기
			for (FileItem item : fileList) {
				if (item.isFormField()) {
					if (item.getFieldName().equalsIgnoreCase("type")) {
						product.setProductType(Integer.parseInt(item.getString("utf-8")));
						switch (product.getProductType()) {
						case 1:
						case 5:
							fileRepository += "mtb/";
							break;
						case 2:
						case 6:
							fileRepository += "road/";
							break;
						case 3:
						case 7:
							fileRepository += "hybrid/";
							break;
						case 4:
						case 8:
							fileRepository += "kids/";
							break;
						}
					}
				}
			}

			for (FileItem item : fileList) {
				// ParameterName=ParameterValue
				if (item.isFormField()) {
					// 물품 가격
					if (item.getFieldName().equalsIgnoreCase("price")) {
						product.setPrice(Integer.parseInt(item.getString("utf-8")));
					}
					// 물품 이름
					else if (item.getFieldName().equalsIgnoreCase("name")) {
						product.setProductName(item.getString("utf-8"));
					}
					// 물품 판매 이름
					else if (item.getFieldName().equalsIgnoreCase("title")) {
						product.setProductTitle(item.getString("utf-8"));
					}
					// 물품 설명
					else if (item.getFieldName().equalsIgnoreCase("summary")) {
						product.setSummary(item.getString("utf-8"));
					}
				}
				// 업로드 파일인 경우
				else {
					String fileName = item.getName();
					product.setProductImage(fileName);
					System.out.println("업로드 파일명: " + fileName);
					// fileName = c:\xxx\yyy\업로드파일명
					String[] tokens = fileName.split("\\\\");
					fileName = tokens[tokens.length - 1];// 파일명만 추출
					long fileSize = item.getSize();
					System.out.println("파일사이즈: " + fileSize);

					// 업로드된 파일을 서버의 특정 디렉토리에 저장
					File saveFile = new File(fileRepository + fileName);
					item.write(saveFile);
				}
			}
		} catch (Exception e) {
			new ServletException(e.getMessage());
		}

		// 파일 업로드완료, DB에 저장
		productService.setProduct(product);
		System.out.println("업로드 완료");

		return mav;
	}*/
}
