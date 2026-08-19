#!/usr/bin/env bash
set -e

DEFAULTS="padavan-ng/trunk/user/shared/defaults.h"

echo "Applying China defaults..."

# Wi-Fi regulatory domain
sed -ri \
  -e 's|^#define[[:space:]]+DEF_WLAN_2G_CC[[:space:]]+".*"|#define DEF_WLAN_2G_CC        "CN"|' \
  -e 's|^#define[[:space:]]+DEF_WLAN_5G_CC[[:space:]]+".*"|#define DEF_WLAN_5G_CC        "CN"|' \
  "$DEFAULTS"

# Timezone and NTP servers
sed -ri \
  -e 's|^#define[[:space:]]+DEF_TIMEZONE[[:space:]]+".*"|#define DEF_TIMEZONE          "CST-8"|' \
  -e 's|^#define[[:space:]]+DEF_NTP_SERVER0[[:space:]]+".*"|#define DEF_NTP_SERVER0       "ntp.aliyun.com"|' \
  -e 's|^#define[[:space:]]+DEF_NTP_SERVER1[[:space:]]+".*"|#define DEF_NTP_SERVER1       "cn.pool.ntp.org"|' \
  -e 's|^#define[[:space:]]+DEF_NTP_SERVER2[[:space:]]+".*"|#define DEF_NTP_SERVER2       "cn.ntp.org.cn"|' \
  -e 's|^#define[[:space:]]+DEF_NTP_SERVER3[[:space:]]+".*"|#define DEF_NTP_SERVER3       "ntp.ntsc.ac.cn"|' \
  "$DEFAULTS"

echo "=== China defaults ==="
grep -E 'DEF_WLAN_(2G|5G)_CC|DEF_TIMEZONE|DEF_NTP_SERVER' "$DEFAULTS"
