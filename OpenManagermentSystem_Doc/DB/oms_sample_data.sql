-- -----------------------------------------------------
-- Table `oms_moneybook`
-- -----------------------------------------------------
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-01', '식대', '팀원', '커피소녀', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-02', '식대', '팀원', '커피소녀', 6000, '모닝 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-03', '식대', '팀원', '현대카드 카드팩토리', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-06', '식대', '팀원', 'kbs 커피', 18000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-07', '식대', '팀원', '커피소녀', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-08', '식대', '팀원', '7그램', 12000, '모닝 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-09', '식대', '팀원', '커피소녀', 12000, '저녁 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-10', '식대', '팀원', '할리스 커피', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-11', '식대', '팀원', '커피소녀', 6000, '모닝 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-14', '식대', '팀원', '7그램', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-16', '식대', '팀원', '커피소녀', 6500, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-17', '식대', '팀원', 'kbs 커피', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-18', '식대', '팀원', 'kbs 커피', 7200, '모닝 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-19', '식대', '팀원', '현대카드 카드팩토리', 8400, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-20', '식대', '팀원', '커피소녀', 9000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-21', '식대', '팀원', '버거킹', 25000, '야근 간식', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-08-28', '식대', '팀원', '7그램', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-09-02', '식대', '팀원', '커피소녀', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-09-05', '식대', '팀원', '커피소녀', 10500, '간식', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-09-13', '식대', '팀원', '현대카드 카드팩토리', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-09-17', '식대', '팀원', 'kbs 커피', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-09-21', '식대', '팀원', '커피소녀', 4000, '저녁 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-09-27', '식대', '팀원', 'kbs 커피', 12000, '점심 커피', 'iskwon', SYSDATE(), SYSDATE());
INSERT INTO `omsdb`.`oms_moneybook` (`seq`, `usedDate`, `category`, `customer`, `usedPlace`, `price`, `note`, `memberId`, `registeredDate`, `modifiedDate`)
VALUES ( IF((SELECT MAX(seq) FROM oms_moneybook t) IS NULL, 0, (SELECT MAX(seq) + 1 FROM oms_moneybook t1) ), '2016-09-28', '식대', '팀원', '7gram', 7400, '모닝 커피', 'iskwon', SYSDATE(), SYSDATE());