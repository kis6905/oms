--------------------------------------------------------
-- Table `oms_com_code`
--------------------------------------------------------
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (0, 1001, 'Admin', '1001');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (0, 1002, 'User', '1002');

INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (1, 1101, '비밀번호 오류 횟수 한계', '10');

INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (2, 1201, '결재 상태 코드(대기)', '1201');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (2, 1202, '결재 상태 코드(완료)', '1202');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (2, 1203, '결재 상태 코드(철회)', '1203');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (2, 1204, '결재 상태 코드(반려)', '1204');


--------------------------------------------------------
-- Table `oms_role`
--------------------------------------------------------
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (0, 'ROLE_ADMIN', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (1, 'ROLE_CORP_MONEYBOOK', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (2, 'ROLE_PERSON_MONEYBOOK', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (3, 'ROLE_STATISTIC', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (4, 'ROLE_ANALYSIS', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (5, 'ROLE_APPROVAL', SYSDATE(), SYSDATE());


--------------------------------------------------------
-- Table `oms_member`
--------------------------------------------------------
INSERT INTO `oms_member` (`memberId`, `password`, `passwordFailCnt`, `nickname`, `gradeCodeGroup`, `gradeCode`, `corpCardLimit`, `registeredDate`, `modifiedDate`, `lastLoginDate`)
VALUES ('admin', '11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d', 0, '관리자', 0, 1001, 0, SYSDATE(), SYSDATE(), SYSDATE());


--------------------------------------------------------
-- Table `oms_role_member_map`
--------------------------------------------------------
INSERT INTO `oms_role_member_map` VALUES (0, 'admin'), (1, 'admin'), (2, 'admin'), (3, 'admin'), (4, 'admin'), (5, 'admin');


--------------------------------------------------------
-- Table `oms_service`
--------------------------------------------------------
INSERT INTO `oms_service` (`serviceId`, `roleId`, `title`, `description`, `sliderImage`, `iconImage`, `pageName`, `pageUrl`, `registeredDate`, `modifiedDate`)
VALUES (1, 1, '법카 관리', '법인카드 사용 내역을 관리할 수 있습니다.', 'slider-service-01.png', 'icon-service-01.png', 'corp_moneybook', '/service/corp/moneybook', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (2, 2, '지출 관리', '개인 지출 내역을 관리할 수 있습니다.', 'slider-service-02.png', 'icon-service-02.png', 'person_moneybook', '/service/person/moneybook', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (3, 3, '통계', '법인카드, 개인 지출 통계를 확인할 수 있습니다.', 'slider-service-03.png', 'icon-service-03.png', 'statistic', '/service/statistic', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (4, 4, '분석', '법인카드, 개인 지출을 분석할 수 있습니다.', 'slider-service-04.png', 'icon-service-04.png', 'analysis', '/service/analysis', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (5, 5, '받은 결재', '내가 받은 결재를 조회 및 처리할 수 있습니다.', 'slider-service-05.png', 'icon-service-05.png', 'receive_approval', '/service/receive/approval', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (6, 2, '올린 결재', '내가 올린 결재를 조회 및 철회할 수 있습니다.', 'slider-service-06.png', 'icon-service-06.png', 'send_approval', '/service/send/approval', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (100, 0, '회원 관리', '회원을 관리할 수 있습니다.', 'slider-service-100.png', 'icon-service-100.png', 'member', '/admin/member', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (101, 0, 'Data 조회', '각 회원 별 법인카드, 개인 지출 내역 및 통계를 확인할 수 있습니다.', 'slider-service-101.png', 'icon-service-101.png', 'data', '/admin/data', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (102, 0, '결재 조회', '승인된 결재 내용을 확인할 수 있습니다.', 'slider-service-102.png', 'icon-service-102.png', 'approval', '/admin/approval', '2016-09-03 00:00:00', '2016-09-03 00:00:00');



