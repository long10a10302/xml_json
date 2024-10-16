<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

    <!-- Template chính để xử lý tài liệu XML -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Danh Sách Bệnh Nhân Theo Khoa</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        background-color: #f9f9f9;
                    }
                    h1 {
                        color: #2E86C1;
                        text-align: center;
                    }
                    h2 {
                        color: #145A32;
                        margin-top: 40px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-bottom: 20px;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                        color: #333;
                    }
                    tr:nth-child(even) {
                        background-color: #f9f9f9;
                    }
                    tr:hover {
                        background-color: #f1f1f1;
                    }
                </style>
            </head>
            <body>
                <h1>Danh Sách Bệnh Nhân Theo Khoa</h1>

                <!-- Lặp qua từng khoa trong danh sách -->
                <xsl:for-each select="DanhsachKhoa/Khoa">
                    <h2><xsl:value-of select="@TenKhoa" /></h2>
                    <p><strong>Mã Khoa:</strong> <xsl:value-of select="@MaKhoa" /></p>

                    <!-- Kiểm tra nếu khoa có bệnh nhân -->
                    <xsl:if test="BenhNhan">
                        <table>
                            <tr>
                                <th>Mã Số Bệnh Nhân</th>
                                <th>Họ Tên</th>
                                <th>Địa Chỉ</th>
                                <th>Ngày Nhập Viện</th>
                                <th>Mô Tả Bệnh Án</th>
                                <th>Số Ngày Nhập Viện</th>
                            </tr>
                            <!-- Lặp qua từng bệnh nhân trong khoa -->
                            <xsl:for-each select="BenhNhan">
                                <tr>
                                    <td><xsl:value-of select="@MaSoBN" /></td>
                                    <td><xsl:value-of select="HoTen" /></td>
                                    <td><xsl:value-of select="DiaChi" /></td>
                                    <td><xsl:value-of select="NgayNhapVien" /></td>
                                    <td><xsl:value-of select="MoTaBenhAn" /></td>
                                    <td><xsl:value-of select="SoNgayNhapVien" /></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:if>

                    <!-- Nếu không có bệnh nhân nào trong khoa -->
                    <xsl:if test="not(BenhNhan)">
                        <p>Không có bệnh nhân nào trong khoa này.</p>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
