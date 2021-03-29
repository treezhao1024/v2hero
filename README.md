# v2hero  [![Build Status](https://travis-ci.org/onplus/v2hero.svg?branch=core-3.1)](https://travis-ci.org/onplus/v2hero)
本项目是一个[利用Travis-CI部署Docker到Heroku](https://github.com/onplus/v2hero/tree/core-3.8) 的学习示例。

客户端：
* 下载v2ray [v2ray build](https://github.com/v2fly/v2ray-core/releases/tag/v4.31.0)

* 配置:

```
#cat config.json
{
  "inbounds": [
    {
      "port": 1080,
      "listen": "127.0.0.1",
      "protocol": "socks",
      "sniffing": {
        "enabled": true,
        "destOverride": ["http", "tls"]
      },
      "settings": {
        "auth": "noauth",
        "udp": false
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "sshv2ray.herokuapp.com",
            "port": 443,
            "users": [
              {
                "id": "65f11be5-ac71-4f0c-874b-d93c610c66ef",
                "security": "auto",
                "alterId": 64
              }
            ]
          }

        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls"
      }
    }
  ]
}
                
```

* 执行
```
# v2ray --config=config.json
```

如果为您的学习提供了帮助，欢迎给一个Star ^_^

* 快捷部署
   [![](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/treezhao1024/v2hero)
 
* 提问&建议
   https://github.com/onplus/v2hero/issues
   发起issue前请尽量先使用文档和搜索

* 相关项目
   https://github.com/onplus/shadowsocks-heroku

* 实现参考 
   - https://github.com/v2ray/v2ray-core
   - https://github.com/wangyi2005/v2ray
   - Heroku 
      - https://devcenter.heroku.com/articles/container-registry-and-runtime
      - https://devcenter.heroku.com/articles/build-docker-images-heroku-yml
