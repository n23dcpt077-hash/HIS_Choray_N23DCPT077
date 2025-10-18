# 💊 HỆ THỐNG QUẢN LÝ KHÁM CHỮA BỆNH – HIS CHỢ RẪY
**Nguyễn Thị Ngọc Hân – N23DCPT077**  
**Gợi ý tên repo:** `HIS_Choray_N23DCPT077`

---

## 1) Giới thiệu nhanh
Case study thiết kế **CSDL HIS** cho BV Chợ Rẫy: quản lý bệnh nhân/bác sĩ, lịch hẹn, EMR, xét nghiệm, đơn thuốc, nhà thuốc, viện phí & BHYT.  
**Schema:** `his_choray_n23dcpt077` • **Bảng:** 9 (8 bảng chính + `projectinfo`)

---

## 2) Tệp tin chính (bấm để tải/mở)
- 📦 **SQL export:** [`his_choray_N23DCPT077.sql`](his_choray_N23DCPT077.sql)
- 📄 **Case Study – Requirements + UC/ERD:** [`N23DCPT077-LECTURE5-REQUIREMENTS-CASE STUDY.docx`](N23DCPT077-LECTURE5-REQUIREMENTS-CASE%20STUDY.docx)
- 📄 **Củng cố lý thuyết – Trắc nghiệm/Trả lời ngắn/Tình huống:** [`NGUYỄN THỊ NGỌC HÂN-N23DCPT077-LECTURE5.docx`](NGUYỄN%20THỊ%20NGỌC%20HÂN-N23DCPT077-LECTURE5.docx)

---

## 3) Hướng dẫn chạy nhanh
1. Mở **MySQL Workbench** → *File → Open SQL Script* → chọn `his_choray_N23DCPT077.sql`.  
2. Bấm **Execute All** (tia sét).  
3. Kiểm tra:
   ```sql
   USE his_choray_n23dcpt077;
   SHOW TABLES;
   SELECT * FROM projectinfo;  -- sẽ thấy: Nguyễn Thị Ngọc Hân – N23DCPT077
##4) Cấu trúc CSDL 
#	Bảng	Mô tả ngắn
1	benhnhan	Thông tin bệnh nhân
2	bacsi	Thông tin bác sĩ
3	lichhen	Lịch hẹn khám
4	hosobenhan	Hồ sơ bệnh án điện tử (EMR)
5	xetnghiem	Kết quả xét nghiệm
6	donthuoc	Đơn thuốc bác sĩ kê
7	thuoc	Thuốc trong đơn
8	hoadon	Viện phí
9	projectinfo	Chủ sở hữu: Nguyễn Thị Ngọc Hân – N23DCPT077

Quan hệ chính: BN ↔ (lịch hẹn, hồ sơ, hóa đơn); BS ↔ (hồ sơ, đơn thuốc, lịch hẹn); HSBA ↔ (xét nghiệm, đơn thuốc); Đơn thuốc ↔ Thuốc.
   
