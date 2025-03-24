# Github Actions ImmortalWrt

- ImmortalWrt source code is [hanwckf/immortalwrt-mt798x](https://github.com/hanwckf/immortalwrt-mt798x), MTK SDK, [Author introduction](https://cmi.hanwckf.top/p/immortalwrt-mt798x).
- Github Actions comes from [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt).

## Config file generation

- `make menuconfig`, generally select `Target System`, `Subtarget`, `Target Profile` first, and then select the `LUCI` plug-in.
- .config file generation can be done with WSL or Ubuntu virtual machine, execute the following command
```
sudo apt update
sudo apt upgrade -y
sudo apt-get -y install subversion libncurses5-dev git git-core build-essential unzip bzip2 python2.7
git clone --depth=1 https://github.com/1280-720/immortalwrt-mt798x.git
cd immortalwrt-mt798x
./scripts/feeds update -a && ./scripts/feeds install -a
cp -f defconfig/mt7981-ax3000.config .config
make menuconfig
make defconfig
./scripts/diffconfig.sh > seed.config
```
- Rename seed.config to .config and upload to the root of online repo

## Custom FILES
- Custom files "files method" compiles your custom configuration into the firmware. In this way, you do not need to keep the configuration when upgrading or restoring factory settings, and the default value is the custom configuration.
- If you compile your current network settings into the firmware: first extract `\etc\config\network` under the router firmware, then create a files directory in the project root directory and `push` to `\files\etc\config\network`, and the final compiled firmware is the current network setting.
- In addition, when using the "files method", it is best to set the repository to private, otherwise your configuration information, such as broadband account, will be public on the Internet.

## Related references

- [Super simple cloud compilation](https://github.com/281677160/build-openwrt)
- [Automatic compilation of OpenWrt online integration with GitHub Actions](https://github.com/KFERMercer/OpenWrt-CI)
- [qughij/openwrt-xiaoyu_xy-c5](https://github.com/qughij/openwrt-xiaoyu_xy-c5)
- [SuLingGG/OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi)
- [IvanSolis1989/OpenWrt-DIY](https://github.com/IvanSolis1989/OpenWrt-DIY)
- [garypang13/OpenWrt](https://github.com/garypang13/OpenWrt)
- [zlxj2000/Openwrt-firmware](https://github.com/zlxj2000/Openwrt-firmware)
- [SuLingGG/Action-OpenWrt-Plus](https://github.com/SuLingGG/Action-OpenWrt-Plus)
- [Lancenas/Actions-Lean-OpenWrt](https://github.com/Lancenas/Actions-Lean-OpenWrt)
- [Lancenas/actions-openwrt-helloworld](https://github.com/Lancenas/actions-openwrt-helloworld)
- [xiaorouji/openwrt-passwall](https://github.com/xiaorouji/openwrt-passwall)
- [kenzok8/openwrt-packages](https://github.com/kenzok8/openwrt-packages)
- [kenzok8/small](https://github.com/kenzok8/small)
- [Basic Git skills](https://www.liaoxuefeng.com/wiki/896043488029600)
- [Tutorial for beginners on how to use workflow to automatically compile lean_openwrt using Github_Action](https://zhuanlan.zhihu.com/p/94402324)
- [Configuration modification issues for Github Action to automatically compile Lean_Openwrt](https://zhuanlan.zhihu.com/p/94527343)
- [firker/diy-ziyong](https://github.com/firker/diy-ziyong)
- [xiaoqingfengATGH/feeds-xiaoqingfeng](https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng)

## Acknowledgments

- [Microsoft](https://www.microsoft.com)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cisco](https://www.cisco.com/)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [Lienol's OpenWrt](https://github.com/Lienol/openwrt)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © P3TERX
