package com.team01.myapp.util;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Pager {
	
	//행 글번호 : 1  제목: 제목 글쓴이: 누구 
	//페이지 << "1" .........>>
	//그룹 << 1, 2, 3, 4, 5, >>
	private int totalRows;		//전체 행수
	private int totalPageNo;	//전체 페이지 수
	private int totalGroupNo;	//전체 그룹 수
	private int startPageNo;	//그룹의 시작 페이지 번호
	private int endPageNo;		//그룹의 끝 페이지 번호
	private int pageNo;			//현재 페이지 번호
	private int pagesPerGroup = 5;//그룹당 페이지 수
	private int groupNo;		//현재 그룹 번호
	private int rowsPerPage = 5;//페이지당 행 수//->사용자 입력을 받을 수도 있다 
	private int startRowNo;		//페이지의 시작 행 번호(1, ..., n) //->1번부터 시작 (Oracle) 
	private int startRowIndex;	//페이지의 시작 행 인덱스(0, ..., n-1) for mysql //->0번부터 시작 (MariaDB, MySQL) 
	private int endRowNo;		//페이지의 마지막 행 번호
	private int endRowIndex;	//페이지의 마지막 행 인덱스
	
	//	생성자 	 페이지에 나올 행수 | <<1,2,3,4,5>>의 수 | 페이징 대상행수 | 보여줄 페이지 (사용자 제공) 
	public Pager(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerGroup = pagesPerGroup;
		this.totalRows = totalRows;
		this.pageNo = pageNo;

		totalPageNo = totalRows / rowsPerPage;
		if(totalRows % rowsPerPage != 0) totalPageNo++;
		
		totalGroupNo = totalPageNo / pagesPerGroup;
		if(totalPageNo % pagesPerGroup != 0) totalGroupNo++;
		
		groupNo = (pageNo - 1) / pagesPerGroup + 1;
		
		startPageNo = (groupNo-1) * pagesPerGroup + 1;
		
		endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNo) endPageNo = totalPageNo;
		
		startRowNo = (pageNo - 1) * rowsPerPage + 1;
		startRowIndex = startRowNo - 1;
		endRowNo = pageNo * rowsPerPage;
		endRowIndex = endRowNo - 1; 
	}

	@Override
	public String toString() {
		return "Pager [totalRows=" + totalRows + ", totalPageNo=" + totalPageNo + ", totalGroupNo=" + totalGroupNo
				+ ", startPageNo=" + startPageNo + ", endPageNo=" + endPageNo + ", pageNo=" + pageNo
				+ ", pagesPerGroup=" + pagesPerGroup + ", groupNo=" + groupNo + ", rowsPerPage=" + rowsPerPage
				+ ", startRowNo=" + startRowNo + ", startRowIndex=" + startRowIndex + ", endRowNo=" + endRowNo
				+ ", endRowIndex=" + endRowIndex + "]";
	}
	
	/*객체 생성
	 * Pager pager = new Pager(10, 5, ?, ?) 
	 * totalRows는 DB에서 가져와야한다
	 * pageNo은 클라이언트에서 넘어온 값을 넣는다
	 * 
	 * ->필드의 값이 초기화되면서 세팅된다 
	 * 
	 * 필드값이용
	 * ui 페이징 네비게이션을 만들때 쓴다
	 * 다음을 눌렀을때 어떤 데이터를 넘길 것인지 결정 
	 * 
	 * 우리프로젝트에서 활용
	 * DB와 동기화가 잘 돼야한다
	 * 페이징대상이 되는 행 수는 고정되어있지 않다 
	 * 사용자가 다음 페이지를 클릭했을 때 반영된 행 수를 가지고 다시 페이징을 해야한다
	 * 클라이언트가 요청할 때마다 페이저를 새로 만들어야한다
	 * 
	 * [ 맨앞 이전 1, 2, 3, 4, 5 다음 맨끝 ]
	 *  일 때 입력을 받고 어떤 것을 입력을 하더라도 
	 *  페이지 번호를 넘겨야한다  
	 *  ex ) Client. java
	 *  createRequestJsonProductList( pageNo )
	 *  ->Json 생성
	 *  Json이 서버로 전송된다 
	 *  "command": "productList",
	 *  "data" : {"pageNo" : 3 , "where" : 조건값, ... }
	 *  
	 *  사용자가 맨앞을 눌렀다면 pageNo은 1
	 *  1그룹이면 이전이 출력되지 않게한다
	 *  1,2,3,4,5 클릭 - > pageNo = 그대로 pageNo
	 *  맨끝 ->  pageNo = totalPageNo
	 *  다음 -> 6,7,8,9,10 출력 (현재그룹의 맨 마지막 번호+1) endPageNo+1 | 
	 *  이전 -> 현재 6이라면 startPageNo-1을 페이지 넘버로 요청
	 * 
	 * 뭘하든 페이지넘버를 결정해서 보내줘야한다 
	 *  
	 *  Controller.java >> 데이터 얻기, 변환(json <-> DTO), 유효성 검사 
	 *  void HandleJson(JSONObject json){
	 *  JSONObject root = new JSONObject(json);
	 *  string command = root.getString("command");
	 *  if(command.equals("productList") {
	 *  	ProductService ps = new ProductService();
	 *  	Pager pager = new Pager(10, 5, totalRows = ps.getTotalRows(),pageNo);
	 *  	int pageNo = root.getJsonObject("data").getInt("pageNo");
	 *  	List<Product> list = ps.getProductList(pager); //pager를 통해서 적절한 DTO를 얻었다!
	 *  	
	 *  	이제 pager와 List<Product>를 어떻게 json으로 바꿔서 보내줄 것인가
	 *  	{	
	 *  		"result" : "productList" , 
	 *  		"data" : { "productList" : [{하나의Product}, {product},....]}, 
	 *  		"pager" : {"totalRows":1000,"totalPageNo" : 100 , .....,"endPageNo":10}	
	 * 		 }
	 * 
	 * 		받은 json으로 사용자 view갱신
	 *  
	 * 
	 *  	server.send(json);
	 *  }
	 *  
	 *  service 와Controller DAO를 싱글톤 패턴으로 처리하자 
	 *  ProductService ps = ProductService.getInstance();
	 *  String json = ps.getProductList();
	 *  
	 *  
	 *  }
	 */
}







