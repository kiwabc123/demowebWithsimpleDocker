IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'testdb')
BEGIN
    CREATE DATABASE testdb;
END
GO

USE testdb;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'datasets')
BEGIN
    CREATE TABLE datasets (
        id INT PRIMARY KEY IDENTITY(1,1),
        name NVARCHAR(255),
        description NVARCHAR(MAX),
        tags NVARCHAR(255),
        last_updated DATETIME,
        record_count INT,
        owner NVARCHAR(100),
        source NVARCHAR(100),
        is_public BIT,
        created_at DATETIME
    );
END
GO

INSERT INTO datasets (name, description, tags, last_updated, record_count, owner, source, is_public, created_at)
VALUES 
(N'ผู้ประกอบธุรกิจตัวกลาง (Intermediaries)', N'ข้อมูล ใบอนุญาตและประกอบธุรกิจ, แบบรายงาน,ข้อมูลการตรวจสอบ', NULL, '2025-05-31', 0, '', 'E-Licensing', 1, GETDATE()),
(N'การขึ้นทะเบียนบุคลากร/ผู้ประกอบวิชาชีพ (professionals)', N'ข้อมูล บุคลากรในธุรกิจตลาดทุน, บริษัทจดทะเบียน, และผู้ประกอบวิชาชีพ', NULL, '2025-05-31', 0, '', 'ORAP', 1, GETDATE()),
(N'ฐานข้อมูลคดีผู้กระทำความผิด', N'ประวัติผู้กระทำความผิดและโทษทางแพ่ง/อาญา/มาตรการทางปกครอง', NULL, '2025-05-31', 0, '', 'Law Office', 1, GETDATE()),
(N'สถิติคดีความ', N'สถิติคดีที่อยู่ในชั้นศาล', NULL, '2025-05-31', 0, '', 'Law Office', 1, GETDATE()),
(N'ข้อมูลบริษัทที่อยู่ระหว่างการตรวจสอบ', N'บริษัทที่เข้าข่ายต้องรายงาน/ชี้แจง/สอบสวนเพิ่มเติม', NULL, '2025-05-31', 0, '', 'CMART', 1, GETDATE()),
(N'คำร้องเรียนจากผู้ลงทุน', N'ข้อมูลคำร้องเรียนที่เกี่ยวกับผลิตภัณฑ์และการปฏิบัติหน้าที่ของผู้ประกอบธุรกิจ', NULL, '2025-05-31', 0, '', 'INFO', 1, GETDATE()),
(N'ธุรกรรมการซื้อขายหลักทรัพย์', N'ข้อมูลสถิติธุรกรรมซื้อขายของนักลงทุนประเภทต่างๆ', NULL, '2025-05-31', 0, '', 'TSD', 1, GETDATE()),
(N'รายงานผู้ถือหุ้น', N'ข้อมูลการถือหุ้นของกรรมการ/ผู้บริหาร/ผู้ถือหุ้นใหญ่', NULL, '2025-05-31', 0, '', 'TSD', 1, GETDATE()),
(N'ผู้สอบบัญชี', N'ข้อมูลผู้สอบบัญชีที่ได้รับการขึ้นทะเบียนและการจัดสรรบริษัทที่ตรวจสอบ', NULL, '2025-05-31', 0, '', 'Enforcement', 1, GETDATE()),
(N'การอนุญาตการออกและเสนอขายหลักทรัพย์', N'ข้อมูลแบบแสดงรายการข้อมูลและหนังสือชี้ชวน', NULL, '2025-05-31', 0, '', 'E-Licensing', 1, GETDATE());
