package com.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.pojo.Renter;

/**
 * 租客的日记记录（杨光）
 *
 * @author Administrator
 */
@Component
@Aspect
public class RenterLog {

    @Pointcut(value = "execution(* com.service.impl.RenterServiceImpl.findRenterByUserNameAndPassword(..))")
    public void pointCut1() {

    }

    @Around("pointCut1()")
    public Renter renteLogLogin(ProceedingJoinPoint pjo) throws Throwable {

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
        //System.out.println(Class.class.getClass().getResource("").getPath());;

        System.out.println(System.getProperty("user.dir"));
        String PATH_CLASS_ROOT = RenterLog.class.getClassLoader().getResource("").getPath();
        /*项目根路径*/
        String ROOT_Path = PATH_CLASS_ROOT.substring(0, PATH_CLASS_ROOT.length() - "WEB-INF\\classes\\".length());
        String filePath = ROOT_Path+"/log";
        //创建log文件夹
        File files = new File(filePath);
        if (!files.exists()) {
            files.mkdirs();

        }
        //创建txt文件
        File file = new File(files, "renterLog.txt");
        if (!file.exists()) {

            file.createNewFile();
        }


        LogUtil.addLogToTxt(sb.toString(), file.getPath());
        return (Renter) temp;


    }
}
