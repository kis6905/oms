package com.open.ms.common;

/**
 * com_code 테이블에서 사용 되는 코드.
 * DB에 저장된 코드 값과 동일해야한다.
 * 
 * @author iskwon
 */
public class Codes {
	
	/**
	 * 사용자 등급 코드
	 */
	public static final int GRADE_CODE_GROUP = 0;
		public static final int GRACD_CODE_ADMIN = 1001;
		public static final int GRADE_CODE_USER	= 1002;
	
	/**
	 * 각종 정보 코드
	 */
	public static final int INFO_CODE_GROUP = 1;
		public static final int INFO_CODE_VALID_PASSWORD_CNT = 1101;

	/**
	 * 결재 상태 코드
	 */
	public static final int SIGN_STATUS_CODE_GROUP = 2;
		public static final int SIGN_STATUS_CODE_STAND_BY = 1201;
		public static final int SIGN_STATUS_CODE_COMPLETION = 1202;
		public static final int SIGN_STATUS_CODE_CANCEL = 1203;
		public static final int SIGN_STATUS_CODE_RETURN = 1204;
}
