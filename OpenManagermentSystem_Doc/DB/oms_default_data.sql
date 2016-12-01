--------------------------------------------------------
-- Table `oms_com_code`
--------------------------------------------------------
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (0, 1001, 'Admin', '1001');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (0, 1002, 'User', '1002');

INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (1, 1101, 'Valid Password Fail Count', '10');


--------------------------------------------------------
-- Table `oms_role`
--------------------------------------------------------
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (0, 'ROLE_ADMIN', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (1, 'ROLE_CORP_MONEYBOOK', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (2, 'ROLE_PERSON_MONEYBOOK', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (3, 'ROLE_STATISTIC', SYSDATE(), SYSDATE());
INSERT INTO `oms_role` (`roleId`, `roleName`, `registeredDate`, `modifiedDate`) VALUES (4, 'ROLE_ANALYSIS', SYSDATE(), SYSDATE());


--------------------------------------------------------
-- Table `oms_member`
--------------------------------------------------------
INSERT INTO `oms_member` (`memberId`, `password`, `passwordFailCnt`, `nickname`, `gradeCodeGroup`, `gradeCode`, `registeredDate`, `modifiedDate`, `lastLoginDate`)
VALUES ('admin', '11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d', 0, '������', 0, 1001, SYSDATE(), SYSDATE(), SYSDATE());


--------------------------------------------------------
-- Table `oms_role_member_map`
--------------------------------------------------------
INSERT INTO `oms_role_member_map` VALUES (0, 'admin');


--------------------------------------------------------
-- Table `oms_service`
--------------------------------------------------------
INSERT INTO `oms_service` 
VALUES (1, 1, '��ī ����', '����ī�� ��� ������ ������ �� �ֽ��ϴ�.', 'slider-service-01.png', 'icon-service-01.png', 'corp_moneybook', '/service/corp/moneybook', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (2, 2, '���� ���� ����', '���� ���� ������ ������ �� �ֽ��ϴ�.', 'slider-service-02.png', 'icon-service-02.png', 'person_moneybook', '/service/person/moneybook', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (3, 3, '���', '��ī,  ���� ������ ��踦 Ȯ���� �� �ֽ��ϴ�.', 'slider-service-03.png', 'icon-service-03.png', 'statistic', '/service/statistic', '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (4, 4, '�м�', '��ī,  ���� ������ �м� �� ������ �� �ֽ��ϴ�.', 'slider-service-04.png', 'icon-service-04.png', 'analysis', '/service/analysis', '2016-09-03 00:00:00', '2016-09-03 00:00:00');


	   