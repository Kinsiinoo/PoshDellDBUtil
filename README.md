# PoshDellDBUtil

PoshDellDBUtil 0.2.0

Scan and removal tool for **DSA-2021-088** / **CVE-2021-21551**

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

## Changelog

**0.2.0:** Fixed a bug where the code did not pass the `$Clean` variable to `Invoke-Command` (st#pid mistake :upside_down_face: )

## Note

Use at your own risk!

I'm **NOT** responsible for any damage caused by this program!

## License

PoshDellDBUtil is licensed under the MIT License.
