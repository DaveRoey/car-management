package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.dao.LetterDao;
import com.dao.RentPortDao;
import com.dao.RenterDao;
import com.mapper.RentPortMapper;
import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;
import com.pojo.RentPort;
import com.pojo.Renter;
import com.service.RentPortService;

@Service
public class RentPortServiceImpl implements RentPortService {

	@Resource
	private RentPortDao rentportDao;
	@Resource
	private LetterDao letterDao;
	
	@Resource
	private RentPortMapper rentPortMapper;
	@Resource
	private RenterDao renterDao;
	@Override
	public void addRentPort(RentPort rentPort) {
		// TODO Auto-generated method stub

	}

	@Override
	public int removeRentPort(int rentId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RentPort> findRentPortByRentId(int rentId) {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override 
	public int modifyRentPort(RentPort rentPort) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 包租婆
	 */
	@Override
	public Page getApplyPage(int currentPage, int letterId) {
		Letter letter = letterDao.findOne(letterId);
		Page page =new Page();
		page.setTotalRecord(getTotalCount(0,letter));//rentState and letterId
		page.setCurrentPage(currentPage);
		PageRequest request=new PageRequest(page.getCurrentPage()-1, page.getPageSize());
		System.out.println("service ****************"+currentPage);
		
		List<RentPort> list =  getLetterPage(page,0,letter); 
		page.setList(list);
		return page;
	}
	/**
	 * 包租婆
	 * 
	 * @param page
	 * @param rentState
	 * @param letter
	 * @return
	 */
	private List<RentPort> getLetterPage(Page page, int rentState, Letter letter) {
		PageRequest request=new PageRequest(page.getCurrentPage()-1, page.getPageSize());
		List<RentPort> list=rentportDao.findRentPortsByCarPortLetterLetterIdAndRentState(letter.getLetterId(), request,rentState);
		return list;
	}
    private List<RentPort> getRenterInfoByHisId(Renter renter,Page page){
    	PageRequest request = new PageRequest(page.getStartIndex(),page.getPageSize());
    	List<RentPort> theList=rentportDao.findRentPortsByRenterRenterIdAndRentStateBetween(renter.getRenterId(), request,0,2);
    	   return theList;
    }
    private List<RentPort> getRenterRecordByHisId(Renter renter,Page page){
    	PageRequest request = new PageRequest(page.getStartIndex(),page.getPageSize());
    	List<RentPort> list=rentportDao.findRentPortsByRenterRenterIdAndRentState(renter.getRenterId(),request,3);
    	 return list;
    }
    /**
     * 包租婆
     * 
     * @param rentState
     * @param letter
     * @return
     */
	private int getTotalCount(int rentState, Letter letter) {
		
		return rentportDao.countByRentStateAndCarPortLetterLetterId(rentState,letter.getLetterId());
	}
     private int getTotalCount(Renter renter){
    	 return rentportDao.countByRenter(renter);
     }

	@Override
	public Page getRenterApplyPage(int currentPage, int renterId) {
		// TODO Auto-generated method stub
		Renter renter = renterDao.findOne(renterId);
		Page page= new Page();
		page.setPageSize(getTotalCount(renter));
		PageRequest request = new PageRequest(page.getStartIndex(),page.getPageSize());
		page.setTotalPage(getTotalCount(renter));
		page.setCurrentPage(currentPage);
	    List<RentPort> list= getRenterInfoByHisId(renter,page);
	    page.setList(list);
		return page;
	}

	@Override
	public void EndTheTrasaction(int rentId) {
		// TODO Auto-generated method stub
		rentPortMapper.changeRentPort(rentId);
	}

	@Override
	public void reSendRequest(int rentId, String message) {
		// TODO Auto-generated method stub
		rentPortMapper.modifyRentPort(rentId, message);
	}

	@Override
	public void letterOption(int rentId, String answer, int rentState) {
		RentPort rentPort = rentportDao.findOne(rentId);
		if(rentState==1) {
			rentPort.setDescribes(rentPort.getRenter().getRealName() + "租了" + rentPort.getCarPort().getLetter().getRealName() + "的车位");
		}
		rentPort.setRentState(rentState);
		rentPort.setAnswer(answer);
		rentPortMapper.updateRentPort(rentPort);

	}

	@Override
	public Page getRenterRecordPage(int currentPage, int renterId) {
		// TODO Auto-generated method stub
		Renter renter = renterDao.findOne(renterId);
		Page page= new Page();
	
		PageRequest request = new PageRequest(page.getStartIndex(),page.getPageSize());
		page.setTotalPage(getTotalCount(renter));
		page.setCurrentPage(currentPage);
		 List<RentPort> list=getRenterRecordByHisId(renter,page);
		 page.setList(list);
		return page;
	}

}
