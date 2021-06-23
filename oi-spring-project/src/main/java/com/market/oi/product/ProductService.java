package com.market.oi.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.oi.location.LocationMapper;
import com.market.oi.location.LocationVO;
import com.market.oi.member.MemberVO;
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
		
		
		
		return 0;
	}

	public ProductVO getProductSelect(ProductVO productVO)throws Exception{
		return productMapper.getProductSelect(productVO);
	}
	
	
	
	public List<ProductVO> getProductList(Authentication auth)throws Exception{
		
		List<ProductVO> ar = productMapper.getProductList();
		//ar은 db에 있는 모든 제품을 가져옴
		
		//거리에 따라 비교해야겠지
		Double distance=0.0;
		
		//로그인 한 멤버의 location을 가져옴
		
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		LocationVO memberLocationVO = new LocationVO();
		memberLocationVO.setLocation(sessionMember.getLocation());
		memberLocationVO = locationMapper.searchLocation(memberLocationVO);
		Double x1 = memberLocationVO.getWgs84X();
		Double y1 = memberLocationVO.getWgs84Y();
		
		//반복문을 돌려 리스트 안의 vo 즉 각각의 상품과 멤버와의 거리를 비교해 일정 거리 이상일 경우 리스트에서 제거 
		for(ProductVO vo : ar) {
			LocationVO productLocationVO = new LocationVO();
			productLocationVO.setLocation(vo.getLocation());
			productLocationVO = locationMapper.searchLocation(productLocationVO);
			Double x2 = productLocationVO.getWgs84X();
			Double y2 = productLocationVO.getWgs84Y();
			
			distance = this.getDistance(x2, y2, x1, y1);
			
			//50km 이상일 경우 제거, 50을 파라미터로 위에서 변수로 받으면 거리 기준 바꾸기 가능할듯
			if(distance > 50) {
				ar.remove(vo);
			}
			
		}
		
		
		
		return ar;
	}
	
	
	public List<ProductVO> getProductSeparatedList(Authentication auth, ProductVO productVO)throws Exception{
		
		List<ProductVO> ar = productMapper.getProductSeparatedList(productVO);
		//ar은 db에 있는 모든 제품을 가져옴
		
		//거리에 따라 비교해야겠지
		Double distance=0.0;
		
		//로그인 한 멤버의 location을 가져옴
		
		UserDetails user = (UserDetails)auth.getPrincipal();
		MemberVO sessionMember = (MemberVO)user;
		
		LocationVO memberLocationVO = new LocationVO();
		memberLocationVO.setLocation(sessionMember.getLocation());
		memberLocationVO = locationMapper.searchLocation(memberLocationVO);
		Double x1 = memberLocationVO.getWgs84X();
		Double y1 = memberLocationVO.getWgs84Y();
		
		//반복문을 돌려 리스트 안의 vo 즉 각각의 상품과 멤버와의 거리를 비교해 일정 거리 이상일 경우 리스트에서 제거 
		for(ProductVO vo : ar) {
			LocationVO productLocationVO = new LocationVO();
			productLocationVO.setLocation(vo.getLocation());
			productLocationVO = locationMapper.searchLocation(productLocationVO);
			Double x2 = productLocationVO.getWgs84X();
			Double y2 = productLocationVO.getWgs84Y();
			
			distance = this.getDistance(x2, y2, x1, y1);
			
			//50km 이상일 경우 제거, 50을 파라미터로 위에서 변수로 받으면 거리 기준 바꾸기 가능할듯
			if(distance > 50) {
				ar.remove(vo);
			}
			
		}
		
		
		
		return ar;
	}
	
	
	
	
	public Double deg2rad(Double deg) {
		return deg * (Math.PI/180);
	}
	
	//wgs84좌표계에서 거리를 km로 변환
	public Double getDistance(Double lat1,Double lng1,Double lat2,Double lng2) {
		
		Double R = 6371.0;
		Double dLat = deg2rad(lat2-lat1);  // deg2rad below
		Double dLon = deg2rad(lng2-lng1);
		Double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
		Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    Double d = R * c; // Distance in km
		    return d;
	}
	
	
	
	
}
