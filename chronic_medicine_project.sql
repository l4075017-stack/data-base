INSERT INTO MEDICINE_SCHEDULE VALUES (12, 12, 'أي وقت مع الثبات');
INSERT INTO MEDICINE_SCHEDULE VALUES (13, 13, 'موعد ثابت يومياً');
INSERT INTO MEDICINE_SCHEDULE VALUES (14, 14, 'مساءً قبل النوم');
INSERT INTO MEDICINE_SCHEDULE VALUES (15, 15, 'مع الوجبة الرئيسية');
INSERT INTO MEDICINE_SCHEDULE VALUES (16, 16, 'مع وجبة العشاء');
INSERT INTO MEDICINE_SCHEDULE VALUES (17, 17, 'أي وقت');
INSERT INTO MEDICINE_SCHEDULE VALUES (18, 18, 'قبل الأكل بـ 30 دقيقة');
INSERT INTO MEDICINE_SCHEDULE VALUES (19, 19, 'موعد ثابت يومياً');
INSERT INTO MEDICINE_SCHEDULE VALUES (20, 20, 'موعد ثابت يومياً');

COMMIT;

-- =========================
-- 4. جدول التنبيهات / الاحترازات
-- =========================
CREATE TABLE MEDICINE_ALERTS (
    ALERT_ID NUMBER PRIMARY KEY,
    MEDICINE_ID NUMBER,
    ALERT_NOTE VARCHAR2(500),
    CONSTRAINT FK_ALERT_MED FOREIGN KEY (MEDICINE_ID)
        REFERENCES MEDICINES(MEDICINE_ID)
);

-- أمثلة تنبيهات
INSERT INTO MEDICINE_ALERTS VALUES (1, 1, 'يمنع إيقاف الدواء فجأة دون استشارة الطبيب');
INSERT INTO MEDICINE_ALERTS VALUES (2, 7, 'قد يسبب زيادة التبول لذلك يفضل صباحاً');
INSERT INTO MEDICINE_ALERTS VALUES (3, 14, 'يمنع تناوله مع عصير الجريب فروت');
INSERT INTO MEDICINE_ALERTS VALUES (4, 18, 'يؤخذ قبل الطعام بنصف ساعة لزيادة الفعالية');
INSERT INTO MEDICINE_ALERTS VALUES (5, 12, 'يجب عمل فحص وظائف الكبد دورياً');

COMMIT;

-- =========================
-- 5. استعلام شامل للعرض
-- =========================
SELECT D.DISEASE_NAME,
       M.MEDICINE_NAME,
       S.TAKING_TIME,
       A.ALERT_NOTE
FROM MEDICINES M
JOIN CHRONIC_DISEASES D ON M.DISEASE_ID = D.DISEASE_ID
LEFT JOIN MEDICINE_SCHEDULE S ON M.MEDICINE_ID = S.MEDICINE_ID
LEFT JOIN MEDICINE_ALERTS A ON M.MEDICINE_ID = A.MEDICINE_ID
ORDER BY D.DISEASE_ID, M.MEDICINE_ID;