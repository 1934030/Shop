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
 * ���������� �ṩ������ȡ��ǰʱ���ʽ������־���롢ip��ȡ������
 */
public class ToolsUtil {

    /**
     * ��ȡ��ǰʱ�䲢��ʱ���ʽ������������ġ�time_format���Զ����ʱ���ʽ���
     *
     * @param time_format �����Ҫ��ʾ��ʱ���ʽ����:"yyyy-MM-dd hh:mm:ss"
     *                    ע��:��hh����12Сʱ�ƣ���HH��Ϊ24Сʱ��
     * @param index       Ϊ����ʾ��ǰʱ���������Ϊ����ʾ��ǰʱ���������Ϊ0��ʾ���Ӽ�
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
     * �û���־��¼
     *
     * @param id:������id
     * @param descb:��������
     */
    public static Log insertLog(Integer id, String descb) {
        Log log = new Log();
        log.setUid(id); // ������Ա����ʱ��θı�?setAdminid
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
     * ������ҳ
     * ����Page���� everyPage:ÿҳ��¼�� totalCount:��ȡ�ܼ�¼�� currentPage:��ǰҳ totalPage:��ҳ��
     * beginIndex:��ѯ��ʼ�� hasPrePage:�Ƿ�����һҳ hasNextPage:�Ƿ�����һҳ
     */
    public static Page createPage(int everyPage, int totalCount, int currentPage, Integer pclassid) {// ������ҳ��Ϣ����
        everyPage = getEveryPage(everyPage);// servlet��������int everyPage = ?;
        currentPage = getCurrentPage(currentPage);// ͬ�ϣ�������
        int totalPage = getTotalPage(everyPage, totalCount);// ���·������������ɣ���ҳ�� = �ܼ�¼�� / ÿҳ��¼����������ҳ�� + 1��
        int beginIndex = getBeginIndex(everyPage, currentPage);// ��ѯ��ʼ�� = ����ǰҳ-1��* ÿҳ��¼��
        boolean hasPrePage = getHasPrePage(currentPage);// ��ǰҳΪ 1 û����һҳ
        boolean hasNextPage = getHasNextPage(totalPage, currentPage);// ��ǰҳ=��ҳ������ҳ��Ϊ 0 û����һҳ
        return new Page(everyPage, totalCount, totalPage, currentPage, beginIndex, hasPrePage, hasNextPage, pclassid);
    }

    /**
     * ��������ҳ��
     *
     * @param everyPage:һҳ��ʾ�������ݣ�Ҳ��limit   n,m�е�m����
     * @param currentPage:��ǰҳ���ɵ������ҳ��ť���ƼӼ�
     * @param id:�û������Աid
     */
    public static Page createLoad(int everyPage, int totalCount, int currentPage, int id) {
        everyPage = getEveryPage(everyPage);
        currentPage = getCurrentPage(currentPage);
        int totalPage = getTotalPage(everyPage, totalCount);//��ҳ��
        int beginIndex = getBeginIndex(everyPage, currentPage);//��ѯ��ʼ�㣬Ҳ��limit   n,m�е�n����
        boolean hasNextPage = getHasNextPage(totalPage, currentPage);//�Ƿ�����һҳ
        return new Page(everyPage, totalCount, totalPage, currentPage, beginIndex, hasNextPage, id);
    }

    // ���·�����������Page����
    private static int getEveryPage(int everyPage) { // ���ÿҳ��ʾ��¼��
        return everyPage == 0 ? 10 : everyPage;// ���ÿҳ��ʾ��¼��Ϊ0 ����ʾ10����¼
    }

    private static int getCurrentPage(int currentPage) { // ��õ�ǰҳ
        return currentPage == 0 ? 1 : currentPage;
    }

    private static int getTotalPage(int everyPage, int totalCount) { // �����ҳ��
        int totalPage;
        if (totalCount != 0 && totalCount % everyPage == 0) {
            totalPage = totalCount / everyPage;
        } else {
            totalPage = totalCount / everyPage + 1;
        }
        return totalPage;
    }

    private static int getBeginIndex(int everyPage, int currentPage) {// �����ʼλ��
        return (currentPage - 1) * everyPage;
    }

    private static boolean getHasPrePage(int currentPage) {// ����Ƿ�����һҳ
        return currentPage != 1;
    }

    private static boolean getHasNextPage(int totalPage, int currentPage) { // ����Ƿ�����һҳ
        return currentPage != totalPage && totalPage != 0;
    }    // ��������Page���󷽷�����

    /**
     * �����������ԭΪkey=value����ʽ
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
     * ��������·��������
     */
    protected static String getRequestURL(HttpServletRequest request) {
        /* request.getServletPath()���ȡ��ǰ����ĵ�ַ�����ǲ��ᷴ�ز��������Ҫ�Դ��εĵ�ַ���� */
        String servletPath = request.getServletPath();
        String[] strings = servletPath.split("/");
        StringBuffer originalURL = new StringBuffer(strings[2]);
        /* request.getParameterMap()���ȡ�ύ�����д������ݣ���װ�� Map �� */
        Map parameters = request.getParameterMap();
        if (parameters != null && parameters.size() > 0) {
            originalURL.append("?");
            originalURL.append(getQueryString(parameters));
        }

        return originalURL.toString();
    }

    /**
     * ͼƬ�ϴ��ķ���
     */
    public static String upPic(String path, MultipartFile profile, Product pro_info) {
        String fileName;
        String oldFileName = profile.getOriginalFilename();
        String prefix = FilenameUtils.getExtension(oldFileName);
        int filesize = 900000;
        if (profile.getSize() > filesize) {
            return "* �ϴ��ļ���С���ó���900KB��";
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
                return "* �ϴ�ʧ�ܣ�";
            }
        } else {
            return "* ͼƬ�ϴ���ʽ����ȷ��";
        }
        String oldHeadimgPath = pro_info.getPimg();
        String delpath = path + File.separator + oldHeadimgPath;
        //�������Ĭ��ͼƬ��ɾ��
        if (oldHeadimgPath != null && !oldHeadimgPath.equals("1571486776174_Product.jpg")) {
            //�õ�ͼƬ��ַ���ѱ���ͼƬɾ��
            File f1 = new File(delpath);
            f1.delete();
        }
        pro_info.setPimg(fileName);
        return null;
    }

    /**
     * ��ȡ�û���ʵip �˷�����Ҫ���û�����http����ʱ���ò��ܷ���ip��Ϣ
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
