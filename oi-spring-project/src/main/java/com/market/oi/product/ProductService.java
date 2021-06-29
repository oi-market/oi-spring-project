package com.market.oi.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.oi.location.LocationMapper;
import com.market.oi.member.MemberVO;
import com.market.oi.myPage.MywishVO;
import com.market.oi.util.Pager;
import com.market.oi.util.ProductFileManager;


@Service
public class ProductService {

	@Autowired
	ProductMapper productMapper;
	@Autowired
	LocationMapper locationMapper;
	@Autowired
	private ProductFileManager fileManager;
	@Autowired
	private HttpServletRequest request;
	
	
	public int setDeleteProduct(ProductFilesVO productFilesVO,ProductVO productVO)throws Exception{
		
	
		List<ProductFilesVO> ar = productMapper.getFileSelect(productFilesVO);
		int result=productMapper.setDeleteProduct(productVO);
		result=productMapper.setDeleteFile(productFilesVO);
	
		
//		파라미터를 멀로 넘길까 ,, 둘다 productㅖPk로 넘기면 디비는 해결,,

			
		for(ProductFilesVO vo : ar) {
		
			fileManager.deleteFile(vo.getThumbnail(), request);
		}
		
		return result;
	}
	
	public int setProductUpdate(ProductVO productVO,MultipartFile[] files)throws Exception{
		
		int result = productMapper.setProductUpdate(productVO);
		
		if(files!=null) {
			System.out.println(files);
			for(MultipartFile mf: files) {
						
						ProductFilesVO productFileVO = new ProductFilesVO();
						String fileName = fileManager.uploadFile( mf,request);	
						
						//오토 인크리먼트 된걸 여기 넣어줘야함
						productFileVO.setProductNum(productVO.getNum());
						productFileVO.setThumbnail(fileName);
						String uuidFileName = fileName.substring(0, 12) + fileName.substring(14);
						
						productFileVO.setFileName(uuidFileName);
						productFileVO.setOgName(mf.getOriginalFilename());
						productMapper.setFileInsert(productFileVO);
									
					}
		}
			
		
		return result;
	}
	
	
	public int setProductInsert(ProductVO productVO,MultipartFile[] files)throws Exception{
		

		
		int result = productMapper.setProductInsert(productVO);
		
		productVO.setNum(productMapper.getProductNum()-1);
		System.out.println(productVO);
		System.out.println(productVO.getNum());
		
		//productVO에 들어간 ,, 오토인크리먼트를불러와야된다 ,,,
		
		
		for(MultipartFile mf: files) {
			
			ProductFilesVO productFileVO = new ProductFilesVO();
			String fileName = fileManager.uploadFile( mf,request);	
			
			//오토 인크리먼트 된걸 여기 넣어줘야함
			productFileVO.setProductNum(productVO.getNum());
			productFileVO.setThumbnail(fileName);
			String uuidFileName = fileName.substring(0, 12) + fileName.substring(14);
			
			productFileVO.setFileName(uuidFileName);
			productFileVO.setOgName(mf.getOriginalFilename());
			productMapper.setFileInsert(productFileVO);
						
		}
		
		
		
		return result;
	}

	public ProductVO getProductSelect(ProductVO productVO)throws Exception{
		int result = productMapper.setHitUpdate(productVO);
		return productMapper.getProductSelect(productVO);
	}
	
	public Long getTotalCount(Authentication auth,
							MemberVO memberVO,
							Pager pager
							,ProductVO productVO)throws Exception{
		
		UserDetails user = (UserDetails)auth.getPrincipal();
		memberVO = (MemberVO)user;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member",memberVO);
		map.put("pager",pager);
		if(productVO.getCategoryNum()==0){
			productVO= null;
		}
		map.put("product",productVO);
		
		return productMapper.getTotalCount(map);

	}
	
	
	public List<ProductVO> getProductList(Authentication auth,
			MemberVO memberVO,
			Pager pager,
			ProductVO productVO)throws Exception{
		
		pager.makeRow();
		pager.makeNum(getTotalCount(auth, memberVO, pager, productVO));
		pager.setPerPage(12L);
		
		//로그인 한 멤버의 location을 가져옴
		UserDetails user = (UserDetails)auth.getPrincipal();
		memberVO = (MemberVO)user;
		
		if(productVO.getCategoryNum()==0){
			productVO= null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member",memberVO);
		map.put("pager",pager);
		map.put("product",productVO);
		
		
		
		
		List<ProductVO> ar = productMapper.getProductList(map);
		
		return ar;
	}
	
	public List<ProductVO> getPopularList()throws Exception{
		List<ProductVO> ar = productMapper.getPopularList();		
		return ar;
	}
	
	
	public ProductFilesVO getFileSelectFromFileNum(ProductFilesVO productFilesVO)throws Exception{
		return productMapper.getFileSelectFromFileNum(productFilesVO);
	}
	public int setDeleteFileOne(ProductFilesVO productFilesVO)throws Exception{
		fileManager.deleteFile(productFilesVO.getThumbnail(), request);
		
		return productMapper.setDeleteFileOne(productFilesVO);
	}

	
	public int setWish(ProductVO productVO,Authentication auth)throws Exception{
		
		long result=0;
		productVO = productMapper.getProductSelect(productVO);
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMemberVO = (MemberVO)user;
		
		//위시리스트에 내 아이디를 넘기기 위해 productVO에 내 아이디 담음
		productVO.setUsername(sessionMemberVO.getUsername());
		
		//if - 위시리스트에 몇개 있나 있긴 한가 확인
		result = productMapper.getWishExist(productVO);

		if(result==0) {
			System.out.println("마이위시 1개 이상  -> 겹치는게 없으니까 넣어주면 댐");
			result = productMapper.setWish(productVO);
			result = productMapper.setWishUp(productVO);
		}else {
			System.out.println("있음,, 넣어주면 안됨 ,,");
		}
		
		return 0;
		
		
	}
	
	
}
