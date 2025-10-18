# 💊 HỆ THỐNG QUẢN LÝ KHÁM CHỮA BỆNH – HIS CHỢ RẪY
**Nguyễn Thị Ngọc Hân – N23DCPT077**

---

## 🔗 QUICK LINKS (bấm để mở/tải)
- **SQL Export:** [`HIS_ChoRay_N23DCPT077.sql`](HIS_ChoRay_N23DCPT077.sql)
- **Case Study – Requirements + UC/ERD (DOCX):** [`N23DCPT077-LECTURE5-REQUIREMENTS-CASE STUDY.docx`](N23DCPT077-LECTURE5-REQUIREMENTS-CASE%20STUDY.docx)
- **Củng cố lý thuyết – Trắc nghiệm/Trả lời ngắn/Tình huống (DOCX):** [`NGUYỄN THỊ NGỌC HÂN-N23DCPT077-LECTURE5.docx`](NGUYỄN%20THỊ%20NGỌC%20HÂN-N23DCPT077-LECTURE5.docx)
- **Ảnh minh chứng MySQL:** [`project Info.png`](project%20Info.png) · [`screenshotMYSQL.png`](screenshotMYSQL.png)
- **Use Case (VN – bám slide):** [`usecaseDiagram.png`](usecaseDiagram.png)
- **Use Case (EN – chi tiết):** [`usecase2.png`](usecase2.png)
- **ERD tối giản:** [`ERD tối giản.png`](ERD%20t%E1%BB%91i%20gi%E1%BA%A3n.png)

---

## 1) Giới thiệu ngắn
Case study xây dựng **CSDL HIS (Hospital Information System)** cho **BV Chợ Rẫy** nhằm:
- Hỗ trợ quản lý khám chữa bệnh, hồ sơ bệnh án điện tử (EMR), lịch hẹn, xét nghiệm, đơn thuốc, nhà thuốc, viện phí & BHYT.  
- Giảm tải hành chính, nâng cao hiệu suất và độ chính xác.

**Schema:** `his_choray_n23dcpt077` • **Số bảng:** 9 (8 bảng chính + `projectinfo`)

---

## 2) Hướng dẫn chạy nhanh
1. Mở **MySQL Workbench** → *File → Open SQL Script* → chọn `HIS_ChoRay_N23DCPT077.sql`.  
2. Bấm **Execute All** (tia sét).  
3. Kiểm tra:
   ```sql
   USE his_choray_n23dcpt077;
   SHOW TABLES;
   SELECT * FROM projectinfo; -- nhìn thấy: Nguyễn Thị Ngọc Hân – N23DCPT077
## 3) Chức năng chính

BN: Đặt lịch khám, tra cứu hồ sơ, thanh toán.

BS: Xem lịch, cập nhật EMR, chỉ định xét nghiệm, kê đơn.

NV tiếp nhận: Đăng ký khám, điều phối lịch, cập nhật thông tin BN.

Kỹ thuật viên xét nghiệm: Nhập kết quả xét nghiệm.

Nhà thuốc: Cấp thuốc theo đơn, quản lý kho.

Hệ thống BHYT: Tính chi phí & hỗ trợ thanh toán.

## 4) Mô hình dữ liệu

Bảng:
benhnhan, bacsi, lichhen, hosobenhan, xetnghiem, donthuoc, thuoc, hoadon, projectinfo.

Quan hệ chính (ERD):

BN ↔ lichhen/hosobenhan/hoadon

BS ↔ hosobenhan/donthuoc/lichhen

HSBA ↔ xetnghiem/donthuoc

donthuoc ↔ thuoc

ERD tối giản:

## 5) Minh chứng thao tác MySQL

Bảng projectinfo (in HỌ TÊN - MSSSV):


Xuất/khởi tạo CSDL trên Workbench:
