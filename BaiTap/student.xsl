<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <!-- Template chính để xử lý tài liệu XML -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Danh sách học sinh</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid black;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>

                <!-- Hiển thị học sinh có mã là HS001 -->
                <h2>Học sinh có mã HS001:</h2>
                <p>
                    <xsl:value-of select="DSLop/Lop/HocSinh[@Mahs='HS001']/HoTen" />
                </p>

                <!-- Bảng hiển thị tất cả học sinh có giới tính là Nữ -->
                <h2>Danh sách học sinh có giới tính Nữ:</h2>
                <table border="1">
                    <tr>
                        <th>Mã học sinh</th>
                        <th>Họ tên</th>
                        <th>Giới tính</th>
                    </tr>
                    <!-- Lặp qua tất cả học sinh và kiểm tra giới tính là Nữ -->
                    <xsl:for-each select="DSLop/Lop/HocSinh[GioiTinh='Nu']">
                        <tr>
                            <td><xsl:value-of select="@Mahs" /></td>
                            <td><xsl:value-of select="HoTen" /></td>
                            <td><xsl:value-of select="GioiTinh" /></td>
                        </tr>
                    </xsl:for-each>
                </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
