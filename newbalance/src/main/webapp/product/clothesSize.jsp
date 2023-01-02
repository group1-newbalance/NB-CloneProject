<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Balance Korea</title>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="/newbalance/common/common.css" rel="stylesheet" type="text/css">
</head>
<style>
.clothes{
	position: relative;
	width: 900px;
    height: 850px;
}
.clothes .popup_inner {
    width: 100%;
    padding: 50px 40px;
    position: relative;
    box-sizing: border-box;
}
.clothes .popup_header {
    padding: 0 0 18px;
    border-bottom: 2px solid #121212;
    position: relative !important;
    height: auto !important;
}
.clothes .popup_header strong{
    display: block;
    font-size: 24px;
    font-weight: bold;
    line-height: 1;
}
.st_size .tbl_size {
    font-size: 12px;
    width: 100%;
    border-top: 1px solid #444;
}
.tbl_size table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    border-color: grey;
}
.tbl_size table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    border-color: grey;
}
.tbl_size table th, td {
    height: 47px;
    text-align: center;
}
.tbl_size table tr {
    border-bottom: 1px solid #dbdbdb;
}
.tbl_size table tbody {
    border-top: 1px solid #333;
}
.st_size .title {
    padding: 40px 0 20px;
    font-size: 16px;
    line-height: 1;
    letter-spacing: -0.02em;
}
.st_size .notice {
    margin-top: 30px;
    color: #777;
    font-size: 10px;
    letter-spacing: -0.02em;
}
.st_size .img_box.bg2 {
    padding-top: 295px;
   background: url(background: url(https://image.nbkorea.com/NBRB_PC/product/bg_pop_size1.png) no-repeat 55px 0;) no-repeat 55px 0;
	float: left;
    width: 175px;
    padding-left: 25px;
    margin-top: 76px;
}
.st_size .tbl_size table thead tr:first-child th {
    background: #f4f4f4 !important;
    border-top: 0;
}
.tbl_size table .bd_r {
    border-right: 1px solid #dbdbdb;
}
.tbl_size table thead tr:nth-child(2) th {
    background: #e9f3fb;
}
.st_size .tbl_size table thead tr th.nbg {
    background: #fff !important;
}
.st_size .tbl_size table thead tr:last-child th:first-child {
    background: #e9f3fb !important;
}
.tbl_size table tbody {
    border-top: 1px solid #333;
}

</style>
<body>
<!-- 성인 의류 사이즈 표 -->
<div class="clothes">
	<div class="popup_inner">
		<div class="popup_header"><strong>의류 표준사이즈</strong></div>
		<div class="popup_content">
			<div class="st_size">
				<div class="standard">
					<div class="tbl_box">
						<!-- 유니/남자 -->
						<p class="title">유니 / 남자</p>
						<div class="tbl_size">
							<table>
								<thead>
									<tr>
										<th class="bd_r"></th>
										<th>XS</th>
										<th>S</th>
										<th>M</th>
										<th>L</th>
										<th>XL</th>
										<th>XXL</th>
									</tr>
									<tr>
										<th class="bd_r">상의</th>
										<th class="nbg">85</th>
										<th class="nbg">90</th>
										<th class="nbg">95</th>
										<th class="nbg">100</th>
										<th class="nbg">105</th>
										<th class="nbg">110</th>
									</tr>
									<tr>
										<th class="bd_r">하의</th>
										<th class="nbg">70</th>
										<th class="nbg">75</th>
										<th class="nbg">80</th>
										<th class="nbg">85</th>
										<th class="nbg">90</th>
										<th class="nbg">95</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="bd_r">키</th>
										<td>160 - 165</td>
										<td>165 - 170</td>
										<td>170 - 175</td>
										<td>175 - 180</td>
										<td>180 - 185</td>
										<td>185 - 190</td>
									</tr>
									<tr>
										<th class="bd_r">가슴둘레</th>
										<td>83 - 87</td>
										<td>88 - 91</td>
										<td>92 - 96</td>
										<td>97 - 101</td>
										<td>102 - 106</td>
										<td>107 - 111</td>
									</tr>
									<tr>
										<th class="bd_r">허리둘레</th>
										<td>70 - 74</td>
										<td>75 - 79</td>
										<td>80 - 84</td>
										<td>85 - 89</td>
										<td>90 - 94</td>
										<td>95 - 99</td>
									</tr>
									<tr>
										<th class="bd_r">엉덩이둘레</th>
										<td>84 - 88</td>
										<td>89 - 93</td>
										<td>94 - 98</td>
										<td>99 - 103</td>
										<td>104 - 108</td>
										<td>109 - 113</td>
									</tr>
									<tr>
										<th class="bd_r">다리길이(inseam)</th>
										<td>71</td>
										<td>72</td>
										<td>73</td>
										<td>74</td>
										<td>75.5</td>
										<td>77</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<!-- 여자 -->
						<p class="title">여자</p>
						<div class="tbl_size">
							<table>
								<thead>
									<tr>
										<th class="bd_r"></th>
										<th>XS</th>
										<th>S</th>
										<th>M</th>
										<th>L</th>
									</tr>
									<tr>
										<th class="bd_r">상의</th>
										<th class="nbg">85</th>
										<th class="nbg">90</th>
										<th class="nbg">95</th>
										<th class="nbg">100</th>
									</tr>
									<tr>
										<th class="bd_r">하의</th>
										<th class="nbg">70</th>
										<th class="nbg">75</th>
										<th class="nbg">80</th>
										<th class="nbg">85</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="bd_r">키</th>
										<td>150 - 155</td>
										<td>155 - 160</td>
										<td>160 - 165</td>
										<td>165 - 170</td>
									</tr>
									<tr>
										<th class="bd_r">가슴둘레</th>
										<td>84 - 87</td>
										<td>88 - 91</td>
										<td>92 - 95</td>
										<td>96 - 99</td>
									</tr>
									<tr>
										<th class="bd_r">허리둘레</th>
										<td>65 - 68</td>
										<td>69 - 72</td>
										<td>73 - 76</td>
										<td>77 - 80</td>
									</tr>
									<tr>
										<th class="bd_r">엉덩이둘레</th>
										<td>84 - 87</td>
										<td>88 - 91</td>
										<td>92 - 95</td>
										<td>96 - 99</td>
									</tr>
									<tr>
										<th class="bd_r">다리길이(inseam)</th>
										<td>72</td>
										<td>73</td>
										<td>74</td>
										<td>75</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- //여자 -->
						<p class="notice">※ 제품의 실측 사이즈가 아닌 각 사이즈에 맞는 신체 사이즈로 실 제품과 차이가 있을 수 있으므로 참고하시기 바랍니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>