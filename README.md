# navicat-tnt

navicat产品注册机，适用于Linux。

## 使用方法

### 提取安装包内容

提取 `navicat16-premium-en.AppImage` 里的所有文件到一个文件夹，例如 `./navicat16-premium-en-patched`:

```bash
mkdir ./navicat16-premium-en
sudo mount -o loop ./navicat16-premium-en.AppImage ./navicat16-premium-en
cp -r ./navicat16-premium-en ./navicat16-premium-en-patched
sudo umount ./navicat16-premium-en
rm -rf ./navicat16-premium-en
```

### 使用 `navicat-patcher` 替换官方公钥

```
Usage:
  navicat-patcher [OPTION...] <navicat root path> [RSA-2048 private key file]

--dry-run  Run patcher without applying any patches
  -h, --help  Print help
```

__例如：__

```bash
docker run --rm -it -v 提取安装包的文件路径:/work/ mrxianyu/navicat-tnt:latest navicat-patcher ./
```

### 将文件重新打包成AppImage

__例如：__

```bash
wget 'https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage'
chmod +x appimagetool-x86_64.AppImage
./appimagetool-x86_64.AppImage ./navicat16-premium-en-patched ./navicat16-premium-en-patched.AppImage
```

###  运行刚生成的AppImage

```bash
chmod +x ./navicat16-premium-en-patched.AppImage
./navicat16-premium-en-patched.AppImage
```

### 使用 `navicat-keygen` 来生成 __序列号__ 和 __激活码__。

```
Usage:
 navicat-keygen <--bin|-text> [--adv] <RSA-2048 private key file>

 <--bin|--text>  Specify "--bin" to generate "license_file" used by Navicat 11.
  Specify "--text" to generate base64-encoded activation code.
  This parameter is mandatory.

 [--adv]Enable advance mode.
  This parameter is optional.

 <RSA-2048 private key file> A path to an RSA-2048 private key file.
  This parameter is mandatory.
```

__例如：__

```bash
docker run --rm -it -v 生成的密钥的路径:/work/RegPrivateKey.pem mrxianyu/navicat-tnt:latest navicat-keygen --text ./RegPrivateKey.pem
```

你会被要求选择Navicat产品类别、Navicat语言版本和填写主版本号。之后一个随机生成的 __序列号__ 将会给出。

```
***************************************************
* navicat-keygen by @DoubleLabyrinth  *
* version: 16.0.7.0 *
***************************************************

[*] Select Navicat product:
 0. DataModeler
 1. Premium
 2. MySQL
 3. PostgreSQL
 4. Oracle
 5. SQLServer
 6. SQLite
 7. MariaDB
 8. MongoDB
 9. ReportViewer

(Input index)> 1

[*] Select product language:
 0. English
 1. Simplified Chinese
 2. Traditional Chinese
 3. Japanese
 4. Polish
 5. Spanish
 6. French
 7. German
 8. Korean
 9. Russian
 10. Portuguese

(Input index)> 0

[*] Input major version number:
(range: 11 ~ 16, default: 16)> 16

[*] Serial number:
NAVB-EZF4-7T7X-9MPG

[*] Your name:
```

你可以使用这个 __序列号__ 来暂时激活Navicat。

之后你会被要求填写 __用户名__ 和 __组织名__。你可以随意填写，但别太长。

```
[*] Your name: Double Sine
[*] Your organization: PremiumSoft CyberTech Ltd.

[*] Input request code in Base64: (Double press ENTER to end)
```

之后你会被要求填写请求码。__注意不要关闭keygen。__

### __断开网络__. 找到注册窗口，填写keygen给你的 __序列号__，然后点击 `激活`。

### 通常在线激活会失败，所以在弹出的提示中选择 `手动激活`。

### 复制 __请求码__ 到keygen，连按两次回车结束。

```
 [*] Input request code in Base64: (Double press ENTER to end)
 ds7CnjEnNL+8Rme9Q5iD+3t9Tfuq9W6FzVN/3UZwC5zzecmM9EwyHJuZSovKJNSBTzL6AiGyxliTuKPWmLqAdwiKGLuD+mSaZ0syk0jTakVbXmbAk9maFkTz8SK5jMwnQVM/WBZcI0z2Jg1GnOCZVClu/Lo3/WF+XncS+alc2gshG9dUaI44Cqfvp/u1/EYso5fX/bjeBXaFW1/zj+uuRjVv5l0gt7JsTh9byGVxSDTO4zI64Iz9+58QYCbI9zKM+3G9Gou0UlNKjDYw4gN5+4dpiWAjitVTcL3oQzvflgAXjGlT/P6MA+8Xb5PEPJrEdxsErJObxBhO4cTH52wKoQ==

 [*] Request Info:
 {"K":"NAVBEZF47T7X9MPG", "DI":"AFCFB038A240942D8776", "P":"linux"}

 [*] Response Info:
 {"K":"NAVBEZF47T7X9MPG","DI":"AFCFB038A240942D8776","N":"Double Sine","O":"PremiumSoft CyberTech Ltd.","T":1644837835}

 [*] Activation Code:
 OY8Ib0brsepeS99it4s4WTDPQuKgu93WembLJ0bzr6M30Wh24reH1/ocaZ2Ek1bRBi5lqu2xBv/MpAcFUlstJANtavArkFnXYv0ZZiF3VF70De5GMe/VjkreNhjCGtTZcQKr8fabBTPjJuN0P+Hi1xWwMs9zJMuH+MJTmCQpbM4gu86YrFK/EDcdHtA4ZFgUI0SgYW8lwFausLFHp7C4uIQNbjtv4KP3XolDUrAx4lqg6bklgZ9C8ZjUpg28VVR9Ym37b1Fup7Y7C8OjmmMiAp8N5z8m6cA/EjcSLfLOMGf8jsAK0GHz5/AGUqAXWifv9h9cxPA35UgytqI9F2IH/Q==
```

### 最终你会得到一个base64编码的 __激活码__。

 将之复制到 `手动激活` 的窗口，然后点击 `激活`。

 如果没有什么意外，应该可以成功激活。