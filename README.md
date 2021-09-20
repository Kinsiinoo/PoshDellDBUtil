# PoshDellDBUtil - 0.2.0

<p align="center">
  <a href="https://github.com/Kinsiinoo/PoshDellDBUtil"><img src="https://img.shields.io/github/languages/top/kinsiinoo/poshdelldbutil?style=for-the-badge"></a>
  <a href="https://github.com/Kinsiinoo/PoshDellDBUtil"><img src="https://img.shields.io/github/languages/code-size/kinsiinoo/poshdelldbutil?style=for-the-badge"></a>
  <a href="https://github.com/Kinsiinoo/PoshDellDBUtil"><img src="https://img.shields.io/github/license/kinsiinoo/poshdelldbutil?style=for-the-badge"></a>
</p>

<p align="center">
  <a href="https://github.com/Kinsiinoo/PoshDellDBUtil/releases/"><img src="https://img.shields.io/github/v/release/kinsiinoo/poshdelldbutil?style=for-the-badge"></a>
  <a href="https://github.com/Kinsiinoo/PoshDellDBUtil"><img src="https://img.shields.io/github/last-commit/kinsiinoo/poshdelldbutil?style=for-the-badge"></a>
</p>

<p align="center">
  <a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-21551"><img src="https://img.shields.io/badge/CVE-2021--21551-orange?style=for-the-badge"></a>
  <a href="https://www.dell.com/support/kbdoc/hu-hu/000186019/dsa-2021-088-dell-client-platform-security-update-for-dell-driver-insufficient-access-control-vulnerability"><img src="https://img.shields.io/badge/DSA-2021--088-9cf?style=for-the-badge"></a>
</p>

Scan and removal module/tool for **DSA-2021-088** / **CVE-2021-21551**.

It scans all computer in a given OU for the vulnerable `dbutil_2_3.sys` file and remove it.

## Syntax

```PowerShell
Invoke-PoshDDClean [-ComputerOU] <string> [[-Clean]]  [<CommonParameters>]
```

## Usage

Scan mode:

```PowerShell
Invoke-PoshDDClean -ComputerOU "OU=Computers,OU=xx,DC=xx,DC=xx,DC=xx"
```

Scan and Clean mode:

```PowerShell
Invoke-PoshDDClean -ComputerOU "OU=Computers,OU=xx,DC=xx,DC=xx,DC=xx" -Clean
```

## Known issues

- ~~[#1](https://github.com/Kinsiinoo/PoshDellDBUtil/issues/1) `$Clean` variable~~

## Note

Use at your own risk!

I'm **NOT** responsible for any damage caused by this program!

## Changelog

**0.2.0:** Fixed a bug where the code did not pass the `$Clean` variable to `Invoke-Command` (st#pid mistake :upside_down_face: )

## License

PoshDellDBUtil is licensed under the MIT License.
