# SG2000用SDIOフレームバッファGPU

Milk-V Duo S SBC 用の FPGA ビデオカード プロトタイプ。  
SDIO 入力、RGB 8080 出力、LVDS パネル対応。

## 特徴

- SDIO経由でフレームバッファ受信
- FPGA内デュアルポートRAM使用
- LVDSブリッジ（例：DS90CR285）に接続可能なRGB出力
- Linux GPUスタック不要

---

# SDIO Framebuffer GPU for SG2000

FPGA video card prototype for Milk-V Duo S SBC.  
Uses SDIO input, RGB 8080-style output, and drives standard LVDS displays.

## Features

- Framebuffer transfer over SDIO
- Dual-port RAM inside FPGA
- RGB output compatible with LVDS bridge chips (e.g., DS90CR285 / LT8918B)
- Fully independent from Linux GPU stack
