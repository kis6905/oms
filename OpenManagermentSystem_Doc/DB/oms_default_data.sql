--------------------------------------------------------
-- Table `oms_com_code`
--------------------------------------------------------
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (0, 1001, 'Admin', '1001');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (0, 1002, 'User', '1002');

INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (1, 1101, '��й�ȣ ���� Ƚ�� �Ѱ�', '10');

INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (2, 1201, '���� ���� �ڵ�(���)', '1201');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (2, 1202, '���� ���� �ڵ�(�Ϸ�)', '1202');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (2, 1203, '���� ���� �ڵ�(öȸ)', '1203');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (2, 1204, '���� ���� �ڵ�(�ݷ�)', '1204');

INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (3, 1301, '���� ��� ����(���)', '1301');
INSERT INTO `oms_com_code` (`codeGroup`, `code`, `codeTitle`, `codeValue`) VALUES (3, 1302, '���� ��� ����(������)', '1302');

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
INSERT INTO `oms_member` (`memberId`, `password`, `passwordFailCnt`, `memberName`, `gradeCodeGroup`, `gradeCode`, `corpCardLimit`, `registeredDate`, `modifiedDate`, `lastLoginDate`)
VALUES ('admin', '11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d', 0, '������', 0, 1001, 0, SYSDATE(), SYSDATE(), SYSDATE());


--------------------------------------------------------
-- Table `oms_role_member_map`
--------------------------------------------------------
INSERT INTO `oms_role_member_map` VALUES (0, 'admin'), (1, 'admin'), (2, 'admin'), (3, 'admin'), (4, 'admin'), (5, 'admin');


--------------------------------------------------------
-- Table `oms_service`
--------------------------------------------------------
INSERT INTO `oms_service` (`serviceId`, `roleId`, `title`, `description`, `sliderImage`, `iconImage`, `pageName`, `pageUrl`, `useYNCodeGroup`, `useYNCode`, `registeredDate`, `modifiedDate`)
VALUES (1, 1, '��ī ����', '����ī�� ��� ������ ������ �� �ֽ��ϴ�.', 'slider-service-01.png', 'icon-service-01.png', 'corp_moneybook', '/service/corp/moneybook', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (2, 2, '���� ����', '���� ���� ������ ������ �� �ֽ��ϴ�.', 'slider-service-02.png', 'icon-service-02.png', 'person_moneybook', '/service/person/moneybook', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (3, 3, '���', '����ī��, ���� ���� ��踦 Ȯ���� �� �ֽ��ϴ�.', 'slider-service-03.png', 'icon-service-03.png', 'statistic', '/service/statistic', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (4, 4, '�м�', '����ī��, ���� ������ �м��� �� �ֽ��ϴ�.', 'slider-service-04.png', 'icon-service-04.png', 'analysis', '/service/analysis', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (5, 5, '���� ó��', '���� ���� ���縦 ��ȸ �� ó���� �� �ֽ��ϴ�.', 'slider-service-05.png', 'icon-service-05.png', 'received_approval', '/service/received/approval', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (6, 2, '�ø� ����', '���� �ø� ���縦 ��ȸ �� öȸ�� �� �ֽ��ϴ�.', 'slider-service-06.png', 'icon-service-06.png', 'sent_approval', '/service/sent/approval', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (100, 0, 'ȸ�� ����', 'ȸ���� ������ �� �ֽ��ϴ�.', 'slider-service-100.png', 'icon-service-100.png', 'member', '/admin/member', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (101, 0, 'Data ��ȸ', '�� ȸ�� �� ����ī��, ���� ���� ���� �� ��踦 Ȯ���� �� �ֽ��ϴ�.', 'slider-service-101.png', 'icon-service-101.png', 'data', '/admin/data', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00'),
	   (102, 0, '���� ��ȸ', '���ε� ���� ������ Ȯ���� �� �ֽ��ϴ�.', 'slider-service-102.png', 'icon-service-102.png', 'approval', '/admin/approval', 3, 1301, '2016-09-03 00:00:00', '2016-09-03 00:00:00');



