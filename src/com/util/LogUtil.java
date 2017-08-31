package com.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;



public class LogUtil {		
	/**
	 * 将日志写成txt文件放在本地文件夹中（杨光）
	 * @param LogMessage 日志内容（每操作一次就会往日志文件中追加一条记录）
	 * @param filePath  文件地址（不同的用户类型有不同的日记记录文件：包租婆，租客，管理员）
	 * @throws IOException 
	 */
	public static void addLogToTxt(String LogMessage,String filePath) throws IOException{
        FileWriter writer=null;
        BufferedWriter bw=null;
		try {
			//如果文件不存在，创建该文件
			File file=new File(filePath);
	        if(!file.exists()){
	     	   file.createNewFile();
	        }
	           //true表示追加字符
	            writer = new FileWriter(file,true);
	             bw = new BufferedWriter(writer);
          //隔行记录
	            bw.write(LogMessage);
	           bw.newLine();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			//关闭文件流
			if(bw!=null)
	           bw.close();
			if(writer!=null)
	            writer.close();
		}
		
	}
}
