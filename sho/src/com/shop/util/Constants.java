package com.shop.util;

/**
 * ��̬���ճ���
 * final��Ա������ʾ������ֻ�ܱ���ֵһ�Σ���ֵ��ֵ���ٸı䣬Ϊֻ����
 * ���ڱ���һЩ��Ϣ�����¼״̬����ַ��
 */
public class Constants {

    /* ��¼���û���Ϣ��Session�е�Key */
    public static final String LOGIN_USER = "_LOGIN_USER_";
    /* ��¼���û���Ϣ��Session�е�Key */
    public static final String LOGIN_ADMIN = "_LOGIN_ADMIN_";

    /*��ҳ��ÿҳ��Ʒ��ʾ��*/
    public static final int PEODUCT_MAXSIZE = 12;
    /*��ҳ��ÿҳ��־��ʾ��*/
    public static final int LOG_MAXSIZE = 10;

    /* ����״̬ */
    public static final int ORDER_WAITING = 0;//�ȴ�����
    public static final int ORDER_PAID = 1;//δ����
    public static final int ORDER_ASKREFUND = 2;//�����˿���
    public static final int ORDER_REFUNDSUCCEED = 3;//�˿�ɹ�
    public static final int ORDER_SENDING = 4;//�ѷ���
    public static final int ORDER_SUCCEED = 5;//���׳ɹ�
    public static final int ORDER_ASKRETURN = 6;//�����˻���
    public static final int ORDER_RETURNING = 7;//�˻���
    public static final int ORDER_RETURNSUCEED = 8;//�˻��ɹ�
    public static final int ORDER_CLOSED = 9;//���׹ر�

    public static final String[] ORDER_STATUS_DISC = new String[]{"�ȴ�����", "δ����", "�����˿���", "�˿�ɹ�", "�ѷ���", "���׳ɹ�", "�����˻���", "�˻���", "�˻��ɹ�", "���׹ر�"};

    /* ��¼����ҳ���ַ�õ�session key */
    public static final String REFER_URL = "_REFER_URL_";
    public static final String REFER_URL_DEFAULT_KEY = "_REFER_URL_DEFAULT_KEY_";
}
