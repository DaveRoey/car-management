package com.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.pojo.Letter;

/**
 * 包租婆日志记录（杨光）(日志记录)(只需要保存内容和保存路径，调用LogUtil.addLogToTxt()方法)
 * (保存路径问题：需要改：D:\Java\web环境文件\apache-tomcat-7.0.70-windows-x86\apache-tomcat-7.0.70\webapps\carmanager\log)
 *
 * @author Administrator
 */
@Component
@Aspect
public class LetterLog {

    @Pointcut(value = "execution(* com.service.impl.LetterServiceImpl.findLetterByUserNameAndPassword(..))")
    public void pointCut() {

    }

    /**
     * 登陆的记录
     *
     * @param pjo
     * @return
     * @throws Throwable
     */
    @Around("pointCut()")
    public Letter LetterLogin(ProceedingJoinPoint pjo) throws Throwable {
        Object temp = pjo.proceed();

        //声明一个字符串，所有日志信息包含在内
        StringBuffer sb = new StringBuffer();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
        ;
        //记录时间
        sb.append(simpleDateFormat.format(date));


        //获取目标方法的参数
        Object[] o = pjo.getArgs();
        //第一个参数为名字，提取出来,封装到日志

        sb.append(" " + o[0]);

        if (temp == null) {
            sb.append(" " + "登陆失败");

        } else {
            sb.append(" " + "登陆成功");
        }
        System.out.println(sb);
        String PATH_CLASS_ROOT = RenterLog.class.getClassLoader().getResource("").getPath();
        /*项目根路径*/
        String ROOT_Path = PATH_CLASS_ROOT.substring(0, PATH_CLASS_ROOT.length() - "WEB-INF\\classes\\".length());
        String filePath = ROOT_Path+"/log";            //创建log文件夹
        File files = new File(filePath);
        if (!files.exists()) {
            files.mkdirs();
        }
        //创建txt文件
        File file = new File(files, "letterLog.txt");
        if (!file.exists()) {

            file.createNewFile();
        }
        LogUtil.addLogToTxt(sb.toString(), file.getPath());
        return (Letter) temp;
    }


    /**
     * 对发布车位的记录（包租婆）
     */

    public void letterAdd() {


    }

    public void setFilePath() {


    }
}
