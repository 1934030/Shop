package com.shop.util;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.shop.core.CoreUtil;
import com.shop.model.Log;
import com.shop.model.Page;
import com.shop.model.Product;

/**
 * 辅助工具类 提供包括获取当前时间格式化、日志插入、ip获取等内容
 */
public class ToolsUtil {

    /**
     * 获取当前时间并对时间格式化，以您传入的“time_format”自定义的时间格式输出
     *
     * @param time_format 传入的要显示的时间格式，如:"yyyy-MM-dd hh:mm:ss"
     *                    注意:“hh”是12小时制，“HH”为24小时制
     * @param index       为正表示当前时间加天数，为负表示当前时间减天数，为0表示不加减
     */
    public static String getTime(String time_format, int index) {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat(time_format);
        if (index != 0) {
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH, index);
            return format.format(calendar.getTime());
        }
        return format.format(date);
    }

    /**
     * 用户日志记录
     *
     * @param id:操作者id
     * @param descb:操作内容
     */
    public static Log insertLog(Integer id, String descb) {
        Log log = new Log();
        log.setUid(id); // 当管理员操作时如何改变?setAdminid
        log.setDescb(descb);
        log.setBytime(getTime("yyyy-MM-dd HH:mm:ss", 0));
        return log;
    }

    /*
     * */
    public static String getContextPath() {
        HttpServletRequest request = CoreUtil.getRequest();
        return request.getContextPath();
    }

    /**
     * 创建分页
     * 创建Page对象 everyPage:每页记录数 totalCount:获取总记录数 currentPage:当前页 totalPage:总页数
     * beginIndex:查询起始点 hasPrePage:是否有上一页 hasNextPage:是否有下一页
     */
    public static Page createPage(int everyPage, int totalCount, int currentPage, Integer pclassid) {// 创建分页信息对象
        everyPage = getEveryPage(everyPage);// servlet中已设置int everyPage = ?;
        currentPage = getCurrentPage(currentPage);// 同上，已设置
        int totalPage = getTotalPage(everyPage, totalCount);// 由下方辅助方法生成，总页数 = 总记录数 / 每页记录数（有余数页码 + 1）
        int beginIndex = getBeginIndex(everyPage, currentPage);// 查询起始点 = （当前页-1）* 每页记录数
        boolean hasPrePage = getHasPrePage(currentPage);// 当前页为 1 没有上一页
        boolean hasNextPage = getHasNextPage(totalPage, currentPage);// 当前页=总页数或总页数为 0 没有下一页
        return new Page(everyPage, totalCount, totalPage, currentPage, beginIndex, hasPrePage, hasNextPage, pclassid);
    }

    /**
     * 创建加载页面
     *
     * @param everyPage:一页显示多少数据，也是limit   n,m中的m部分
     * @param currentPage:当前页，由点击上下页按钮控制加减
     * @param id:用户或管理员id
     */
    public static Page createLoad(int everyPage, int totalCount, int currentPage, int id) {
        everyPage = getEveryPage(everyPage);
        currentPage = getCurrentPage(currentPage);
        int totalPage = getTotalPage(everyPage, totalCount);//总页数
        int beginIndex = getBeginIndex(everyPage, currentPage);//查询起始点，也是limit   n,m中的n部分
        boolean hasNextPage = getHasNextPage(totalPage, currentPage);//是否有下一页
        return new Page(everyPage, totalCount, totalPage, currentPage, beginIndex, hasNextPage, id);
    }

    // 以下方法辅助创建Page对象
    private static int getEveryPage(int everyPage) { // 获得每页显示记录数
        return everyPage == 0 ? 10 : everyPage;// 如果每页显示记录数为0 则显示10个记录
    }

    private static int getCurrentPage(int currentPage) { // 获得当前页
        return currentPage == 0 ? 1 : currentPage;
    }

    private static int getTotalPage(int everyPage, int totalCount) { // 获得总页数
        int totalPage;
        if (totalCount != 0 && totalCount % everyPage == 0) {
            totalPage = totalCount / everyPage;
        } else {
            totalPage = totalCount / everyPage + 1;
        }
        return totalPage;
    }

    private static int getBeginIndex(int everyPage, int currentPage) {// 获得起始位置
        return (currentPage - 1) * everyPage;
    }

    private static boolean getHasPrePage(int currentPage) {// 获得是否有上一页
        return currentPage != 1;
    }

    private static boolean getHasNextPage(int totalPage, int currentPage) { // 获得是否有下一页
        return currentPage != totalPage && totalPage != 0;
    }    // 辅助创建Page对象方法结束

    /**
     * 将请求参数还原为key=value的形式
     */
    public static String getQueryString(Map params) {
        StringBuffer queryString = new StringBuffer(256);
        Iterator it = params.keySet().iterator();
        int count = 0;
        while (it.hasNext()) {
            String key = (String) it.next();
            String[] param = (String[]) params.get(key);
            for (String aParam : param) {
                if (count == 0) {
                    count++;
                } else {
                    queryString.append("&");
                }
                queryString.append(key);
                queryString.append("=");
                try {
                    queryString.append(URLEncoder.encode((String) aParam, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    return queryString.toString();
                }
            }
        }
        return queryString.toString();
    }

    /**
     * 获得请求的路径及参数
     */
    protected static String getRequestURL(HttpServletRequest request) {
        /* request.getServletPath()会获取当前请求的地址，但是不会反回参数，因此要对带参的地址处理 */
        String servletPath = request.getServletPath();
        String[] strings = servletPath.split("/");
        StringBuffer originalURL = new StringBuffer(strings[2]);
        /* request.getParameterMap()会获取提交的所有带参数据，封装在 Map 中 */
        Map parameters = request.getParameterMap();
        if (parameters != null && parameters.size() > 0) {
            originalURL.append("?");
            originalURL.append(getQueryString(parameters));
        }

        return originalURL.toString();
    }

    /**
     * 图片上传的方法
     */
    public static String upPic(String path, MultipartFile profile, Product pro_info) {
        String fileName;
        String oldFileName = profile.getOriginalFilename();
        String prefix = FilenameUtils.getExtension(oldFileName);
        int filesize = 900000;
        if (profile.getSize() > filesize) {
            return "* 上传文件大小不得超过900KB！";
        } else if (prefix.equalsIgnoreCase("jpg")
                || prefix.equalsIgnoreCase("png")
                || prefix.equalsIgnoreCase("jpeg")
                || prefix.equalsIgnoreCase("pneg")) {
            Random random = new Random();
            fileName = System.currentTimeMillis() + random.nextInt(100000) * 100 + "_Product.jpg";
            File targetFile = new File(path, fileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            try {
                profile.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
                return "* 上传失败！";
            }
        } else {
            return "* 图片上传格式不正确！";
        }
        String oldHeadimgPath = pro_info.getPimg();
        String delpath = path + File.separator + oldHeadimgPath;
        //如果不是默认图片则删除
        if (oldHeadimgPath != null && !oldHeadimgPath.equals("1571486776174_Product.jpg")) {
            //拿到图片地址，把本地图片删除
            File f1 = new File(delpath);
            f1.delete();
        }
        pro_info.setPimg(fileName);
        return null;
    }

    /**
     * 获取用户真实ip 此方法需要在用户发出http请求时调用才能返回ip信息
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (null == ip || 0 == ip.length() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (null == ip || 0 == ip.length() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (null == ip || 0 == ip.length() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (null == ip || 0 == ip.length() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}
