# jx-offline

<p align="center">
 <a href="https://youtube.com/julianv"><img title="Julian-V" src="docs/Julian-V.png"></a><br>
 <a href="https://www.youtube.com/julianv?sub_confirmation=1"><img title="YouTube Channel Subscribers" src="https://img.shields.io/youtube/channel/subscribers/UC8QPaA8hLDhroGdBtAImmbQ"></a><br>
 <a href=""><img title="JX-Offline" src="https://img.shields.io/badge/Linux-%20?logo=visualstudiocode&logoColor=00BFFF&label=JX-Ofline&color=A52A2A"></a>
 <a href="#jx-offline"><img title="Version" src="https://img.shields.io/badge/8.2-%20?logo=hackthebox&label=Version&color=BA55D3"></a>
 <a href="LICENSE"><img title="License" src="https://img.shields.io/github/license/julianv22/jx-offline?logo=atom&label=License&labelColor=teal"></a>
 <a href="https://github.com/julianv22/jx-offline/actions/workflows/main.yml"><img title="Actions" src="https://github.com/julianv22/jx-offline/actions/workflows/main.yml/badge.svg"></a> 
 <a href="#"><img title="Commits" src="https://img.shields.io/github/commit-activity/t/julianv22/jx-offline?logo=git&label=Commits"></a>
 <a href="https://github.com/julianv22/jx-offline/commits/main"><img title="Last Commit" src="https://img.shields.io/github/last-commit/julianv22/jx-offline?logo=codacy&label=Last%20Commit&labelColor=2F4F4F"></a>
</p>

# README 

### Yêu cầu cần thiết:

Đã cài đặt jx-offline của [PYTA GAMING](https://www.youtube.com/watch?v=do5mFT4M3wc) phiên bản 8.2.

| Version | Supported          |
| ------- | ------------------ |
| 8.0.x   | :white_check_mark: |
| 8.2.x   | :white_check_mark: |
| 6.0   | Unknown                |

### Cần lưu ý:

> [!WARNING]
> Tương thích tốt nhất với phiên bản 8, những phiên bản khác có thể có những thay đổi trong **settings** dẫn đến kết quả sẽ khác khi sử dụng để lấy các item. </br></br>
> Đây chỉ là phần code nhỏ của một vài tính năng chứ không phải **full code**.

# Hướng dẫn cài đặt
> [!TIP]
> Tải bản release mới nhất [![(Download ZIP)](https://badgen.net/badge/Download/ZIP?icon=bitcoin-lightning)](https://github.com/julianv22/jx-offline/archive/refs/heads/main.zip) về và giải nén. Sau đó copy vào **client** và **server**. </br></br>
> Ngoài thư mục ***script, spr*** và file ***settings/maplist.ini*** ra thì các file và thư mục khác có thể không sao chép cũng được. </br></br>
> Các file này chỉ bao gồm những chỉnh sửa nhỏ không đáng kể và không làm thay đổi trải nghiệm. </br></br>
> [Add [Cẩm nang AIO]](#add-c%E1%BA%A9m-nang-aio-v%C3%A0o-magicscript) theo hướng dẫn bên dưới. </br></br>
> Reset server và trải nghiệm.

### Demo:

![Example 1](docs/ex1.png "Demo 1")
![Example 3](docs/ex2.png "Demo 2")
![Example 2](docs/ex3.png "Demo 3")
![Example 4](docs/ex4.png "Demo 4")
![Example 5](docs/ex5.png "Demo 5")

# Add [Cẩm nang AIO] vào [magicscript](client/settings/item/004/magicscript.txt)

Add dòng này vào cuối file **magicscript.txt**

| A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z | AA | AB | AC | AD |
| - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | -|
| CÈm nang AIO | 6 | 1 | 5128 | \spr\item\longmenbiaoju\»¤ïÚÁî.spr | 341 | 1 | 1 | CÈm nang tÊt c¶ trong mét. Writen by <bclr=blue>Julian-V<bclr> |  | 0 | 1 | 0 | \script\global\gm\julianv\main.lua | 0 | 1 | 1 | 0 | 1 |  | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

**Copy code:**
```js	
CÈm nang AIO	6	1	5128	\spr\item\longmenbiaoju\»¤ïÚÁî.spr	341	1	1	CÈm nang tÊt c¶ trong mét. Writen by <bclr=blue>Julian-V<bclr>		0	1	0	\script\global\gm\julianv\main.lua	0	1	1	0	1		0	0	0	0	0	0	0	0	0	0
```

> [!IMPORTANT]
> Item Id của lệnh bài là: ***{6,	1,	5128}*** có thể thay đổi tuỳ theo magicscript.txt của bạn.

# Tài liệu

https://jxdocs.com/admin

https://fb.com/groups/volamquan

https://fb.com/groups/pytagaming1

# Linh tinh

### [install.ps1](install.ps1)

Quick install work environments with PowerShell

### [settings-font.json](settings-font.json)

Setting font in VsCode

File Font: **.VnSourceCodePro-Regular.ttf**
