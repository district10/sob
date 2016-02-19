Sob: Simple Org-mode Blog
-------------------------

具体看主页. 或者 [Simple Org-mode Blog](http://tangzx.qiniudn.com/org/index.html).

## Makefile

不能自动生成 post。可以参考 [orgit/Makefile at master · district10/orgit](https://github.com/district10/orgit/blob/master/Makefile)：

```makefile
$(PUBLISH)/%.html: $(PUBLISH)/%.org
	emacs --batch $< \
		--eval "(setq org-html-htmlize-output-type 'css)" \
		--eval '(setq org-html-htmlize-font-prefix "org-")' \
		--eval '(org-html-export-to-html)'
```

## 七牛配置

```json
{
    "src": "publish",
    "dest":  "qiniu:access_key=...&secret_key=...&bucket=tangzx&key_prefix=org/",
    "debug_level": 1
}
```

## 注意

不要更新此 repo。
