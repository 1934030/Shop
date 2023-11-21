package com.shop.model;

/**
 * 分页实体�?
 */
public class Page {

    private int everyPage;          //每页显示记录�?
    private int totalCount;         //总记录数
    private int totalPage;          //总页�?
    private int currentPage;        //当前�?
    private int beginIndex;         //查询起始�?
    private boolean hasPrePage;     //是否有上�?�?
    private boolean hasNextPage;    //是否有下�?�?
    private Integer pclassid;    //商品类别id
    private int uid;    //商品类别id

    public Page() {
        super();
    }

    public Page(int everyPage, int totalCount, int totalPage, int currentPage, int beginIndex, boolean hasNextPage,
                int uid) {
        super();
        this.everyPage = everyPage;
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.currentPage = currentPage;
        this.beginIndex = beginIndex;
        this.hasNextPage = hasNextPage;
        this.uid = uid;
    }

    public Page(int everyPage, int totalCount, int totalPage, int currentPage, int beginIndex, boolean hasPrePage, boolean hasNextPage) {
        this.everyPage = everyPage;
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.currentPage = currentPage;
        this.beginIndex = beginIndex;
        this.hasPrePage = hasPrePage;
        this.hasNextPage = hasNextPage;
    }

    public Page(int everyPage, int totalCount, int totalPage, int currentPage, int beginIndex, boolean hasPrePage,
                boolean hasNextPage, Integer pclassid) {
        super();
        this.everyPage = everyPage;
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.currentPage = currentPage;
        this.beginIndex = beginIndex;
        this.hasPrePage = hasPrePage;
        this.hasNextPage = hasNextPage;
        this.pclassid = pclassid;
    }

    public int getEveryPage() {
        return everyPage;
    }

    public void setEveryPage(int everyPage) {
        this.everyPage = everyPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getBeginIndex() {
        return beginIndex;
    }

    public void setBeginIndex(int beginIndex) {
        this.beginIndex = beginIndex;
    }

    public boolean isHasPrePage() {
        return hasPrePage;
    }

    public void setHasPrePage(boolean hasPrePage) {
        this.hasPrePage = hasPrePage;
    }

    public boolean isHasNextPage() {
        return hasNextPage;
    }

    public void setHasNextPage(boolean hasNextPage) {
        this.hasNextPage = hasNextPage;
    }

    public Integer getPclassid() {
        return pclassid;
    }

    public void setPclassid(Integer pclassid) {
        this.pclassid = pclassid;
    }

    @Override
    public String toString() {
        return "Page [everyPage=" + everyPage + ", totalCount=" + totalCount + ", totalPage=" + totalPage
                + ", currentPage=" + currentPage + ", beginIndex=" + beginIndex + ", hasPrePage=" + hasPrePage
                + ", hasNextPage=" + hasNextPage + ", pclassid=" + pclassid + "]";
    }


}
