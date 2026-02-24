-- ========================================================
-- مشروع إدارة أدوية الأمراض المزمنة
-- جميع الجداول + البيانات + أوقات الدواء + التنبيهات
-- ========================================================

-- =========================
-- 1. جدول الأمراض المزمنة
-- =========================
CREATE TABLE CHRONIC_DISEASES (
    DISEASE_ID NUMBER PRIMARY KEY,
    DISEASE_NAME VARCHAR2(100) NOT NULL
);

-- إدخال الأمراض
INSERT INTO CHRONIC_DISEASES (DISEASE_ID, DISEASE_NAME)
VALUES (1, 'ضغط الدم');

INSERT INTO CHRONIC_DISEASES (DISEASE_ID, DISEASE_NAME)
VALUES (2, 'الكوليسترول والدهون');

COMMIT;

-- =========================
-- 2. جدول الأدوية
-- =========================
CREATE TABLE MEDICINES (
    MEDICINE_ID NUMBER PRIMARY KEY,
    MEDICINE_NAME VARCHAR2(100) NOT NULL,
    DISEASE_ID NUMBER,
    CONSTRAINT FK_MED_CHRONIC FOREIGN KEY (DISEASE_ID)
        REFERENCES CHRONIC_DISEASES(DISEASE_ID)
);

-- إدخال أدوية الضغط
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (1, 'كونكور (بيسوبرولول)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (2, 'أملور (أملوديبين)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (3, 'ديوفان (فالسارتان)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (4, 'أتاكاند (كانديسارتان)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (5, 'زيستريل (ليسينوبريل)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (6, 'ميكارديس (تيلميسارتان)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (7, 'ناتريليكس (إنداباميد)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (8, 'تينورمين (أتينولول)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (9, 'ترايتاس (راميبريل)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (10, 'كوفرسيل (بيريندوبريل)', 1);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (11, 'إكسفورج', 1);

-- إدخال أدوية الكوليسترول
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (12, 'ليبيتور (أتورفاستاتين)', 2);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (13, 'كريستور (روسوفاستاتين)', 2);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (14, 'زوكور (سيمفاستاتين)', 2);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (15, 'ليبانتيل (فينوفيبرات)', 2);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (16, 'ميفاكور (لوفاستاتين)', 2);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (17, 'ليفالو (بيتافاستاتين)', 2);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (18, 'لوبيد (جمفبروزيل)', 2);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (19, 'ايزيترول (إيزيتيميب)', 2);
INSERT INTO MEDICINES (MEDICINE_ID, MEDICINE_NAME, DISEASE_ID)
VALUES (20, 'اينيجي', 2);

COMMIT;

-- =========================
-- 3. جدول أوقات أخذ الدواء
-- =========================
CREATE TABLE MEDICINE_SCHEDULE (
    SCHEDULE_ID NUMBER PRIMARY KEY,
    MEDICINE_ID NUMBER,
    TAKING_TIME VARCHAR2(200),
    CONSTRAINT FK_SCH_MED FOREIGN KEY (MEDICINE_ID)
        REFERENCES MEDICINES(MEDICINE_ID)
);

-- أوقات أدوية الضغط
INSERT INTO MEDICINE_SCHEDULE VALUES (1, 1, 'صباحاً قبل الإفطار');
INSERT INTO MEDICINE_SCHEDULE VALUES (2, 2, 'موعد ثابت يومياً');
INSERT INTO MEDICINE_SCHEDULE VALUES (3, 3, 'موعد ثابت يومياً');
INSERT INTO MEDICINE_SCHEDULE VALUES (4, 4, 'موعد ثابت يومياً');
INSERT INTO MEDICINE_SCHEDULE VALUES (5, 5, 'موعد ثابت يومياً');
INSERT INTO MEDICINE_SCHEDULE VALUES (6, 6, 'موعد ثابت يومياً');
INSERT INTO MEDICINE_SCHEDULE VALUES (7, 7, 'صباحاً');
INSERT INTO MEDICINE_SCHEDULE VALUES (8, 8, 'صباحاً');
INSERT INTO MEDICINE_SCHEDULE VALUES (9, 9, 'موعد ثابت يومياً');
INSERT INTO MEDICINE_SCHEDULE VALUES (10, 10, 'صباحاً قبل الأكل');
INSERT INTO MEDICINE_SCHEDULE VALUES (11, 11, 'صباحاً غالباً');

-- أوقات أدوية الكوليسترول
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