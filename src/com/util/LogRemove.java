package com.util;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.io.File;

/**
 * 定期删除日志文件（txt）(杨光)
 * @author Administrator
 *
 */
public class LogRemove extends QuartzJobBean{

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		// TODO Auto-generated method stub
		//System.out.println("运行了调度器");
		String PATH_CLASS_ROOT = RenterLog.class.getClassLoader().getResource("").getPath();
        /*项目根路径*/
		String ROOT_Path = PATH_CLASS_ROOT.substring(0, PATH_CLASS_ROOT.length() - "WEB-INF\\classes\\".length());
		String filePath = ROOT_Path+"/log";
		File file=new File(filePath);
		//如果log文件夹存在的话，就删除文件目录下的所有文件
		if(file.exists()){
			
			File [] list=file.listFiles();
			
			for (File file2 : list) {
				file2.delete();
			}
		}
		
	}

}
